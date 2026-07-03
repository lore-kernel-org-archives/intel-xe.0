Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4BDC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 22:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0138B10F9AE;
	Fri,  3 Jul 2026 22:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nq9DuUgL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F74310F9AE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 22:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783117693; x=1814653693;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V4vj8V3wosSlWHfzxRZIKz8KPz65MQ0XJK1Lty6nqS4=;
 b=nq9DuUgLzSoDqyM8lastb6qdxGZQAigqEbEjgnEA40DBzlMazOQKXbKy
 tGosnFabj7jp2Dug4t1CUubV70zoAMqrXZMDq5lF67BCZN1Ch0V7tGN3D
 O8sTuBfwYBkY3oRwPAABUQVWLcORS4SI/ZFvNXY81Pv76ODPtMRxvz9/B
 uxcQjRD1rIqPqghqVQJzuvXAyC0efTeB2AZfQPT2/Esotlwm309pIBAnw
 1nY8d981MDxnTgQDJmw2NzdOqHYbUZl9vbQdI2KSfPcIZMoAbpd0leUiX
 1ZYJxpGe9Fsprwc30LJjhSUf5T1ztHu39+6YR8br9DTuznmAcAiaBqLtJ w==;
X-CSE-ConnectionGUID: +z1/GXJtTCKj051XYuNMYA==
X-CSE-MsgGUID: sMTEWTNoRImfXBkICTuoHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83640302"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83640302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 15:28:13 -0700
X-CSE-ConnectionGUID: dM7azS7xQwqGh8tXCoq/Ig==
X-CSE-MsgGUID: 2w3zsFyGQ+mCmxpPxLVP9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257530175"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 15:28:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 15:28:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 15:28:12 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 15:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCyHT9oBVzClhb/gMT5ehUDPUXRr4QGYmxb1R1w+WZHjSd8rV5Qz8pzGRHEaphmVsSR2p5octo+rwUAHLpVenxkBj3eqnzoxlo0CXctav8uXqM8mKVdFXwhHyQkkuEO2vkVxr4Xn0ibJf6f+9olMAWdLUZI0wfMzIIHFMNdAtUW4lovjM2jjixvNbgZjJwUnQs+yUtRTgqZ/V+a3A+XEtWC8I/eVONVcogbJY/B6GIBRzE7bHHi/VUrWP72sN30UCED/86836pRmZnBAwzSvSa8qE8sAPM4Xp1+Nw8WvHNwdECXlNpI47K4Kg5ORIUQz86eoCGyhXdBaqXniVowQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCNl33dk6w4ZDENZLnapQcJ0wFHZO82dXLVCYSJMX38=;
 b=kBY39eTzkofNQwIqthPHl9VzcIqKV0J5LcslNqydBwt1hUEommsbn/2q+xPqrKMABQ5STFCVOcOkbG3As1sBAXbiTTnBITg2eITe4tjuX+AgilzLTft4Lz0ymauGwknG8EKdCB1n75xsaAlpwMORnrthpza1wE6U8JCx0sUhtxiYn6r4GiWogmIcvVgJFda0BARECkX4qo6ywPRQcHJfufKyhawuXvThHL/QYHJK9jzQKBpjomU4GEPHwzbkx5GINohmtZt1PKk3AfTUSC3Wd+MbJQG6LFIyIAkTZjFOC0G82LEoH3Qqp6iM9RYcReVuOAzClNJaH44Ua4m054uZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 22:28:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 22:28:09 +0000
Date: Fri, 3 Jul 2026 15:28:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v7] drm/xe/guc: Hold device ref until queue teardown
 completes
Message-ID: <akg3drhRXtTEBQPP@gsse-cloud1.jf.intel.com>
References: <20260624041029.2357470-1-arvind.yadav@intel.com>
 <ajtaGUaavUkXWVnI@gsse-cloud1.jf.intel.com>
 <akf_FtBIU-4IhIId@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akf_FtBIU-4IhIId@intel.com>
