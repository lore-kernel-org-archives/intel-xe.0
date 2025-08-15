Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920BECA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 22:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850710E295;
	Fri, 15 Aug 2025 22:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jv1fEwQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29B10E295
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755295333; x=1786831333;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oewkzrPxg76+N2WLfu2poReN1vceeUhoKTz/A7Rg6ho=;
 b=Jv1fEwQWUzAaz8wPyddCe9ySifnb8yfCl20tAOaemK0Luv6Q0te1gvA7
 GPxyN5aN+c6QTbRM4BRk6bi7MQXuTDlJ72NbNXPeIPWlz1v74LC7PcKch
 7NLho1TRjS2vWMSDECB27bQYGliE1G+RqrX/P20Kq0JsjQkaK1ELqkgb3
 OWAA7Q8nA6A7h0rxsReGwv80E0w8t4MY94ImcT/tRAhhrGfAAAwPSiEHW
 N0m3rMibptOVQ9uLfIeXhvk62PZ0gcAp//krfNhohmhLO+hxmvJnd1P6S
 FXC6lTt0mQAo4w7ezV5LWMWRu0fwK7pLW3uePaaonKi43NzeAQSsrCbUy g==;
X-CSE-ConnectionGUID: axV1yP6MRCi1LdCQTxdyRQ==
X-CSE-MsgGUID: +t8mFlnqTtKlE7HEAWEv/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61431549"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61431549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:02:12 -0700
X-CSE-ConnectionGUID: QwG92aqoSCiIaaUxe7MkzQ==
X-CSE-MsgGUID: wXwdDk3ATVu8YqrTnE+17A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167487468"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:02:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:01:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 15:01:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJXkURxj2M10j79e9iuxUZB3uxBcGSe4mvCqIQB7/Dw1MWuFXxotaPkl0rIxSVuKFCACAJhigKXgxTyZmCn9GVCde7BECWwUO+r45BNoZqrXNTScrjojUTgvrHiMUHsQrsBLayfA8+LvVaoXZJWeDV5PqrhcR98CGEBGMAfPqXPG60Du3LYOt8IDlN17c7ScWJpykdtDxaDSMIKKzak2MLo8n9PfQe6rFl54nLMq/f23mirde1822r6K3DzvNUablIeYnPw/Tuduip+OYV079uF82a95aOofxWcjyrKeOP7J8cpl4FlW55vECxfYStmRdPU/XPK8g0pz0xcCVnLv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwfEx3mb4XDwLa4ds7Ec1ZsjYfO4uKB4E1JucaiDwQ8=;
 b=V6bVhj90NOhXjlqlybmchpx7vUGeijgBcZMnFsTK9AJc1+upCi88kIANJHOSPz1OVQbHpE9bqiM/o8lHEqS7wcynQ64ZWB5LW6Vutk/+4OGtvG/TiUVwvx+wxv0bj8dlPWBII27buspDB+3vt5VCkn37qSZsypZgtA03hFO2KGaSrxZNIJS5X1So0neDvYatCwPvRyISj19m91/QUrs2zmYN4Ulpd77AgbFF1GkdGRlijABajvegkbzWHsSLGmlAqF+xDTgCJ7MTZbRKDXPLa+/p83mSppqMmn/w+RQNh4H5MToERA+KyVh05tWkI1QTp/R2lTdHOdCrU4hKFKIA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:01:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 22:01:36 +0000
Date: Fri, 15 Aug 2025 15:01:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Summers
 Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH v5] drm/xe/guc: Add devm release action to safely tear
 down CT
