Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8E7D46BEC
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 18:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9EE10E1E7;
	Wed, 28 Jan 2026 18:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPXaaJzS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB77210E1E7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623671; x=1801159671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dEr2IgdLEWwWmplxfn8x182LPZYvnVW4zZlOWHD8OJs=;
 b=SPXaaJzSDKYWoU94a4Vkluf30/JMcLHcMXB7h025Q/bmEsqgzhIil5/b
 oT6UvN4UDDMrdIbD9Sx9WpUOYy20wme/vN/+DgK/QE/pkiqwiftfFixFV
 p0nudu8cwKjL/QY7nfBdgTVwQRbyd19T0mQO3+Bzvu8rsDZESJUL5iR7y
 rjly7sGdnsZeoW6hP5bMMdy07Ih7AZHafeRcpbsHY2FEdDcqDpZ2vbYgz
 r3L8aMrYym6R2E0vVMzTQcwVyZi1/3Q8Nm5Ik3C0vTfZdLN9qg7wJPq1v
 QOGN5H7X72uQDkKJPtuW02gF0TLiSZ9kpTE4DQHsIzb+acB21fOxa+U09 g==;
X-CSE-ConnectionGUID: orhpkeioSKexxds12YhoXg==
X-CSE-MsgGUID: CJgibQwiS6u2uSN32Imofg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81162679"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81162679"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:07:51 -0800
X-CSE-ConnectionGUID: x0FFy+ulSEy6SYfX10xVhg==
X-CSE-MsgGUID: rqRu1k93QUWLrjg3bxnwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207572241"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:07:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 10:07:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 10:07:49 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 10:07:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqgssF2MC0pGYl6TTFBH+iC5oGSmrgU9PAQdFEkqm+I2UaC6bH7puAPCc0IOH1uHRudiLUKLnCGg9s/OJ7H9vNYU2wpNchA4Ai3Ag7xDQX1v0+HoUisQfd/MuQWOuMnQuylnbSUPbrd4PgDmw/U+v1/qegGlmM1xWrHXcQdw0fYmkjTi0+Qoq3189YvlxdbOYI2NQQIg4N7NEJMIqm0Dxf+dotpl1skR1HByRFznXAOGrZn4avD+D1DiOhdtUEonz1/xAIU8jBgVgIooLP0U5DuS80D/lsHtJ8Mh/MiosFhljnVfdemUD90csbTpJA66HNa55rGD/HLfBjS7qYHW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUo7yNds5aGOvDQsWFlmLx0ERZht04CmWjbfOUFFUyI=;
 b=RG1Gzzvm5FLHbipCbrxrUQ6bIE+WMuAPgTOELc7J9m3ekZdomkL8r0Wld5GMMTPQd1Pr7z57XzYJdc8qP3cSoa/pS9rWrVoOR80QUuxzjgGBv8x7EV7kWVCxglCirOZxpcc1xslyEtFeqQB8/svOo93HAqyRWIBIOl7Y9osDvLjcfXOV85DeGyue5gDOnh3EFlmsq8/fn84zLtfzH3aJVdM57HbJu5gGH1uE+ebdtfIM7De3cHbqbAh9s4pVGgZYVDg3TSPbyUGckcH1wlLVRkGQzTt7CxEmZKJbovPhFaiGb2TxPWfQ1KLuK2+/IWXvbmFCF4YJbbzXrwWHg1603w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 18:07:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 18:07:46 +0000