X-ClientProxiedBy: MW4PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:303:6b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 110b8022-c809-4c4d-7523-08ded9525c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0HN2O3M1DnTe3LN2vZi5RvvAFXoyvUomhRoPb56UduycvmLOdIfEC5Pg9pmqu50LldJd4uZ8vlE2H+RESsSmKfuwQFgSxNKwrnfzbqmvtz+4BS4VJ5wB0i7Xpn+26bElP49kxz+Zkc0Mh2CYxytpvsv6m1gjEDunLE4K8LYAj9XR5orJAGeNqqIzTmmJGPi7zNgful1/8deT2hUG/D/daclX/ra4rDfoFHBf1+x7GXsxJnltFJISwmgg3mcZbiLudFTIw9fyRFZV24YNwtOpptuMFN4cRAwndQamMOQQE+rNsxtmjyBuXCPvuRfVoxmbT6ytPDuKmtNRgypgYhCMtXy2ocZM+k++0YGAWqOZRtUCvs3j67CklnLf7F2gTY8zjcHT6ewRoo9rqFB3evqDJwQ4eYM8fuTEGiacK4KuTMqQLkEZZ/1+1JDDynvhIsOhsOy3Q1uE5D+H3SKKmGyuIkUAF1sf4jaiUtIykUZ+PAoG0uhEgi2KKcLfdJsqpSOoVR5iYFh50W3ikkV6AijG+W4k0x7KKOasN+6odi4hG4s3AYseQHT6iVbdZw8+dih/mRprPsYuaey9CtyX/7aL03rtr47c7+Eq+NPztOj+x2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GKFGR6otNN2MAWbb6jxAw/fIfQ1sHKwY/n0B+JO4mizt5IMcUgRnG8KSWX?=
 =?iso-8859-1?Q?CgB4169j8v+VDzwl7755o9WBbn2/p2t9tc7MbLDwst3a+PsSa5biJs3tGK?=
 =?iso-8859-1?Q?tlc3ReReoU9myR4HX/yHjfscDgt6QPma1UqZGZV8+c5MOXIt84vnMYE75z?=
 =?iso-8859-1?Q?i74k3VFVB69amzxqujYi9r6EkrQON4YuvlEaSEjYvXSG8C5XNTng42EUmS?=
 =?iso-8859-1?Q?O1KEF2erbr0dUTMfq+wtRSOxSjkBz6YEPT0jRBjdk6Cp47WQnEwWJwm7Td?=
 =?iso-8859-1?Q?UxyoVl5SnzDpWyf7WBlZMZh6d0Bsrn32GZv6mwR/MpuclrrewhNE2a1rLT?=
 =?iso-8859-1?Q?QtRxKHnZ1aD2efHkwDMUHIYJf+yX3pXe/ATJrfI+4qJ1D0QkfnrokV9TCO?=
 =?iso-8859-1?Q?owjKNZ9yPmEe3y8Ei/pMpb5qIehmz3v+944QtwWlZvLKCHTglJqV3NRbT/?=
 =?iso-8859-1?Q?AM+vFxjpCPdTLcfrNNUR9vI9fD+PILXrWcvhqszIeZP25sPnBnVNDj2Uhj?=
 =?iso-8859-1?Q?JBj9u8D5k05aSuPCrHPzV3fQPdx2hKlnqdNUl7U7A4i8jvnbZrsRQ9zX8E?=
 =?iso-8859-1?Q?FBawX8Lcegw58X9CrkqYjUt6iNgMK8ZJ54xqczviLN/Q17OZLB3tPR5nGs?=
 =?iso-8859-1?Q?+e9LTYBqj3FS3zvIlL80ylYr/eWLwHvU+9WJh4U/aJC52wve1uBbjyMzWr?=
 =?iso-8859-1?Q?CCJE3MjvZGG1PfP4f8f6KZxEhgxqXvi9Ny1QwJN0WK4aptYnMlRFODqMwn?=
 =?iso-8859-1?Q?F/E2vo4jyMroahoExKkqtML3D6Rnk0pKooUrbHlEVFyPzXEh6s/BhRIJ2i?=
 =?iso-8859-1?Q?fn+xQeU/OkUzCTitObJwXEoLwAkjBJgMR+yTMxrUbP1sCGb2Sko4H+3wux?=
 =?iso-8859-1?Q?G69fFScA7cH5zPTff1jSUJvqYv9lTzF/bQ6qBGCK43femsAUVJncl0eGOq?=
 =?iso-8859-1?Q?GJqHMj1EEVV4IZcW01c7ZLZs0rZM7N3LIqNqBBA1Qn7LCaUSccLc3tJ+X0?=
 =?iso-8859-1?Q?B1/tHwz2vFePaPumd3+MSub+54ZTg+otc1aa/mIioOTSjwbus6mu2g7kMn?=
 =?iso-8859-1?Q?/mfBH6KlO/MqLXgtcLVti4FW0fin5U9481dSIK1aHwTrM9V/lTO+jl2OTY?=
 =?iso-8859-1?Q?tcsb9pFOIMnWyJMhmWuZjvmUUL8KulvuZfDcKmbeldF92rwX41aQfwqWOy?=
 =?iso-8859-1?Q?fKRzi8/KSbykBvNXiTNCPp0FGjhxnn269BtMpzbXpvx/Ct0zZiFQqHEViZ?=
 =?iso-8859-1?Q?wCYgMPs+o1cOQds1PE/otGMlMay5YGoLa9vZSblUBDt9ilNNMpQvB5D+Oo?=
 =?iso-8859-1?Q?K2BK++HtFLQtn2SYfbwoPub8/OiafktagaGBkxmMZHZp8aF0fk0Df3JeTD?=
 =?iso-8859-1?Q?Y0Jk9KrIAiG4pi/IhTRQVdIyIgkYlbDzq/C18LcHV/po5YXC2O79XaxMtE?=
 =?iso-8859-1?Q?mv1GGgbqY/lkZVo9OhM669mWGAl2J0D+3G1+0K+V08CGWzczfM00oXT5KE?=
 =?iso-8859-1?Q?vHrLQq2xhtof+0/ME0pbU1YfM7jIri0UlmmknymOcOdk4hO86qLu6OdYGo?=
 =?iso-8859-1?Q?Fg5TKZgLJ75o9oG97/ILBQX3bxMdoO+7ycADyLXLAZ9Tux5gfKju+bUOLW?=
 =?iso-8859-1?Q?8nVJFqrs9nspb35Zv2m7KFA3b0Fm5McqPwIpEEnObbtk7PFvPS37+Zqwj/?=
 =?iso-8859-1?Q?rAA1RiKVd8mwIt9NxJ4zYhq2tHaVQpOJ47GQF081+ba5h35vLmLHzUJCvR?=
 =?iso-8859-1?Q?ngFNhSshUg+RPOxD6fk8xa+I+cqyKmkVvA/6vaMtatxNc3MwEgskxgfoPJ?=
 =?iso-8859-1?Q?0aAAYAy/bQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: kzFF2Cu0rMsOZjio7vzoRa4kPcBZj8mUSJUWI5lswFilmnqhFJ1HnQxwrpT28nFAKeB+xT2nwOSbn11PnBhQrPyFXMq5biQj6N2jh7wgJJomxz7e+uhqm5iXgcKqIo96A7rnPw1e4li2Gnbb2Pt6xProZJgIFPHmVipsrtOvShqenkFsJJICEXCUEixmsIE21ivnGCWegDmwWdwstViFVbyHMk/73HYwkSVJV2zzRDdwYIgQRzoQxq+aEWgzgEPG2wcBe5KZor5m2wVquyklcVCDZ4vCzyPcf0FRkgC+ZgG5wVSGfxcUl7DU3rKOg0D0MoABnSjDpu9/lHDTQ5C4ww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 110b8022-c809-4c4d-7523-08ded9525c64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 22:28:09.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nH7LTfAsMTSelU3lk3X8CUmUI7ryBksW5tTZY9HrBTGDpil35p2Ct7HksC/5QwSsG7i/wp3YP4PsaN2woZp0KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

