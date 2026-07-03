Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A51C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 18:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD2810E640;
	Fri,  3 Jul 2026 18:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kuo4Aedt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53B10E640
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783103262; x=1814639262;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bf23QehB9vEGjPjz/hsgogYmrqNqbDKrdjVHMRnBeAA=;
 b=Kuo4AedtgTldm2njrWEtjBGjlm1TyoJyT2vlMofTsE2Zk8fnrdpi8nt2
 taschyXImhD5KalibAdRJctkO5+ebOZoeVrgshnj1lt4X6Wp/EC5JF8iv
 7fKN7b/sDdI/HIbvDhVRSQep8bKP9kg/Kg8ynGkDXfFKskuZGxAm0hCWw
 HixClch1yc+3b5HS3Hy5Webb/MsbdWzZgZ0R1EYDyMGKhgx++8/tO6Hon
 IfgEV/TnUGJrkW0QoNflwBQsoO/3RRyDq3Ud1EN3fBElbCfZNFHZwqMhX
 msjtaI2XySOGhjDTOYgC4dH47g3+9Y0Y9HRM5PYPBIbyC+oJU8Gqt4qN2 A==;
X-CSE-ConnectionGUID: 4X1JjwEcTYaKP1rqVuRBfA==
X-CSE-MsgGUID: 9jetkSdwSvCtnXUMPKgj7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83726443"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83726443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 11:27:42 -0700
X-CSE-ConnectionGUID: m3qxyaoyR2+9bKJ/ZMfkAg==
X-CSE-MsgGUID: LhNlkTDGS3Wjnl9viNtgeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253829064"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 11:27:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 11:27:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 11:27:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 11:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXGsyIgTP3BQEVbwqTuWLls6zwLecf7Sl6Xdd57lhGgsRymBWcW+G7LdhJXJLspyujQG2geD4qYRbKugHG+QBwSGYk+wiah9xpIF5TiQJr9nGJjq6t4E1Y+2O63BctvTkbGOpnaeOF7n9dwuZWQT3uu7gNk/XH8sYG1Es0/7+Y9syUzw+EkhGAwdu7X3/SXAKg83TloPkd1Dnd8myBBHhpKYsjhOCfnja9LN9ch1zfDQMU5+hK1QiY6Re8wqxZhx7dsT7mYBvnP9NJTw+Z1PC/EuupZzdLE+oppesb0g7Aq6pglNBo1mZ88jVhgFFs3txt7Wif+kZT4mmIBdjvcG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8vnU0YpIrFENzYGHIRIkzVr+P8esxbS/w9vORh+l7E=;
 b=yTGYTRZc1N+WZTw+I1asSv47/HNFfcuADIOr9ywXv2/q1CaQ/VZT5Cn+9Gz2kJPB1plcp5jsiHfMcPkO1r7975MdszZKigEy1CgyOdEwAnpe+Ly+VTZuIP7imls0EXTGU9pqQuh+PDu4KQ4wRX9o1AiwSROtyLHmLSL8P3A2FGc4nl3mID1jLe+JCJ/Jp/D/X8vBK50vDXlEtj/0aBxP4o2AtOakvpC7qY105kRjpQEudCwEPFxPVDb1TWUpV5dOYy7aruebVryRqUDCFgcE5W3xbImYQXxlP9A2avDxMI+hC5W+xEcsXax9Q+p/H5WHya0T2/aO4TXrxNvGNuVYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 18:27:38 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 18:27:38 +0000
Date: Fri, 3 Jul 2026 14:27:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v7] drm/xe/guc: Hold device ref until queue teardown
 completes
