Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCB5CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8E710F27C;
	Mon,  1 Apr 2024 16:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCZGLyS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C908710F27B;
 Mon,  1 Apr 2024 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711987271; x=1743523271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EyXdfFMZ7/BMsafs34fu0nRpGUOtKtf4+Ez841k7OG4=;
 b=OCZGLyS57fYdtjTtWgQ5cwXmjxn2HCoowK88I1CmgAoDqxIjm1xugQZ5
 w2W3W37yX4+qUtPEHnXodp1YVosWw5iGFKj7sSOlcxtV7zdCNk+AnxXCx
 NhfqPwZn0Xoy9t/HYmT38Cicjsp+FFr3zjVq9nnOh/zk0Ag8kpOtsqVSA
 OaovK6Xqg4qrSfCJblgR3SfD5srCQ/+oPVnzWTJVSwP7JEQKUlo5JUjyD
 S3AU84nxsLs66TdIv/SO/ANNFE70taWQTuEqEWJa4QWfVmk7X4IvcpFok
 fGS59Ly5dyjmNYAMje8/bmoDbMuZtNiBBw8mdDRHVZjkmKJfRuIqzIULi g==;
X-CSE-ConnectionGUID: 9wKtJcLIQnmfj+xL2LjFcA==
X-CSE-MsgGUID: gG5MCZ6BQMKa+K7vqWRNjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7309617"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7309617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="48752288"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 09:01:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:01:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:01:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:01:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSxOlahvqd5VulL8YlfNd/j9kmHdnSVYpvZEoKGDdw+BGy/xNAo4HAsac2Giz6IGSQLj6CHVOBbg/KL0Wgrt8PBuj4jGbnuQwt6Yr5nSg8PDMHHqjhah/9qLX9Gcye/aOI+tSdN6WOQCtgLfAuE8RqUdcFkwpT6pSDdAKOyGzG3GcA/fp2CiVxzbPiS5ZLCXCkQ8Dn0kOCxceFLW6CmWzLqECE+nqrCHNTZBwm/w/8XSkX99LG860ziqFB6/VaoADueZX7KvZHVQOKs4CFycJQZSP2JPlKDtEhQbnER1tGlPg2exV6Tu7tTr/lRgjZQaUBmekCV4Vh4CLQWoDDNPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAWV1T6zzSyu0oQmf3cUIjLanw3qUAMXhATvwvwDxTE=;
 b=EXCJ3IRik/8mLQFC0MJUSOT9FZ+aqJq3pERg2CO/kIiLYVBCLXKEahGOnXuErCxjdmmKJGmGW2E1Tnc2qBzLSfcwK94mVnQ9EZtdtQ84jr0ASckP7dap8XRlRJhySjyBBdvi6flx05nMhwHtmS00kxejg/jB/MwwL5hivW+CaEB6naOlFDr+20NuMRPDKDs1hnVcoiwlJsoteedOXDq78UFI/lh67p6/+ME35c9LsReoEGZK69zi9pKhh5gN8vtisZok9EiTKsxnH8Yo6pn99FoRSUHjV6ji2HlIYYdFbV3+dlM+z2RISUNs1tQdvCY46ZzA6jug6PLq49MRh7fliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Mon, 1 Apr
 2024 16:01:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 16:01:07 +0000
Date: Mon, 1 Apr 2024 11:01:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 "Matthew Brost" <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for
 legacy mode