On Fri, Jul 03, 2026 at 02:27:34PM -0400, Rodrigo Vivi wrote:
> On Tue, Jun 23, 2026 at 09:16:25PM -0700, Matthew Brost wrote:
> > On Wed, Jun 24, 2026 at 09:40:29AM +0530, Arvind Yadav wrote:
> > > GuC exec queue destruction can run asynchronously. If the final device
> > > put happens from a destroy worker, drmm cleanup can end up draining
> > > the same workqueue and deadlock.
> > > 
> > > Hold a drm_device reference for the queue lifetime and drop it after
> > > queue teardown completes. This keeps drmm cleanup from running while
> > > async destroy work is still pending.
> > > 
> > > Move destroy work to a module-lifetime Xe workqueue and flush it on
> > > PCI remove so hot-unbind/rebind still waits for pending destroy work.
> > > 
> > > With queue-held device refs, guc_submit_sw_fini() cannot run with live
> > > GuC IDs. Replace the fini wait with an assertion and remove the unused
> > > fini_wq.
> > > 
> > > v2:
> > >   - Rebase
> > > 
> > > v3:
> > >   - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
> > >   - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
> > >   - Drop separate deferred drm_dev_put worker.
> > >   - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
> > > 
> > > v4:
> > >   - Replace the guc_submit_sw_fini() wait with an assertion and remove
> > >     the now-unused fini_wq. (sashiko)
> > > 
> > > v5:
> > >   - Move destroy work to a module-lifetime Xe workqueue instead of
> > >     system_dfl_wq. (Matt)
> > >   - Flush the module-lifetime destroy workqueue during PCI remove to
> > >     preserve the old device-remove wait semantics.
> > > 
> > > v6:
> > >   - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
> > >     letting it outlive the xe_device/drm_device. (Sashiko)
> > >   - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
> > >     can be queued from the reclaim path.
> > > 
> > > v7:
> > >   - Drop the per-device xe->destroy_wq and use the module-level destroy WQ
> > >     for SVM pagemap destroy as well. (Matt)
> > >   - Rename xe_exec_queue_destroy_wq_*() helpers to xe_destroy_wq_*()
> > >     helpers because the WQ is no longer exec-queue specific. (Matt)
> > > 
> > > Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> I was going to push this patch, but have you guys seen this:
> 
> https://sashiko.dev/#/patchset/20260624041029.2357470-1-arvind.yadav%40intel.com
> 

