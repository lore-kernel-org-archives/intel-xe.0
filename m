Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F3FCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 18:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B894410E7A8;
	Wed, 24 Sep 2025 18:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0nmJEyr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E7110E7A8
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 18:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758736882; x=1790272882;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SnRvaHju16K3auiBgYYiw36KcnYCQ4E5j0hCg1Ybeok=;
 b=Q0nmJEyrlI5crvrFPA4nKqjSAMdAIfz+rGnOCaAxAPYOLdNAUxfI7JtP
 9Qgl7/jyqCM4TV+S0lNPkffXtYsnHMD18Av0nFDiaC4c+E2R27HWkHRe7
 jNVCsozVZnwg2dfyrSOGp/jl4RarfPRHV53NBfu0olhJysB80ckkSRGU+
 7r1cGdTAR2Ki8TYKOFCWnqil+ne92WeJvlFdeeV93kIPIID3NOmaGl3ml
 ikWxg9yDGyyTZdvVWi74urHlQHde9voqm7Q8i3HLy1ls57UMWOsVB4mHx
 Oev/vOfcYE5MTVpXv6s34i/W/SzO39L0VmxS2w1tf2Li/pmzHrBt8Uk1Z w==;
X-CSE-ConnectionGUID: 1vO7uYFlSdyu//ZnzmWZ2Q==
X-CSE-MsgGUID: CJeR7N19Ru+7fh4PCZitLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60968216"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="60968216"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 11:01:22 -0700
X-CSE-ConnectionGUID: ilSIAgJRSr+7Bx6QFTiaUg==
X-CSE-MsgGUID: pBGM9sUxT4KfEbW+IALjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176393014"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 11:01:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 11:01:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 11:01:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 11:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbDRIxuOvoIPaj9oq99V85HhVLwTko8DLjpqhKQR+92LCC/tY/ZMXN1SZbtVSmHoPMUu9Cnl3Rdb6Auok3L7Xfdl+N3t+TsIpk2VhVcygjf8lRy8NTMDYEIww/aJzcu3yKVvKrO/dIYI/mg30rpyYH66y8QqYbCQUfDOZsgNLRlGvmk6jkyHE6MeNQF68oKtLR8AUEMBtOjY0tOuWyD/ZM6qsDAFcCYCQcKGQPLoX+Aj4GoCRWA04iEkb6lwTKbtLxP3NYj2eIjSBIedtOQG5naT3xtLcg9Ucdm/6ZK//oZ7tbjur448rqsaaPj4/Mz4iv0/00gcxsofx3bWKE8+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9RU3xQq70dTYk2OPxkNXEgGFMRSOp1s8vxbnxv3x50=;
 b=uc9sUvX306hG5+pFOy5o4PD+JeU3UvCf8+nKD/ndGkxRmfIAJmd7z9gY4OYgsP9qbTQqhsvUYwdKTI9YjIDFxA9U5mOCjv3OU31WboqTGaDbICKs7OFCCf+5A6iWUK6zNOAS/ByKrzArlgOqGf6t+ipHwONwzmANlqwsPNCtYAmgZDBvHAoHm8aTNKkvD0bkaXvzoAcx6O3DBCV9LMUHi2dm9aOHsVOohJeqehCXoyFaIoLz4VQVGJ/B678o+9yDAHVB95ih79HAXbDCfC0AmTsC9ypZbEQ6SYz//xoN8yYI4oqw/Z7W0XlfRfv1kHudx9odkjXMGpwF3YKDdlIVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 18:01:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 18:01:18 +0000
Date: Wed, 24 Sep 2025 13:01:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/34] drm/xe: Make LRC W/A scratch buffer usage
 consistent