Date: Wed, 28 Jan 2026 10:07:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/12] drm/xe: Extract xe_hw_engines_setup_runtime_mask()
Message-ID: <20260128180743.GS458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-8-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-8-d420b9c1a327@intel.com>
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d88733-c760-4ce9-6bc3-08de5e9823a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UUAfjrj444HXHD605HJ7fIrmpVQ4LWSnROUoslws5VnBO/QBvVhFHzZMSfbV?=
 =?us-ascii?Q?Gp2+2DWJWykkq+8hAAfvbn6ofsUS1wM5xElHRqfknxV+PHQTR3cwp8lvigzD?=
 =?us-ascii?Q?nQBzWJcG0t6hTgDo1FtJe8LZbt19Y66Wvzu2MG8EYtr89uz33E2nu8QkSg9B?=
 =?us-ascii?Q?uKIvtqbyi6PogK4osN9IqM0bCWxqfmeNSlrVQySy7GUv+epDPBPlT7nD5h0M?=
 =?us-ascii?Q?MxYGr/N/NaOQyrw0UR18XdpMlK+MW211k0G8Yj0jfN0mh/HTIjuuqb6BoOCB?=
 =?us-ascii?Q?qcZlOh/7/6e6FgcgY+ascS6MFCwReMFvouVLkZ6QVlDFKBARGzDoqnXrfhh9?=
 =?us-ascii?Q?nv733DQcb1XvRvQ64rLt0b6CN6tycegpYqMhcVbvC3BQii7wh02qdRjYOeZ0?=
 =?us-ascii?Q?rev13LmuGGnBPwVUIjtJ4oTVRgpcIBYgEhdqbj7x/Ruckx9l5AsclTAk1sDN?=
 =?us-ascii?Q?Xx4q94OZYTQB2zRW/gUjSOaK8SGg1qtDMCDgF2HmsR8FOov4EBhvmDDHb1iy?=
 =?us-ascii?Q?4Sed9zD2ctgCn8wbn9Osn/GAEX8CaHDcEw83gsHhFfho/3sRrK6zcS92p/1u?=
 =?us-ascii?Q?ESs6Kxx5UQtWiW9djD4XvjgTDzNXkJsBOWs1Z8/t16HvZptx4nNMy7fRPNPf?=
 =?us-ascii?Q?xt65MJ9ojqYyxtpvDiS2FTtkNFxU3j3Bi3mMThqtNngkZ+kfJDvULpzAasi5?=
 =?us-ascii?Q?hMQxV6S7yB2p8i3IMnZi57xkymFXGyudTGiZRprlHR5+ysTKjWOT6YKImFU6?=
 =?us-ascii?Q?yz8rhitVq4E6xP9qwDMgxH8cHOTkA/TyFC5xsmrXYLbUa/t7oI08s2V+H2yk?=
 =?us-ascii?Q?kj2JG3jZ6XzbcmJme25ifvOmOYwL5UX5sis1uMR4tefhIE/4qC8YbUu6Uc0W?=
 =?us-ascii?Q?eO37iNBvSLt+tZ0Irmj+5o0hkWSXHKZgwqjt0eq+y3lSOFxQE6AKH/7jaetc?=
 =?us-ascii?Q?Qt3et2l05NACS6/E7G4aL3F9V5hQ+9KYPrxHeNAID7BWmeoKb5MtDgu6Q0xA?=
 =?us-ascii?Q?Gx/eqRRIlKPFLM0DNY51phwPKG15h0RCF87FMC2t3KAmUI1rbpxPQqTKvvQc?=
 =?us-ascii?Q?pQJqgJbyIzyU0pi98o0bge4EhonA4jISKnXmGdtHIIMbgp6FwC6H6f3emNVd?=
 =?us-ascii?Q?Syd1vTj+4s0BC5U5+wlAQ8UED4ZoMAGqpSM6NLEX5xMBIgiuG7k0hkYUf7r7?=
 =?us-ascii?Q?UqZX9DRLufGK35UvgVaqDnA2Rq/T2KhjQ/Q8p/j8rzDmCOalVoUfLWkRCOZC?=
 =?us-ascii?Q?H8iwNm8QZtEI5/mV60UmacbJtzJfK2dBGUOiebJw3baR2dUyk8SaPkBxALkt?=
 =?us-ascii?Q?7apVojVPuYrMqviB6mNEzMlYcSoJVhWlHXy/+zFLwULqBhnS3vqRI5P2Osj0?=
 =?us-ascii?Q?+n4YkhxVLPPIUvstFfj0VDGnc1/q6HVTXxyOQiVBsDjzPWCwVtT8DWkPNZwY?=
 =?us-ascii?Q?Zopi6ZTp/xVHyRIe90fBNapVtTygar6p4s5yA71CmnJXx91PTa7dUavmB9q0?=
 =?us-ascii?Q?TGnzlUGXEnPepTmmQ8o8W2eQr7IXFFiHx8n9ySYu3Hqcl4Gx1dcdJ8IK46Qc?=
 =?us-ascii?Q?jt+la/jv3pQvz0dQBRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+cSus+tV9FU6rHaIlv29CmZ4Mix9vgmTofQcezNWkzwyRcjJk3z7i6YQW821?=
 =?us-ascii?Q?l9FgZmvTSgHU5oMJO2hv3mlxg7/oUQJQeiWF6pwnt4zPt46LDcA3c0EB1NiA?=
 =?us-ascii?Q?qa4c1px12uAMaQckENnrjqYVBf6u/9MoyF7Mt0EVcGdMxmSXDPt2WgK31ngy?=
 =?us-ascii?Q?Gopor9ZHau3bLraTpa6Opjhx/8CxXT4AxAttz7nDccnSQW0ioqVWq2QuV3St?=
 =?us-ascii?Q?M8Yr75EYwbp3ICkRwsDstkjKdwIX/vlvaBrlulrGsZpF8eHHapHfHKEOHhcH?=
 =?us-ascii?Q?e63nEJoDvOzWY8PItWNON1wgkSZfdSv/wpDEKEXthCfCxGb9py5KsO1ztM/n?=
 =?us-ascii?Q?VODK8RsQ2yDgwQN086oy+5bz/3jgFp1Dvr1oiiBaR+9qAVUIgoznkthiJtw8?=
 =?us-ascii?Q?taIPjygOoMXwzY1ix3YxnkYl6emPOTkn3zpsSI8EHmC5qv/iqkSqTxGmEYlD?=
 =?us-ascii?Q?jdUL5s7/1zzlJEBCdnVdwwZJzfErjSvu/aua0AdGubYt1yyeFG4mnwRHJe8m?=
 =?us-ascii?Q?E8qFUtHmIoRsbzCRBJPRH96DgO0hdE1biVvDqFbCHH175Ozy4nBzWfcYrmUv?=
 =?us-ascii?Q?9p5ZRKwGEkFo3UHki1uq26Dn//6Ti9ZnNI/2OTLNgM527BgG2q7IFbrXEMRj?=
 =?us-ascii?Q?nM+zzwc2lzAM+jg+72kVy1Q+eau6rsxJHMh+2GxgF9gb46ZdijWJWpYlfVV0?=
 =?us-ascii?Q?uuIRRNIwoa8q0rTfcH1eFoBJg/5cfy2tTCCouv0TeFBSjZcnAsQWYHcsGOPU?=
 =?us-ascii?Q?OUkqQic3KnyuJMNsQEO29PZfgLfz7Sdump9uxrA+gNEax57+ZLcCjACVycs6?=
 =?us-ascii?Q?sisXFuQ8VE9XZQVZgeapBCnBo6zYY5dhHm8+VrhkjfrAulMYERahiiEa9ng8?=
 =?us-ascii?Q?/qY8SHx8ZjUQRddM1uCJodK+PZMWUTH18QbqSIzsC0yVXkc3rHwvPu7zE1hJ?=
 =?us-ascii?Q?4p0KG8vilA1+dJA/86Ql1B99mRShrRgZExXRhpqg93BwLIp5F/4OzzdjfZxF?=
 =?us-ascii?Q?oXOiHKWECxMtCi4z7r1gXV8/zhjQNKkfpPJ78mdGkBUba4Bd7ir3Cf4hwLib?=
 =?us-ascii?Q?1i3YSdB7nQ/1fnXXGL6kQap0PYSIJqRtgbVCZIpKBwaLle2s+PRPPFw4YUHZ?=
 =?us-ascii?Q?EhXjBrLzngnnBi75ARhQkqhmKy1z6leVz6gpBMVnfweMP6sLmYT35H07brR4?=
 =?us-ascii?Q?D6IGqUg0UfWvqrM4HldXKSFPgP8oEF4dArOuzvBSCC2CGNOXbHkIZy7D+gFE?=
 =?us-ascii?Q?ggtXOttcdbcBOYFAJnODmP9l92msFEE4+zZiRCs3aukHxY7SZOtpuTDtr2wi?=
 =?us-ascii?Q?2aT+V4HivOIvzmNrJnFZxXfTpRsRu7MF8NCS9tM2obhGfdG0vifIicY/5l4m?=
 =?us-ascii?Q?q40LEqrUhPI0+BMbQHL8HEI0sx+ZNCIOQPCEvGuSjql+2R8cJ39tRo1H+FD+?=
 =?us-ascii?Q?rXyaH4bB+AMoosKhiBjkKQ3P3ze/X+XqMhaXZCvIbng7yXcSpPzBOApITgN+?=
 =?us-ascii?Q?Hw/n3zxZen6YGQUHBXyXsdE93IsjHK+GZO8cT8SzOP0THI5ifNNPjM1dwZHl?=
 =?us-ascii?Q?Uln0xOQXF6fOW35kao4kXfYEza0ZmuvUeXkM4Z4B4e2S90qzrmGFz2zxsC2S?=
 =?us-ascii?Q?5vplF6Mb4wLO5gb/FUX1TZbvMDO9ZEL0bj8ltf1QLHj1h6A4GUCQcPaMwq2j?=
 =?us-ascii?Q?Rp/HUQ+7R8jfOdhEZdAHKExxF0nIvSbQB82XfaDi35VhysVO9ZZ4uT8JwZtE?=
 =?us-ascii?Q?EG3RJdwDrgtK6alsc2fc/fv5HvJ313M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d88733-c760-4ce9-6bc3-08de5e9823a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 18:07:46.0910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpxyuTLcztPbu17Ql4/HdpjL9yuYsAeTbDw2RhSG7svhxY8VvaY3fP7b2HkmeMjtP/IW4XQkGm+QiP3hPsGUxe4z+mbcxmG7uaLOGWWgfMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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