It very hard to reason if this is correct, but in general for safety we
should likely call xe_destroy_wq_flush in the a devmem fini handler that
is registered very early early during device probe so an latent cleanup
or we should hold drm ref while is xe_pagemap is alive, or perhaps both.

Matt

> ?
> 
> > 
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c       |  6 +--
> > >  drivers/gpu/drm/xe/xe_device_types.h |  3 --
> > >  drivers/gpu/drm/xe/xe_guc_submit.c   | 66 ++++++++++++++++------------
> > >  drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
> > >  drivers/gpu/drm/xe/xe_module.c       | 50 +++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_module.h       |  5 +++
> > >  drivers/gpu/drm/xe/xe_pci.c          |  6 +++
> > >  drivers/gpu/drm/xe/xe_svm.c          |  3 +-
> > >  8 files changed, 101 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 089872507bdd..0d8848e66d6b 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -469,9 +469,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> > >  	if (xe->unordered_wq)
> > >  		destroy_workqueue(xe->unordered_wq);
> > >  
> > > -	if (xe->destroy_wq)
> > > -		destroy_workqueue(xe->destroy_wq);
> > > -
> > >  	ttm_device_fini(&xe->ttm);
> > >  }
> > >  
> > > @@ -580,9 +577,8 @@ int xe_device_init_early(struct xe_device *xe)
> > >  						       WQ_MEM_RECLAIM);
> > >  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> > >  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
> > > -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
> > >  	if (!xe->ordered_wq || !xe->unordered_wq ||
> > > -	    !xe->preempt_fence_wq || !xe->destroy_wq) {
> > > +	    !xe->preempt_fence_wq) {
> > >  		/*
> > >  		 * Cleanup done in xe_device_destroy via
> > >  		 * drmm_add_action_or_reset register above
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 32dd2ffbc796..1ed993dffb52 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -355,9 +355,6 @@ struct xe_device {
> > >  	/** @unordered_wq: used to serialize unordered work */
> > >  	struct workqueue_struct *unordered_wq;
> > >  
> > > -	/** @destroy_wq: used to serialize user destroy work, like queue */
> > > -	struct workqueue_struct *destroy_wq;
> > > -
> > >  	/** @tiles: device tiles */
> > >  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index afe5d99cdd8b..982356513f3c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/circ_buf.h>
> > >  #include <linux/dma-fence-array.h>
> > >  
> > > +#include <drm/drm_drv.h>
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "abi/guc_actions_abi.h"
> > > @@ -37,6 +38,7 @@
> > >  #include "xe_macros.h"
> > >  #include "xe_map.h"
> > >  #include "xe_mocs.h"
> > > +#include "xe_module.h"
> > >  #include "xe_pm.h"
> > >  #include "xe_ring_ops_types.h"
> > >  #include "xe_sched_job.h"
> > > @@ -232,17 +234,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > >  static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
> > >  {
> > >  	struct xe_guc *guc = arg;
> > > -	struct xe_device *xe = guc_to_xe(guc);
> > >  	struct xe_gt *gt = guc_to_gt(guc);
> > > -	int ret;
> > > -
> > > -	ret = wait_event_timeout(guc->submission_state.fini_wq,
> > > -				 xa_empty(&guc->submission_state.exec_queue_lookup),
> > > -				 HZ * 5);
> > >  
> > > -	drain_workqueue(xe->destroy_wq);
> > > -
> > > -	xe_gt_assert(gt, ret);
> > > +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
> > >  
> > >  	xa_destroy(&guc->submission_state.exec_queue_lookup);
> > >  }
> > > @@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
> > >  
> > >  	xa_init(&guc->submission_state.exec_queue_lookup);
> > >  
> > > -	init_waitqueue_head(&guc->submission_state.fini_wq);
> > > -
> > >  	primelockdep(guc);
> > >  
> > >  	guc->submission_state.initialized = true;
> > > @@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
> > >  	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
> > >  				     q->guc->id, q->width);
> > >  
> > > -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
> > > -		wake_up(&guc->submission_state.fini_wq);
> > > -
> > >  	mutex_unlock(&guc->submission_state.lock);
> > >  }
> > >  
> > > @@ -1685,6 +1674,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
> > >  {
> > >  	struct xe_guc_exec_queue *ge = q->guc;
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	struct drm_device *drm = &guc_to_xe(guc)->drm;
> > >  
> > >  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > >  		struct xe_exec_queue_group *group = q->multi_queue.group;
> > > @@ -1703,36 +1693,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
> > >  	 * (timeline name).
> > >  	 */
> > >  	kfree_rcu(ge, rcu);
> > > +
> > > +	drm_dev_put(drm);
> > >  }
> > >  
> > > -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> > > +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
> > >  {
> > > -	struct xe_guc_exec_queue *ge =
> > > -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> > > -	struct xe_exec_queue *q = ge->q;
> > > +	struct xe_guc_exec_queue *ge = q->guc;
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	struct drm_device *drm = &xe->drm;
> > >  
> > > -	guard(xe_pm_runtime)(guc_to_xe(guc));
> > > -	trace_xe_exec_queue_destroy(q);
> > > +	/*
> > > +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
> > > +	 * Keep the device alive until the PM-runtime guard unwinds.
> > > +	 */
> > > +	drm_dev_get(drm);
> > >  
> > > -	/* Confirm no work left behind accessing device structures */
> > > -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> > > +	scoped_guard(xe_pm_runtime, xe) {
> > > +		trace_xe_exec_queue_destroy(q);
> > >  
> > > -	xe_exec_queue_fini(q);
> > > +		/* Confirm no work left behind accessing device structures */
> > > +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> > > +
> > > +		xe_exec_queue_fini(q);
> > > +	}
> > > +
> > > +	drm_dev_put(drm);
> > >  }
> > >  
> > > -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> > > +static void __guc_exec_queue_destroy_async(struct work_struct *w)
> > >  {
> > > -	struct xe_guc *guc = exec_queue_to_guc(q);
> > > -	struct xe_device *xe = guc_to_xe(guc);
> > > +	struct xe_guc_exec_queue *ge =
> > > +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> > > +
> > > +	guc_exec_queue_do_destroy(ge->q);
> > > +}
> > >  
> > > +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> > > +{
> > >  	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
> > >  
> > >  	/* We must block on kernel engines so slabs are empty on driver unload */
> > >  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> > > -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> > > +		guc_exec_queue_do_destroy(q);
> > >  	else
> > > -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
> > > +		xe_destroy_wq_queue(&q->guc->destroy_async);
> > >  }
> > >  
> > >  static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
> > > @@ -1927,6 +1933,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > >  {
> > >  	struct xe_gpu_scheduler *sched;
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	struct drm_device *drm = &guc_to_xe(guc)->drm;
> > >  	struct workqueue_struct *submit_wq = NULL;
> > >  	struct xe_guc_exec_queue *ge;
> > >  	long timeout;
> > > @@ -1938,6 +1945,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > >  	if (!ge)
> > >  		return -ENOMEM;
> > >  
> > > +	drm_dev_get(drm);
> > > +
> > >  	q->guc = ge;
> > >  	ge->q = q;
> > >  	init_rcu_head(&ge->rcu);
> > > @@ -2014,6 +2023,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > >  	release_guc_id(guc, q);
> > >  err_free:
> > >  	kfree(ge);
> > > +	drm_dev_put(drm);
> > >  
> > >  	return err;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > > index c7b9642b41ba..31a2acb63ac3 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > > @@ -100,8 +100,6 @@ struct xe_guc {
> > >  		 * even initialized - before that not even the lock is valid
> > >  		 */
> > >  		bool initialized;
> > > -		/** @submission_state.fini_wq: submit fini wait queue */
> > > -		wait_queue_head_t fini_wq;
> > >  	} submission_state;
> > >  
> > >  	/** @hwconfig: Hardware config state */
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > index 4cb578182912..473be717e2c4 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -7,6 +7,7 @@
> > >  
> > >  #include <linux/init.h>
> > >  #include <linux/module.h>
> > > +#include <linux/workqueue.h>
> > >  
> > >  #include <drm/drm_module.h>
> > >  
> > > @@ -91,6 +92,51 @@ static int xe_check_nomodeset(void)
> > >  	return 0;
> > >  }
> > >  
> > > +static struct workqueue_struct *xe_destroy_wq;
> > > +
> > > +static int __init xe_destroy_wq_module_init(void)
> > > +{
> > > +	xe_destroy_wq = alloc_workqueue("xe-destroy-wq",
> > > +					WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
> > > +	if (!xe_destroy_wq)
> > > +		return -ENOMEM;
> > > +	return 0;
> > > +}
> > > +
> > > +static void xe_destroy_wq_module_exit(void)
> > > +{
> > > +	if (xe_destroy_wq)
> > > +		destroy_workqueue(xe_destroy_wq);
> > > +	xe_destroy_wq = NULL;
> > > +}
> > > +
> > > +/**
> > > + * xe_destroy_wq_queue() - Queue work on the destroy workqueue
> > > + * @work: work item to queue
> > > + *
> > > + * The destroy workqueue has module lifetime and is used for async teardown
> > > + * work that can outlive a single xe_device, such as GuC exec queue and SVM
> > > + * pagemap destroy.
> > > + *
> > > + * Return: %true if @work was queued, %false if it was already pending.
> > > + */
> > > +bool xe_destroy_wq_queue(struct work_struct *work)
> > > +{
> > > +	return queue_work(xe_destroy_wq, work);
> > > +}
> > > +
> > > +/**
> > > + * xe_destroy_wq_flush() - Flush the destroy workqueue
> > > + *
> > > + * Drains all pending destroy work. Called from PCI remove to ensure
> > > + * teardown ordering before the device is destroyed.
> > > + */
> > > +void xe_destroy_wq_flush(void)
> > > +{
> > > +	if (xe_destroy_wq)
> > > +		flush_workqueue(xe_destroy_wq);
> > > +}
> > > +
> > >  struct init_funcs {
> > >  	int (*init)(void);
> > >  	void (*exit)(void);
> > > @@ -112,6 +158,10 @@ static const struct init_funcs init_funcs[] = {
> > >  		.init = xe_sched_job_module_init,
> > >  		.exit = xe_sched_job_module_exit,
> > >  	},
> > > +	{
> > > +		.init = xe_destroy_wq_module_init,
> > > +		.exit = xe_destroy_wq_module_exit,
> > > +	},
> > >  	{
> > >  		.init = xe_register_pci_driver,
> > >  		.exit = xe_unregister_pci_driver,
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > index 79cb9639c0f3..e8e54f701cf3 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -8,6 +8,8 @@
> > >  
> > >  #include <linux/types.h>
> > >  
> > > +struct work_struct;
> > > +
> > >  /* Module modprobe variables */
> > >  struct xe_modparam {
> > >  	bool force_execlist;
> > > @@ -27,5 +29,8 @@ struct xe_modparam {
> > >  
> > >  extern struct xe_modparam xe_modparam;
> > >  
> > > +bool xe_destroy_wq_queue(struct work_struct *work);
> > > +void xe_destroy_wq_flush(void);
> > > +
> > >  #endif
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 78fc2e4dcfc6..dc35f8a8c4b8 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -1049,6 +1049,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
> > >  		return;
> > >  
> > >  	xe_device_remove(xe);
> > > +
> > > +	/*
> > > +	 * Preserve remove-time flush after moving destroy work to module
> > > +	 * lifetime.
> > > +	 */
> > > +	xe_destroy_wq_flush();
> > >  	xe_pm_fini(xe);
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index e1651e70c8f0..6ff99310fdb4 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -1732,10 +1732,9 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
> > >  static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
> > >  {
> > >  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> > > -	struct xe_device *xe = to_xe_device(dpagemap->drm);
> > >  
> > >  	if (from_atomic_or_reclaim)
> > > -		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
> > > +		xe_destroy_wq_queue(&xpagemap->destroy_work);
> > >  	else
> > >  		xe_pagemap_destroy_work(&xpagemap->destroy_work);
> > >  }
> > > -- 
> > > 2.43.0
> > > 