Message-ID: <omdbtumxxnuo2uahn6szbe46s3lu5v3r3ogcundfuxenkupsbg@nmcvhza2bewr>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-10-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250924011601.888293-10-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a6c943-dbe7-4d9f-4014-08ddfb945c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pK0GIYT33c8mPzMjijx35LmxnpZ6WwrRhaBSLDBT4wwPORHVoz9JS4MnURaU?=
 =?us-ascii?Q?F/tCPmHgoGbhXlQ1ITH42Oce+t0c6WECzCxWBBhtYGHMdNmokeGbdJ/cBFuJ?=
 =?us-ascii?Q?INWsmRJqmMSV9XEssDHb97JK/IQGsafHrn05FGUJkM4kn9xJTv4tfXqH44VP?=
 =?us-ascii?Q?Smptfm99fHSS2z0/Wvsxs7/LYMddd7j9ePDfat1tDo+7yBcpawwSEJY1Hprk?=
 =?us-ascii?Q?VjJEATBJr/jIK/QKoYbkP3Lp0s4Oqty0UdE1yBCSB7KQuKunTK3ugqWS60Xb?=
 =?us-ascii?Q?3T/75hzDHZpJRO0OXr5PsI0+L7sFotz6GaVllCe1LgiTCNzJrKMv2OxpepMp?=
 =?us-ascii?Q?gvXTqfBq8YylMdHWr77JRpqQZ8lP46bFOcEOdKAnQ06Nt8V+ZkqXipu3oID6?=
 =?us-ascii?Q?vSjcBWl+tQ1X/1aMa8ruAai9k42hp13y/q8QOD18V1twOlQy/xJWwePr05rj?=
 =?us-ascii?Q?WNX8fF1qMZkdbGXq7QiqPfI7UXYk6KmlRpIqCt0RParHOYu277yYRI1gFkwq?=
 =?us-ascii?Q?qTMJDoOxbLPglLlY1MmxknWshRjzGxEZlkzTFbMxoWrZg/OHU1W/lqcs03EZ?=
 =?us-ascii?Q?R0OUMVW35izUwuBDxOZQV2aM2u50Iznr2MqMPEZE0+mfWFJNj8t6fdCmFTkg?=
 =?us-ascii?Q?cWobMOKerR51omKvHYPSlnX2+vIJuhxzgmmosrG9YbX34NBJs2ntBPR53hCS?=
 =?us-ascii?Q?/y3vUbXXWtoNXD1N3cjTM16Q1uUda8JGYcPx/zRL9ZH4tLNmcUBz+qTOKTEo?=
 =?us-ascii?Q?RX4dRgk9G1Vqu206Lg8zCuYCjciyRKA42+SFS2b3Pgtji9nW1RcjKS7vBtsN?=
 =?us-ascii?Q?xOcSR3my0j86EGj56a+PI7QlVG9wLA57bPSf1t9xcGXcH4NURgWgKo7OEAxA?=
 =?us-ascii?Q?v7JMvS1PyrxBWzhyTroERaRYTJ3GdGZep/W7H4s97maZsWMdcqz2lSmFuHkP?=
 =?us-ascii?Q?cO9i7q0YxOWK7LQKEjSuu9oGyFExvwVVmKz49ttVCvng4rjpyhkmdA/SqXQb?=
 =?us-ascii?Q?a3KMnlvfnqeWYM/EMRlQ3dDQKHA+QxHdvhcOQYArj3tJMRGe5ZDMINzSnTwz?=
 =?us-ascii?Q?NQerR5ATS0nY3yuJ0FAZumuxTFiQ0RQb0s0MAqa2SJ7xJWxwesOnkCStJN7A?=
 =?us-ascii?Q?YFk7d/1bQAsdNBLGrRCHTEMOcWWj6DyDDy0URC+1U70fQDu406K/WQiSph3n?=
 =?us-ascii?Q?9rxtiekMUp4b+rlHD6UD2GQGIfWMJ7ao6biEnzq77KM196dMSAXe3ZRAXSLe?=
 =?us-ascii?Q?olQcwtrsDAHZvKJqxumTmYjlSRIFh7JjLPd3vNXKq09pNwK0y8wQCWBau2HO?=
 =?us-ascii?Q?HjfKOITCzC8Lyh8hlqymCw9ZVSQzFaNTcb8RzON++JyR1jIl9gukFkR98EJI?=
 =?us-ascii?Q?mUNZcc4tp1aWnuZ2OXE0RxsyCX/DZ2WWJTlwkJk+sHyb0YpffOIvdc6Qi9Cs?=
 =?us-ascii?Q?n3SrnPSJBIA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Xf8Dk5xIVsNexKuxvYePQdrD7f21W4OwuDjGEo9cWrXzNaezv/1qpXtqbLM?=
 =?us-ascii?Q?g0OSXyCGO2tznXJjGVn9KsMXArD+ZdJ5IZdjbdyoQFLWwhK748XL2X8OSb7L?=
 =?us-ascii?Q?iW9bpt7YRg/FcWVrxmzJbYqydzLgzXsLfDCXpo53UBN2gGwYwZ5m7mIyge4R?=
 =?us-ascii?Q?nikwjFryjyAJSzixyxbhoixY02A2Wx+1umvWIPs9Oo1cnutNTzBoxH1bVYkw?=
 =?us-ascii?Q?Gl/fBtKNBceISgKCwN/evQkm3Iv6cfTLV61huuM5EA0pt2TWcq/ZwAWAyz1W?=
 =?us-ascii?Q?ob9E81goK6e8Zr1GWvZO0TYqXc+t1WDCZnYsd9zO8LmQnPTRPxdvNjkzlBIb?=
 =?us-ascii?Q?f4anijo/kEvKaRjNnHohHpoiBTZll4TyjyBv8Ll5yw25bkkmTKiQRwyH8hT5?=
 =?us-ascii?Q?aNz8VgFlXN9wLNYP/ox7EWAtNgpqbbqJVVRxLI3O4mUS8VKIgSIr11AwnXwy?=
 =?us-ascii?Q?MSPovypg3cmV3ROOCiptc1DD6vTaNYwAMkRePbJM7CmNyZOqaA6+3m4SsbSn?=
 =?us-ascii?Q?e6XbDRS/u/yWFZHEVzzU3KBedBjJ16fRQdJSNK8nY1LntFv4FmsRhpalWYl/?=
 =?us-ascii?Q?QK/o3+slXTw9ikzeQWrjqiOiyYt7iT7XKXhimwSZA1UHLsTd5URTsZRmlHW4?=
 =?us-ascii?Q?5QFTsVeRBiOFop/oQxqWkw7b0J2JsTTpuvJE1q2FQ8IpehbAikbYpJAyDJe6?=
 =?us-ascii?Q?CSEM7wCGMfGVxjTlG6u5ydjgzpL9+U/dxWrms0vNZzaHN56F8FssT4emryr1?=
 =?us-ascii?Q?gPvD8MBKbxUy9pv46eFnPYSEjr+CF77ZL6SFr/FNLPfsD8ZipIBLJTVph8VK?=
 =?us-ascii?Q?qweY9eennZ+tvhcYouA7c1h9jexgjOa/KcGr+R1iu+i5UaJTa1CYB4qdydJC?=
 =?us-ascii?Q?33QYNqeL4OSOMjn6UNrBoJyrarkm5/Qy7uzeamLE6N8fkX1aKDyjVukZzVXR?=
 =?us-ascii?Q?b07OO9pRMg8UtgbvLw3J8w15ALX6u4O3oqpxykG8K/dnwt91aRc8P2eIZMxE?=
 =?us-ascii?Q?/6pzKV/RMf7OZevqwYsaq6W4vg75s+Cdw9JsQZl0eYOPCfFyPwOA4QQf7Plc?=
 =?us-ascii?Q?PAHISDWrXr4EPTkyICMUa393LhmQy3s69ArWYF/uIOmpxMrhSRmq+oPvwfNW?=
 =?us-ascii?Q?Ddw0MuYED2Uf9QZFz3kJ2zEMlRfJa7n0/C4uhubPfStBPXhYFErUNM8nQ2XA?=
 =?us-ascii?Q?fIPncztqNWyVbMUuzJ32b3/ZpIlBOPS3vO0Al+C7fFz5fGdzaoXmmidohtCj?=
 =?us-ascii?Q?ZEx1gA+BUcdQVW9KgIDMa5EFHTip5xr2O4Vl6NQxPTp9T4zVwud2AKM1KCcg?=
 =?us-ascii?Q?rUk33SiFMvMqVIvjax6MeNWM5FqasU933SCgq+W6F9K18C1JuabkQxYcw967?=
 =?us-ascii?Q?PqZXXxSQQzM5imJCTbQC3V8IiJCvtQf0Mh/vjA1EH0z+1UU4pu3kqy56077M?=
 =?us-ascii?Q?coQgmzTvWifwJFndg3uUJ1/7F3oZ3Um/F+FUKiJfi+TsmhT7akmc/huilhIC?=
 =?us-ascii?Q?EDBKOAw1xUwoDKjfZt5fcfIWeLjbpKNpt89mwgdx1nv1yjfYHE/WG2eP4bi7?=
 =?us-ascii?Q?4I7XjPezMLhKb/pTWfMariwYgLx97xadXGT0OkgZYaGkzivIBL1xFGrGC7iK?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a6c943-dbe7-4d9f-4014-08ddfb945c64
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 18:01:18.4907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LjzLaJcWhHUxcEHR+rQnDPIWkBaIH1THGAqmRiHvxCILt1GzAz358Dz07nDhbRTBC8WRuEuhF6ZS3JDTqTL4J3teCD7Uiikw9zjz2IPN2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
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