On Fri, Jan 16, 2026 at 07:12:16PM -0300, Gustavo Sousa wrote:
> The function xe_hw_engines_init_early() does several runtime checks to
> adjust engine_mask and only after that does the hw_engine_init_early()
> calls to do the early initialization.
> 
> In an upcoming change to xe_wa_test.c, we will want to be able to call
> that function without those runtime checks.  So, let's extract them into
> a new function called xe_hw_engines_setup_runtime_mask() and have the
> current caller of xe_hw_engines_init_early() to call it first.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c        | 2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c | 9 ++++++---
>  drivers/gpu/drm/xe/xe_hw_engine.h | 1 +
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 68cd26286956..f7f0c048a00a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -507,6 +507,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	/* Rerun MCR init as we now have hw engine list */
>  	xe_gt_mcr_init(gt);
>  
> +	xe_hw_engines_setup_runtime_mask(gt);
> +
>  	err = xe_hw_engines_init_early(gt);
>  	if (err) {
>  		dump_pat_on_error(gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8d239291bc7b..c2de6e5d9249 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -868,15 +868,18 @@ static void check_sw_disable(struct xe_gt *gt)
>  	}
>  }
>  
> -int xe_hw_engines_init_early(struct xe_gt *gt)
> +void xe_hw_engines_setup_runtime_mask(struct xe_gt *gt)
>  {
> -	int i;
> -
>  	read_media_fuses(gt);
>  	read_copy_fuses(gt);
>  	read_compute_fuses(gt);
>  	check_gsc_availability(gt);
>  	check_sw_disable(gt);
> +}
> +
> +int xe_hw_engines_init_early(struct xe_gt *gt)
> +{
> +	int i;
>  
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7e897620db65..6729ebf0462c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -49,6 +49,7 @@ struct xe_exec_queue;
>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
>  #endif
>  
> +void xe_hw_engines_setup_runtime_mask(struct xe_gt *gt);
>  int xe_hw_engines_init_early(struct xe_gt *gt);
>  int xe_hw_engines_init(struct xe_gt *gt);
>  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