Message-ID: <aJ+uPfb+Q/eB1RuP@lstrano-desk.jf.intel.com>
References: <20250813101225.16638-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813101225.16638-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW2PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:302:1::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9eac56-a2c0-43fb-ad0f-08dddc474da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?srQo3gDuwByHK97s/q8tSs3PsvNzaxMdIdIPx87k4jcuGNjUN65DUyW6YRCb?=
 =?us-ascii?Q?ayp6kGD4acGQO58MX+98Ix378tn2JIyN6L4smz58qZdxyFY5ofNnjia3HJ72?=
 =?us-ascii?Q?+++IybBSSTcaUrspamJLwrlmz3yln9Hl1N3CzCd6qeeUDcD7v7me9PconoDM?=
 =?us-ascii?Q?ASs1NNzaKU7PGVzK/OAvVtQfv/vqhPQU7wwvPUK0V0Qzhuu0D5RR2j04kn38?=
 =?us-ascii?Q?n+T5wceyE+hEgCdTeK7oMj1iVt8cz4q04R2jywqG5zBXGIEVIR29I6OvaYpE?=
 =?us-ascii?Q?l4qRr5br2khsdr0soIPZRIdM8/HvZQF/+MZ4NmCffoxv+ZpeJVYvL0QRnkHE?=
 =?us-ascii?Q?rVMUU0pRlkzNO9NjqI5UJt+ENbyugI4qJWJk3ZgBb+V56q2nfi4vTH/sVlYJ?=
 =?us-ascii?Q?isoTLBBh/y0C3XhSSzMblEyxbTUryePA2YyyYHP4Rc4Cs6pZ3DY5BNxjGhsc?=
 =?us-ascii?Q?QXTZojdxgzbRtBIoq0z8ZsK8wNXgyY4GPTsfIXA98o75fgdQ+pLAP7PaXput?=
 =?us-ascii?Q?5PIAOmLL/pr/A29ruN9BkImK6cvTv5C3pYDAvATWluy98heztJedJUnCQs67?=
 =?us-ascii?Q?EoCj1oakR7AP4cViluk9HFlHBUGXOlSiVf566y/wtVpCpKOKvgO4xJsyAs3O?=
 =?us-ascii?Q?Vws8pMxyaxh4q8Q1onCPfnAa5VsjXkwrJP8Vc9Wo60CxwMfArjNxyi3SZlnY?=
 =?us-ascii?Q?OJ2CS4XQuzhrUgX/LsZj4Q3J3LJT6AY29jXtP171yG+tGF9x1jk3jmKc03kd?=
 =?us-ascii?Q?oTM6qJ8+pzzHj5BTxLQkeuOUjQdF4tdk6dS0eSm2eE88ANX7ra6g5jbL0g5P?=
 =?us-ascii?Q?PWo0qO1zD0yDgs0LArZfQwEe0syR7hyLqGO/S0HB4KgtmuhVT4pqqgNx+/N4?=
 =?us-ascii?Q?3ebz4GX9WMwgQZO1XkdYE15+RDdeMzWt6f/itJeYlVs5PJely4IOgG/k7+1/?=
 =?us-ascii?Q?STv7hKuUw7VGVPQPIx+AN5s8BGO0Vlw/d+nu1YqiMfn3/maRBtt3g6+Wtg1D?=
 =?us-ascii?Q?5c6JOeFDZ+lohaTe7qP2NJ6ygeo2qPOmMVKFqoIMSJDzSxAZ0RG6+7NdsWTZ?=
 =?us-ascii?Q?1EyY+op9JW5EOU6V5PJ1Ta3JL9o8t//gQcQ6CMhItLK0Li4wOGkqj/75E7YF?=
 =?us-ascii?Q?ZTi4YGHiMt9Qds94iRzVCWoA8IQxG0mSphyaKZ9jT/5voioYq1yENUnnJ9SD?=
 =?us-ascii?Q?a90iCavh7FyGaeGj0R9bU6UGSc95c809bdbd8Rfmqqh2LAxgvZPiQMLou8MT?=
 =?us-ascii?Q?QKQ9F9+xIeiNRYKkEmi9mexQ0urFDetYjvV3fH3S6358i9elbFbET7JgLv3O?=
 =?us-ascii?Q?ODyFe/NPvlAL2fGF5TlTt3w0g+FL29mSnIgqFUgGjYDFAmq5Pc4QEr7bHdwi?=
 =?us-ascii?Q?dbngyb21CNVuGdlyeG+c9L98PdvVDan4DefeTH9LKwkIVEe9SWi/6y79wEzO?=
 =?us-ascii?Q?lZ4BsIYB5FI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/am4DpUQH8WVj5XjbdmlwEeno5NubZycR53nZ0TlYjCP0wVt5T9BCKpmCwQ?=
 =?us-ascii?Q?wlHuszgjwey5dClKInqoldFRic2UB7/8U686ZxioftBxLgcApOFMziUPhA7P?=
 =?us-ascii?Q?wOpEzuJiOV+KsppNFhqfYLBsAMRj4iEYML8kF4r+kFAlDZ++C701MbNhinMW?=
 =?us-ascii?Q?s+T87oOzB1S681g3LCwSI9ORsRvhwi+r0FRK6GqZui7ZQskFy4+z5qhiOkZj?=
 =?us-ascii?Q?Hj6cca+Q77VQQViPZuYdQpLW/Kc40gRgkReetMFoyWQbcVj62tUpKkNGOB8I?=
 =?us-ascii?Q?wZQ1mnjdrak5C8VRBFJQ+4R2hPUDl5jmUOFn7qeXMOpLvSbHYAfR8cU0jB1i?=
 =?us-ascii?Q?UsrYzU8d44kneDwjBzdzsRrEUEnQ5j3tAcMHtzpmgao9gksVWmEY+gOFyoAN?=
 =?us-ascii?Q?v+d+2oRVy44O7bDdOUS8Eyx9EnjbikqXkLvx11fTLwMSy9kkpQhYlwKZ7F7i?=
 =?us-ascii?Q?lXmPIoWMJ1amH++ecmQEsuWthXIEyjAIamflZNTKD8TPJGQJ1Lirb8lTENxO?=
 =?us-ascii?Q?EHrLN0MkeEjsng4ZPGU1kWioxeslIMvogOFhhueL5lM7rPCW9lHNIuZmIdPQ?=
 =?us-ascii?Q?1Zti1Ebr0U9HnHn3B8JF88JJVHp0QR2AF1QYUZe2KWrAfbjMXl5vuZelTSce?=
 =?us-ascii?Q?q9Ah4bTDCcrgfvfiT3DDA06O4wpG5w25lye75dQwvwVxsOx9mHtEcjNQiJHS?=
 =?us-ascii?Q?wLiin6GV2OCvG7wVmzNgz03QqhME2HeX28Fk1Zr0NO84uawjm/3WC87wqwTY?=
 =?us-ascii?Q?chRIjwjGREUIBipBalLIMEpqvojg0jk+v9GGOLIYFaqkmuGzFj/sjXpJE3vP?=
 =?us-ascii?Q?F2T1Rv2Kub0E2YWnkC5F5fZFtHNpoJacwE5Rxb+XmMvASb7KsEaYQMIgChCy?=
 =?us-ascii?Q?+8mY6t1PV48ACHd7ddIuUhZvvSKAo8q1IkdWgW1nbzDxyibfmMMH116pLvh1?=
 =?us-ascii?Q?015S8jNf7E8agWTx9F4P9A6VAADfWyRX0fPyi1tIJQnxoN0rwgLror/9UO2t?=
 =?us-ascii?Q?guYfZoIkuJV3SiUqNU+C2Np5vkwBDOVuRNpPxnHppN/RTCWJ0232CUdn6+Id?=
 =?us-ascii?Q?hoiaVLas99JxJDY0cl+HX3RE5zTcES/POQUEyf0BvXyjfROu5s8J5N75NuP0?=
 =?us-ascii?Q?Q2NseOhWeQrDkcMiq7BI/jblfnq4olSP5C/xoekv87DKOj7Xly9t+kEU6B7y?=
 =?us-ascii?Q?7s4m6LDlulc4URoV+pqZIEsuiEKz3LeoZclOOvCX0Zf38Uhe9zW0tKMxH1Bv?=
 =?us-ascii?Q?2gKqzAf9KWjRIV/R0fUAcRbNTPv6iFXgBTVbjB9x19yGQEc7Rojs/dY+4Duc?=
 =?us-ascii?Q?BmcYNaRU6+Sb5bD8B2+CscEazmNfxfdqDI8hhoD3sBTFoZjX0zAjZUWElpL6?=
 =?us-ascii?Q?xkHeujy4MlHLJT3Xnnt9akYs2n6TLTc7rguHKXrE7rblbr0UkONJ49z9ESNn?=
 =?us-ascii?Q?HI0wjg45bLwPkWFeXtmt5Cov2Q/gRONfQSyd1m0ZwKC4hxge4quvjlujo4dv?=
 =?us-ascii?Q?nbcZL8d/Zbk9XVedv70nu9Q/wp00ybPdpIdxDX/0WFVYCCiNxPfxvWFID+Fw?=
 =?us-ascii?Q?ePvSTSAAdb/MjY70uzFx3Y1FiuEJIoKI46jjEEnTAFr058Tyat3ElP1INB2U?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9eac56-a2c0-43fb-ad0f-08dddc474da2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:01:36.1419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA1/DCTX3qHQUo+2FH67DvVu8eYXoe2FscXtDzsufkvcoQOPxz6N8aJN0LndodqcGYz3zv13eHyLymZquNe9mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
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