Message-ID: <akf_FtBIU-4IhIId@intel.com>
References: <20260624041029.2357470-1-arvind.yadav@intel.com>
 <ajtaGUaavUkXWVnI@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajtaGUaavUkXWVnI@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cbf0137-d16b-4323-2796-08ded930c268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xzZ1y3BmIvJHbpDQdIYuVYjR7IG1z+8C84xLbfLjmVoNLYVx1scbBZmrb8y2h9xdP0jK8peLRSsU+l4C7ErOY83NydswJoHlUEs6AI+4Z5V+ZHLixLBF8IpbH1Xfb5uBQbHeQ5G9eiVQ2MR6lk+/nwQpPSEm7w1k9B4U+FCP7kKwPtYnAbVGPSOmflcjwmGzQ7+cVCnE67o8ObLxbi3N0PRgCLc0M/DKggMWGUk4MqKrPFNKwe2OFkiWhYFPoowzmZ15t5EQu80IXXsoJELZstVZg8Qn7SRinZvzzd8JWyyAVzD5JVMAIYHcD5wrkmPqRmb//DvT3/5yJ6p+xnzCuQSbQDsut3DSXlfk+sLJA+3Rw9Ai9KX3uuLnXKvO4KHOT5rgKSBajearnKsQQZ2j2kZtHaq95BbWBVWrQBnaqcz7S8x5UYkEt6rikPfdKm7arevVi7lhUwX+VKqk/8NIWW92y78/Vi/tVMxa0QrjSSO4Kz7ozr716nBcZ7DGebkPszg9P9nSV22j4C3VQM8XYDxltiWt0zHFqBT8sTgiSZACYBE6PdLhVtXlUSUFr78suE9+few1ucYPfb2M2zUnIgNXAWh37Y+eAcH9TW9tEfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8dzqgwYqgHfqZNgb2veraqxJBayEVqdCwDzpikC4zOybGu2jkgUZhQZehi?=
 =?iso-8859-1?Q?N8CQEMR/M0kw39Xrsf38vSiZtVEvFBti3OqCk5nbEQbpe9k779Hsz4ap9u?=
 =?iso-8859-1?Q?QIT9I0dN/1gPSnBmVpLZVvdppHw146L6+Iojm4W6HXghMZAaNgq5dJ4M1H?=
 =?iso-8859-1?Q?XWMO1jaIaryi4n/h86uSR34A3fUowZ7kMPinib/25RjWK/82jg/lFph0JS?=
 =?iso-8859-1?Q?OHWKQ6pHk2HAfqpIhi2eM9tGCWS3z7UYCa6H0Qta/mgpMsOW8cInlvl80u?=
 =?iso-8859-1?Q?OMCp48meV8Fak2nB0/9UIFr9JtZ7m0znn5XDJJWU0O8W6kflal5jWS9i6k?=
 =?iso-8859-1?Q?90qmhLLtu6JUYs5kFmo8JjxijSPs/lG8RBwsoFDWxnLB+Lj4+xUXqChlyk?=
 =?iso-8859-1?Q?G0RHe9l5CnSUYRZpnPVPjpB6Af/Xg7rBjNsM8hLVBRTsOuYEVNL19Z+Z4W?=
 =?iso-8859-1?Q?2xBfMIXuUwRbg3ikmfjp4v5CXFZRCAbizhWwnxmsiWsa6NhWIrqhmSxnrL?=
 =?iso-8859-1?Q?PhfNYN44cxoK6cAlg+I4gXsipD8eWnF33wiMJ5Gw8vRpHFG9JOoMH2sGmF?=
 =?iso-8859-1?Q?65BkAtjtOSRm7NOMrVqcNXdl88heeUTaRgBkFBChxX5d/vhwcIfeePFv+N?=
 =?iso-8859-1?Q?mT305S/KusbZjkdD4675kmODnxKp9bPpTDY6ZdruQOaz7EHuRT+7GnjNuV?=
 =?iso-8859-1?Q?Hz/K+i1wMVNJa3nAyG7uTmJz5jm8x5atn14ieyMxg9HTPCgZw1ZJmXSb66?=
 =?iso-8859-1?Q?14Lsrsr83XjClA03Yqn1TpOmvLQrWHulRUIyOH/YTJlArOJslnOMLbLET9?=
 =?iso-8859-1?Q?T4kIM+jEBAY4LqTlT6H85kATTSktbtYfbsApDP8pg5VmEn0Ft+FLYDKZPP?=
 =?iso-8859-1?Q?ZIXMOUKKNitvtQgDU7SgqwdXnLsrCJ0PjN4+mwyJF7mkiuBLeXD3Q2oUkw?=
 =?iso-8859-1?Q?dkBJU1k9Tp8PMJONhWeNJGzqwfFA5h+nPl7I2gpbOc5FTLK8Xt2phNt4Dx?=
 =?iso-8859-1?Q?JOeEGGJTRadJkdzRGOX1fj9JYOnJ5p+K4FLx2IEwOVXOdwUs2DkmjHFvr9?=
 =?iso-8859-1?Q?41BOJ7hpUh7Uz7kPyn8w4HOcpIqnWicP+lfg5810RlteZBY0jEVdStotj1?=
 =?iso-8859-1?Q?DSHBBTmT7hmSFx/c520CdOvuv893ET0EGJZ2ocBU0mUvoeIrpapeDZ5Hhq?=
 =?iso-8859-1?Q?JhpqE1oBFXPf1zqsw9Q+AhQJHZkzT93NVkH/MpE4G1eH8I4c3cgnrHyFPL?=
 =?iso-8859-1?Q?3B6Hlmok3W8KewqsI6uGHDGrysbmF2PP8QbMgwSQtQs2jhDUY+bfA4vR5N?=
 =?iso-8859-1?Q?7aiUwKDETlyPIPd+fEyk8ZySn8Kk/kg3a7DKIAcwaASqN3ygUyYjNab0C5?=
 =?iso-8859-1?Q?fb0PKPTsXzHZptPul3+zx0NFndBEJh/xX7DMUT3x+IQ1kf5razvnQKAfRt?=
 =?iso-8859-1?Q?tH6SBCY1WhNR00p7mDEqfsBwPcJNviORUQFcrbAo6W7+UKw68sTmukH907?=
 =?iso-8859-1?Q?x7d8TFX+/fiwPt9DtW7ucHdo7biJ+p5GTEsfRLdvnJPDWsJmagMpBaxi37?=
 =?iso-8859-1?Q?3d1tCt5/cU5KrlG6JyKW6UzxD4q5m1J4tqpXLCrkSa3tNTCxwXpxkpP3Wo?=
 =?iso-8859-1?Q?7hnPc6UolMCf4v3M3GI7NLpAnlSZK57FfWJVRPkp0cuBbgBg0Hn4hG97/p?=
 =?iso-8859-1?Q?e7BalalmzB8DDtuco18uDMqS8XxZRr2PRFn5A7wE0jY0trwaA4KGTnwNGz?=
 =?iso-8859-1?Q?JaASvITo2lmrwrQKinxlHKUFr7fD8FdiqZJviyRX0XNxmnSSpqCHkSqVm7?=
 =?iso-8859-1?Q?KTMy4cOHBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: QRvqbHZklHGehCDHaQhXzIO/S497ASnkzccA9KtQPQ+53tuCXuAcZ3Epn6NdEHd/lHXHFqYqNhOwKRx8nWFpTaJQuJ6ALG7FjwOZxdd0kmKM0nQfrSPh+rmcfMFF0oghseZOXW0DAzpCHOG0hg1ks/n3XsHp/pCjYA/PEecNysrRMSOXr8WWeUxgTtaxvXA8/x/TbNTW3G7IRsJPeXuwQkYs1r5O9LhKp4O1HLP1opbywB0Z/KMnEeOLTYzrnvZk3eQoqVSyc3T2QliHwENXyNlGe5VQIRRyc+9ChG6D2AJ27AdOvJsgdzkMZ5tXvYM2fNxuACEA+l/z2yHC1lRhvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbf0137-d16b-4323-2796-08ded930c268
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:27:37.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LI0pz7uQLJpULWa1XRkW+kOAuqcU4eGJNFRzbcRfZzACRidVmLD7A5G5flb0CCthD6dkBkyQ8MD4uvBVNiNfGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 23, 2026 at 09:16:25PM -0700, Matthew Brost wrote:
> On Wed, Jun 24, 2026 at 09:40:29AM +0530, Arvind Yadav wrote:
> > GuC exec queue destruction can run asynchronously. If the final device
> > put happens from a destroy worker, drmm cleanup can end up draining
> > the same workqueue and deadlock.
> > 
> > Hold a drm_device reference for the queue lifetime and drop it after
> > queue teardown completes. This keeps drmm cleanup from running while
> > async destroy work is still pending.
> > 
> > Move destroy work to a module-lifetime Xe workqueue and flush it on
> > PCI remove so hot-unbind/rebind still waits for pending destroy work.
> > 
> > With queue-held device refs, guc_submit_sw_fini() cannot run with live
> > GuC IDs. Replace the fini wait with an assertion and remove the unused
> > fini_wq.
> > 
> > v2:
> >   - Rebase
> > 
> > v3:
> >   - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
> >   - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
> >   - Drop separate deferred drm_dev_put worker.
> >   - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
> > 
> > v4:
> >   - Replace the guc_submit_sw_fini() wait with an assertion and remove
> >     the now-unused fini_wq. (sashiko)
> > 
> > v5:
> >   - Move destroy work to a module-lifetime Xe workqueue instead of
> >     system_dfl_wq. (Matt)
> >   - Flush the module-lifetime destroy workqueue during PCI remove to
> >     preserve the old device-remove wait semantics.
> > 
> > v6:
> >   - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
> >     letting it outlive the xe_device/drm_device. (Sashiko)
> >   - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
> >     can be queued from the reclaim path.
> > 
> > v7:
> >   - Drop the per-device xe->destroy_wq and use the module-level destroy WQ
> >     for SVM pagemap destroy as well. (Matt)
> >   - Rename xe_exec_queue_destroy_wq_*() helpers to xe_destroy_wq_*()
> >     helpers because the WQ is no longer exec-queue specific. (Matt)
> > 
> > Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I was going to push this patch, but have you guys seen this:

https://sashiko.dev/#/patchset/20260624041029.2357470-1-arvind.yadav%40intel.com

?

> 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  6 +--
> >  drivers/gpu/drm/xe/xe_device_types.h |  3 --
> >  drivers/gpu/drm/xe/xe_guc_submit.c   | 66 ++++++++++++++++------------
> >  drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
> >  drivers/gpu/drm/xe/xe_module.c       | 50 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_module.h       |  5 +++
> >  drivers/gpu/drm/xe/xe_pci.c          |  6 +++
> >  drivers/gpu/drm/xe/xe_svm.c          |  3 +-
> >  8 files changed, 101 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 089872507bdd..0d8848e66d6b 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -469,9 +469,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> >  	if (xe->unordered_wq)
> >  		destroy_workqueue(xe->unordered_wq);
> >  
> > -	if (xe->destroy_wq)
> > -		destroy_workqueue(xe->destroy_wq);
> > -
> >  	ttm_device_fini(&xe->ttm);
> >  }
> >  
> > @@ -580,9 +577,8 @@ int xe_device_init_early(struct xe_device *xe)
> >  						       WQ_MEM_RECLAIM);
> >  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> >  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
> > -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
> >  	if (!xe->ordered_wq || !xe->unordered_wq ||
> > -	    !xe->preempt_fence_wq || !xe->destroy_wq) {
> > +	    !xe->preempt_fence_wq) {
> >  		/*
> >  		 * Cleanup done in xe_device_destroy via
> >  		 * drmm_add_action_or_reset register above
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 32dd2ffbc796..1ed993dffb52 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -355,9 +355,6 @@ struct xe_device {
> >  	/** @unordered_wq: used to serialize unordered work */
> >  	struct workqueue_struct *unordered_wq;
> >  
> > -	/** @destroy_wq: used to serialize user destroy work, like queue */
> > -	struct workqueue_struct *destroy_wq;
> > -
> >  	/** @tiles: device tiles */
> >  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index afe5d99cdd8b..982356513f3c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/circ_buf.h>
> >  #include <linux/dma-fence-array.h>
> >  
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_managed.h>
> >  
> >  #include "abi/guc_actions_abi.h"
> > @@ -37,6 +38,7 @@
> >  #include "xe_macros.h"
> >  #include "xe_map.h"
> >  #include "xe_mocs.h"
> > +#include "xe_module.h"
> >  #include "xe_pm.h"
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> > @@ -232,17 +234,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >  static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
> >  {
> >  	struct xe_guc *guc = arg;
> > -	struct xe_device *xe = guc_to_xe(guc);
> >  	struct xe_gt *gt = guc_to_gt(guc);
> > -	int ret;
> > -
> > -	ret = wait_event_timeout(guc->submission_state.fini_wq,
> > -				 xa_empty(&guc->submission_state.exec_queue_lookup),
> > -				 HZ * 5);
> >  
> > -	drain_workqueue(xe->destroy_wq);
> > -
> > -	xe_gt_assert(gt, ret);
> > +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
> >  
> >  	xa_destroy(&guc->submission_state.exec_queue_lookup);
> >  }
> > @@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
> >  
> >  	xa_init(&guc->submission_state.exec_queue_lookup);
> >  
> > -	init_waitqueue_head(&guc->submission_state.fini_wq);
> > -
> >  	primelockdep(guc);
> >  
> >  	guc->submission_state.initialized = true;
> > @@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
> >  	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
> >  				     q->guc->id, q->width);
> >  
> > -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
> > -		wake_up(&guc->submission_state.fini_wq);
> > -
> >  	mutex_unlock(&guc->submission_state.lock);
> >  }
> >  
> > @@ -1685,6 +1674,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
> >  {
> >  	struct xe_guc_exec_queue *ge = q->guc;
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct drm_device *drm = &guc_to_xe(guc)->drm;
> >  
> >  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> >  		struct xe_exec_queue_group *group = q->multi_queue.group;
> > @@ -1703,36 +1693,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
> >  	 * (timeline name).
> >  	 */
> >  	kfree_rcu(ge, rcu);
> > +
> > +	drm_dev_put(drm);
> >  }
> >  
> > -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> > +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
> >  {
> > -	struct xe_guc_exec_queue *ge =
> > -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> > -	struct xe_exec_queue *q = ge->q;
> > +	struct xe_guc_exec_queue *ge = q->guc;
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	struct drm_device *drm = &xe->drm;
> >  
> > -	guard(xe_pm_runtime)(guc_to_xe(guc));
> > -	trace_xe_exec_queue_destroy(q);
> > +	/*
> > +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
> > +	 * Keep the device alive until the PM-runtime guard unwinds.
> > +	 */
> > +	drm_dev_get(drm);
> >  
> > -	/* Confirm no work left behind accessing device structures */
> > -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> > +	scoped_guard(xe_pm_runtime, xe) {
> > +		trace_xe_exec_queue_destroy(q);
> >  
> > -	xe_exec_queue_fini(q);
> > +		/* Confirm no work left behind accessing device structures */
> > +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> > +
> > +		xe_exec_queue_fini(q);
> > +	}
> > +
> > +	drm_dev_put(drm);
> >  }
> >  
> > -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> > +static void __guc_exec_queue_destroy_async(struct work_struct *w)
> >  {
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	struct xe_device *xe = guc_to_xe(guc);
> > +	struct xe_guc_exec_queue *ge =
> > +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> > +
> > +	guc_exec_queue_do_destroy(ge->q);
> > +}
> >  
> > +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> > +{
> >  	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
> >  
> >  	/* We must block on kernel engines so slabs are empty on driver unload */
> >  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> > -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> > +		guc_exec_queue_do_destroy(q);
> >  	else
> > -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
> > +		xe_destroy_wq_queue(&q->guc->destroy_async);
> >  }
> >  
> >  static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
> > @@ -1927,6 +1933,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  {
> >  	struct xe_gpu_scheduler *sched;
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct drm_device *drm = &guc_to_xe(guc)->drm;
> >  	struct workqueue_struct *submit_wq = NULL;
> >  	struct xe_guc_exec_queue *ge;
> >  	long timeout;
> > @@ -1938,6 +1945,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  	if (!ge)
> >  		return -ENOMEM;
> >  
> > +	drm_dev_get(drm);
> > +
> >  	q->guc = ge;
> >  	ge->q = q;
> >  	init_rcu_head(&ge->rcu);
> > @@ -2014,6 +2023,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  	release_guc_id(guc, q);
> >  err_free:
> >  	kfree(ge);
> > +	drm_dev_put(drm);
> >  
> >  	return err;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > index c7b9642b41ba..31a2acb63ac3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > @@ -100,8 +100,6 @@ struct xe_guc {
> >  		 * even initialized - before that not even the lock is valid
> >  		 */
> >  		bool initialized;
> > -		/** @submission_state.fini_wq: submit fini wait queue */
> > -		wait_queue_head_t fini_wq;
> >  	} submission_state;
> >  
> >  	/** @hwconfig: Hardware config state */
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 4cb578182912..473be717e2c4 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> > +#include <linux/workqueue.h>
> >  
> >  #include <drm/drm_module.h>
> >  
> > @@ -91,6 +92,51 @@ static int xe_check_nomodeset(void)
> >  	return 0;
> >  }
> >  
> > +static struct workqueue_struct *xe_destroy_wq;
> > +
> > +static int __init xe_destroy_wq_module_init(void)
> > +{
> > +	xe_destroy_wq = alloc_workqueue("xe-destroy-wq",
> > +					WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
> > +	if (!xe_destroy_wq)
> > +		return -ENOMEM;
> > +	return 0;
> > +}
> > +
> > +static void xe_destroy_wq_module_exit(void)
> > +{
> > +	if (xe_destroy_wq)
> > +		destroy_workqueue(xe_destroy_wq);
> > +	xe_destroy_wq = NULL;
> > +}
> > +
> > +/**
> > + * xe_destroy_wq_queue() - Queue work on the destroy workqueue
> > + * @work: work item to queue
> > + *
> > + * The destroy workqueue has module lifetime and is used for async teardown
> > + * work that can outlive a single xe_device, such as GuC exec queue and SVM
> > + * pagemap destroy.
> > + *
> > + * Return: %true if @work was queued, %false if it was already pending.
> > + */
> > +bool xe_destroy_wq_queue(struct work_struct *work)
> > +{
> > +	return queue_work(xe_destroy_wq, work);
> > +}
> > +
> > +/**
> > + * xe_destroy_wq_flush() - Flush the destroy workqueue
> > + *
> > + * Drains all pending destroy work. Called from PCI remove to ensure
> > + * teardown ordering before the device is destroyed.
> > + */
> > +void xe_destroy_wq_flush(void)
> > +{
> > +	if (xe_destroy_wq)
> > +		flush_workqueue(xe_destroy_wq);
> > +}
> > +
> >  struct init_funcs {
> >  	int (*init)(void);
> >  	void (*exit)(void);
> > @@ -112,6 +158,10 @@ static const struct init_funcs init_funcs[] = {
> >  		.init = xe_sched_job_module_init,
> >  		.exit = xe_sched_job_module_exit,
> >  	},
> > +	{
> > +		.init = xe_destroy_wq_module_init,
> > +		.exit = xe_destroy_wq_module_exit,
> > +	},
> >  	{
> >  		.init = xe_register_pci_driver,
> >  		.exit = xe_unregister_pci_driver,
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 79cb9639c0f3..e8e54f701cf3 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -8,6 +8,8 @@
> >  
> >  #include <linux/types.h>
> >  
> > +struct work_struct;
> > +
> >  /* Module modprobe variables */
> >  struct xe_modparam {
> >  	bool force_execlist;
> > @@ -27,5 +29,8 @@ struct xe_modparam {
> >  
> >  extern struct xe_modparam xe_modparam;
> >  
> > +bool xe_destroy_wq_queue(struct work_struct *work);
> > +void xe_destroy_wq_flush(void);
> > +
> >  #endif
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 78fc2e4dcfc6..dc35f8a8c4b8 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1049,6 +1049,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  		return;
> >  
> >  	xe_device_remove(xe);
> > +
> > +	/*
> > +	 * Preserve remove-time flush after moving destroy work to module
> > +	 * lifetime.
> > +	 */
> > +	xe_destroy_wq_flush();
> >  	xe_pm_fini(xe);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index e1651e70c8f0..6ff99310fdb4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1732,10 +1732,9 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
> >  static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
> >  {
> >  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> > -	struct xe_device *xe = to_xe_device(dpagemap->drm);
> >  
> >  	if (from_atomic_or_reclaim)
> > -		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
> > +		xe_destroy_wq_queue(&xpagemap->destroy_work);
> >  	else
> >  		xe_pagemap_destroy_work(&xpagemap->destroy_work);
> >  }
> > -- 
> > 2.43.0
> > 