Message-ID: <j7oll4xipndqfcfplyrgjvvdmjylu3blar7ar5lnd5lwhbfvhr@sfl3padlczqi>
References: <20240401144834.577481-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240401144834.577481-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6707:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+wb+t5PSelj2dY4p3A8rtClrO4/Z4ak01pHummxWfnhjUZzhMC7RWQFKC2XSKqIGMG40dZ1QIGouzivF7sFJiqEm4PGxHwMsokNUPYGOtzRbwH4r9+NoS0vJ2yvwTd9ZUYlu7mmRURNQgXiFmQ7rzdT4TMfLiHl0SnfhDzYkgr7ZYxgbPjbkHnEvFwpO2sGn9e+IjGXim2pXafOTGbYUyRK4AWP31R7mVkbuWBrSDouFx3jchm46nObM/MwiIE9YvfkeoDExUub/kthbvUERofaU/Iw82PemJyNUiC05J8bt/h7KCQF6oa0KmyWNtRYauH5Ys3tOLJxfWExqmT2ebVh9vvPMfXfP5aVCw5YwsMEIfAJgkNVYiuf81SgK25+QerSAqv4erKvIODMJqcspcR18fj6qu1XOF6N3Z1WWCKhawmI6Q2WG3ym2ObtJYOxRhdeXmt1Wjs4AOcUUnx12tdEPKPKw0wECXZSS59Zmf8QJEAV4YPziyVg//tvTvH8vJaYJnmHow6kxk9F5R+OQJuxl7klpwQTRjIBImwVpuKy1+lqGkR8viqRKUsJN/gZAJrBR03PSWcPpTm4Cp4EiSZ7HXjNtckBnBQjbp8MjnWLsQLBIEvajJMl5r9iR7h/XF5HPyrHhW+HAohOdxBC4kvu3XsWHnHMCVKvc1FiVis=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YypUOZM8OJSVg9pMqyKg2ufn22JeCJD7nsyjVTCayVEKGKy8+HXY2xScbdgX?=
 =?us-ascii?Q?U1Kq1+p9jTyjbj/h07aY1ZvDGh4pWf9QJ1bNXkVqyB8AN/NwTrW/1Kqv+1Hc?=
 =?us-ascii?Q?Hcc85ZptACkyM/EAlyM0eZgBt893zYmi1qHqW4/2F/UdFKRvGrjiDLmi01jn?=
 =?us-ascii?Q?l9EFP1lobYqGMFFRGPndM+AY/Tw1JiEgvgGV5ncHdSQRaaTkGTmujxb5eRYI?=
 =?us-ascii?Q?2hfDVs673GVplL8Kp72s7BkJFoVviKhDQh0oal6Ekf643xf0P626kQWmUIoZ?=
 =?us-ascii?Q?7QBke4mG/i9Vl+3eolRIZX02S/b4xs5YYruKs65MpfXCQtqx8tdXFxPXkYMX?=
 =?us-ascii?Q?w/qjKNMtxGcnp+IXc5h7402ZJy5Weor10B7wDc2C1AjzD9Hv0YnVmQn3Eb7P?=
 =?us-ascii?Q?HTY4JGovD8ehRchV5vqomkx0/9/UzbSF7PkqRAq8iuOZUyVI1WIHTBjiAHba?=
 =?us-ascii?Q?1obs7zUV25ltcLbDFX0RfzWAHzIy1D5KP4EHNsoM9gcztc+5gNaXf+bWExBI?=
 =?us-ascii?Q?HC+4ICpmcKmavmEwrajPpYWSTfqvY9+iGQJkKCzan8MnV0etbOlRCsVOkBfg?=
 =?us-ascii?Q?eSDGjdNAL0ZOSe3NJi3TgdFjB6AgrIzX77n9tRVtkzI+CocJi4c6drPV0evk?=
 =?us-ascii?Q?xfSPXlBytBUjkJZ5wCV/BD+oga42w8o/bitMIH1LeHAVZp4eZgMPfo4aOSvn?=
 =?us-ascii?Q?RtgP8n/uThmGnk0GgIEdk7tPCSoxQCuA9TzIBiKAT3T3AwYfE2D8wfUCS+xF?=
 =?us-ascii?Q?0Nelk6mq9Qiyx8ItpPtCvasTptSSLN/QVkhX4vfgru+kqrxcdhs00qiheyuX?=
 =?us-ascii?Q?m6Hpt1V9bouEaZNQNpp1NT0uNotSQg6A7kTSnEIyb1lMDmX5cxJ+HtLwCX+p?=
 =?us-ascii?Q?QGscqkrwJaf97JDtkyIKGbtstzGR3Yp/BdBRu+EU1w4kHYUUa0R6I8agTta2?=
 =?us-ascii?Q?/xlok1J/inx2YoyFy1sSYqMpbsgvfPGVc6WUCN2NW2fkGeNB9xuoEK1hy8OD?=
 =?us-ascii?Q?G7DoqJcbVwG30zp69KNv43lBwkqAPpWuz1EQwJyGO2wpJzyKNywK1+95MHLe?=
 =?us-ascii?Q?EbsDuCP3QKzIyCILzyRDmIhwz4pF929kyeIEt0WrF6z6+b48dhibSKQc3o31?=
 =?us-ascii?Q?fnPiPdjyzVO6G4Ow586QAzAeKZ4pvOR269FEbKCilv6BsQrVM3JRH9Om3S5w?=
 =?us-ascii?Q?bIVvh77y4Z7Yb5fxWh/qLg3EJudHo7hrSl7oKxLcw/EIq7MzoLqh14AcbJpx?=
 =?us-ascii?Q?qJzIMLoG2Eth3tjMkiu5LnjDz/AxiM9hYAS60AviBRMOAFz/5/TEoSkSJ/ZW?=
 =?us-ascii?Q?Ckqo35f27K3kmlBUQLHjW9i23nB6eJDoYHCfcKo8aHswz97DL9fBBg2JWQiU?=
 =?us-ascii?Q?+gbEFWqtKbBSLG6hhY9fu0dTOaPl31fnK9VJmnPq3ctR73SV2V7k/Qsd3PL8?=
 =?us-ascii?Q?4UJyeyrd+u+gBx4iQl0T8kqzGmMD5FndbS7S8sIk2+7eOmVYnHC3oFT2x2EC?=
 =?us-ascii?Q?F3yEs+KA9akRhb7U9VqP8Q7GV2dXqyLW5gPaUpG7zHFdItHzxS9LrSNLG72P?=
 =?us-ascii?Q?D8F4fBQBa65Y3J6zp7EURy3UHoocnEqTBK/SUCmu+ywSIJG4m5HTTdtFzhEa?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd4ad72-e850-4431-b0d2-08dc5264f129
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 16:01:07.8158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGvIl+L64o3/7lKKIMEcQ7Dm7fquGdeHYG1P2TZW/KZH9ljKGWFPjT2Hu8liMEjxOb9SM98fcwT12ieh0Ug0ebQPtWqhsLZfhKkoCptfdpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
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

On Mon, Apr 01, 2024 at 08:18:34PM +0530, Tejas Upadhyay wrote:
>RCS/CCS are dependent engines as they are sharing reset
>domain. Whenever there is reset from CCS, all the exec queues
>running on RCS are victimised.
>
>Lets skip parallel execution on CCS with RCS.
>
>Fixes: VLK-55941, VLK-52341

these shouldn't be here.

Also in the title of this commit, what do you mean by "legacy mode"? It
seems you are just blocking CCS regardless of any flags.

Lucas De Marchi

>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> tests/intel/xe_exec_threads.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index e9588f9b9..b1c65e1c5 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -996,6 +996,14 @@ static void threads(int fd, int flags)
> 	}
>
> 	xe_for_each_engine(fd, hwe) {
>+		/* RCS/CCS sharing reset domain hence dependent engines.
>+		 * When CCS is doing reset, all the contexts of RCS are
>+		 * victimised, so skip the compute engine avoiding
>+		 * parallel execution with RCS
>+		 */
>+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
>+			continue;
>+
> 		threads_data[i].mutex = &mutex;
> 		threads_data[i].cond = &cond;
> #define ADDRESS_SHIFT	39
>-- 
>2.25.1
>