On Wed, Aug 13, 2025 at 03:42:25PM +0530, Satyanarayana K V P wrote:
> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> flag, the driver initiates TLB invalidation requests via the CTB mechanism
> while releasing the BO. However a premature release of the CTB BO can lead
> to system crashes, as observed in:
> 
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> Call Trace:
>  guc_ct_send_locked+0x8b/0x670 [xe]
>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>  send_tlb_invalidation+0xb4/0x460 [xe]
>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>  ggtt_node_remove+0x110/0x140 [xe]
>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>  xe_ggtt_remove_bo+0x87/0x250 [xe]
> 
> Introduce a devm-managed release action during xe_guc_ct_init() to ensure
> proper CTB disablement before resource deallocation, preventing the
> use-after-free scenario.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> 
> ---
> V4 -> V5:
> - Updated commit message.
> - Fixed similar crash while releasing resources on DGPU after reallocating
> CTB to VRAM from SMEM.
> 
> V3 -> V4:
> - Added new devm release function action_disable_ct()
> 
> V2 -> V3:
> - Moved GGTT validity check to xe_ggtt_invalidate(). (Michal Wajdeczko)
> 
> V1 -> V2:
> - An additional check for validity of GGTT is added in
> xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
> from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
> (Summers Stuart)
> ---
>  drivers/gpu/drm/xe/xe_guc.c    |  5 ++++-
>  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 433abc787f7b..a6e46272c0ef 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -705,7 +705,10 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	return 0;
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct,
> +				       &guc->ct);
> +
> +	return ret;
>  }
>  
>  static int vf_guc_init_noalloc(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..fe2410091bfc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
>  static void g2h_worker_func(struct work_struct *w);
>  static void safe_mode_worker_func(struct work_struct *w);
>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> +static void guc_ct_change_state(struct xe_guc_ct *ct,
> +				enum xe_guc_ct_state state);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  enum {
> @@ -252,12 +254,20 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>  
> +void xe_guc_action_disable_ct(void *arg)
> +{
> +	struct xe_guc_ct *ct = arg;
> +
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> +}
> +
>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> +	int err = 0;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
>  					  XE_BO_FLAG_SYSTEM |
> @@ -268,7 +278,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  		return PTR_ERR(bo);
>  
>  	ct->bo = bo;
> -	return 0;
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct, ct);
> +	return err;
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..b9f06ec0db52 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  
>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>  
> +void xe_guc_action_disable_ct(void *arg);
> +
>  #endif
> -- 
> 2.43.0
> 