On Tue, Sep 23, 2025 at 06:15:36PM -0700, Matthew Brost wrote:
>The LRC W/A currently checks for LRC being iomem in some places, while
>in others it checks if the scratch buffer is non-NULL. This
>inconsistency causes issues with the VF post-migration recovery code,
>which blindly passes in a scratch buffer.
>
>This patch standardizes the check by consistently verifying whether the
>LRC is iomem to determine if the scratch buffer should be used.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 47e9df775072..aed0a3155d1f 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -1248,7 +1248,7 @@ static int setup_bo(struct bo_setup_state *state)
>
> static void finish_bo(struct bo_setup_state *state)
> {
>-	if (!state->buffer)
>+	if (!state->lrc->bo->vmap.is_iomem)

Please add the fixes as the first patches and find the commits they
are fixing so they can propagate to drm-xe-fixes. With that, for a
palliative fix:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Long-term thoughts below:

The fact that we exposed xe_lrc_setup_wa_bb_with_scratch() to users
outside xe_lrc seems completely wrong to me... it explains why
indirect_ctx was completely forgotten.

And the ENOMEM handling is in a completely different place than the
allocation which makes this a code smell.

I think this change is a palliative that we could accept, but going
forward I think it needs to be better handled: we shouldn't be
recalculating it on every lrc init, it should rather be handled like the
default_lrc and just copied in place. Then on migration what really
needs to be fixed up is the ggtt address, i.e. only these calls:

	xe_lrc_write_ctx_reg(lrc,
			     CTX_CS_INDIRECT_CTX,
			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
			     /* Size in CLs. */
			     (state.written * sizeof(u32) / 64));

	and

	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
                     xe_bo_ggtt_addr(lrc->bo) + state.offset + 1);


without re-allocating and recalculating it over and over. I will take a
look at doing this

Lucas De Marchi

> 		return;
>
> 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
>-- 
>2.34.1
>
