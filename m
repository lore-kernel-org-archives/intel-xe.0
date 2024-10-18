Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC9FD3DEA2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 17:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EAA10E965;
	Fri, 18 Oct 2024 17:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUEJzDwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20FC10E965
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729272633; x=1760808633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=azMNc+MpbXONZZ+YL3wwotn9frNqf1syGJZyuFAmtvM=;
 b=QUEJzDwohjraI1XVSzY6M9jb9eKb9hsaG9aC2ej9/a0CegrfFn/ViUGp
 Q8MtYbRTNiWzCgutpECglg06vmamiYmj3RL9hdLCuaNd9vWeRyFreAvMO
 r/ythexHzaaE6CmIlAdIupQCx9lcKFS6u1VZc+lgWDINJoyxyS/5oZVO8
 BzogmV+1SQeIXyvpKElEEOFZPFGQVAeU2TNJsN1b9cRZHpfKBoqid1yH0
 NUTp/updPchccSwmxXkDsw/Y/v0S5vCez/uiRad5KaLZVdHY4Ms6sdbOx
 v8UaXngDj7+mKgmQBPsaadJeayWbhLkhWeWvsu32Pg9Z4b5q2eqHSrb+t A==;
X-CSE-ConnectionGUID: xfSKk7CDT5eTJ2tS3jva3w==
X-CSE-MsgGUID: fvNTrbRFRlu98DUNwUx9TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40209721"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="40209721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 10:30:32 -0700
X-CSE-ConnectionGUID: Pg4w/jf+QO6JxY/+CrVurA==
X-CSE-MsgGUID: Be7fa+rtRmG0X72rQR9qzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78950239"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 10:30:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:30:31 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:30:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 10:30:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 10:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfbWW3HQ3VTt5/VzVmhro7gAPDES02FH1TGcq7Uk36zxRwHaNpYUWU9d/pt9dPk5BimLMD0qzBs6dfUehf2H7nJKYQSpdyGrXFC5MhDLiuwkw5poA+NqgRNDY0dwxkD6hV3fR6C4TXIP8Bs9vLVQSusUx3FqPDDJwIc9fQR5ym+8mgwgaBSbcDR2LBlr18DJv8gYLY2XMQ4yHDT9+xdqTuDosXKK7XrCsfhOBAjTtKi2sIho8EmHZVpRnkRr2jWuf7gW1lhTG4uGFxB+Mf1Mx6HFrjvgwMh9I6ihAG65tN0uIueHvB8a+KmYw5h8gGE4043tDFzlXguN3SUZNU0L0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXvdeyfcjRnNWEQEykACZFXV6BzwGI0CWIQVjPUVD5M=;
 b=hzIlZuqGUsJna6AERheZEK6Pxaje1S9bijh0hoBBDkYUn1OMODEkuVCeTODRl5V9he/qu03KoFtQ/3DMAnDTxe2g6LNyC44/H19lBDXu5nVXD0Mk5x+TQbMwWWV117JoGRknrAue6K5QI0170vB5s2Dw4snG5UhlOP897X4wfBcyqQrx3NsD2Q5RkxwC9BbhBr8xexTJhLvGNPLeJJ9dJWwQsUbfWSjH3LT+tknhHo0OntRoYuo8Rj3EBxNLTbKAlwWZIk401aOEkKmOTYMsAxmjT4u/CkHUxY7oALZskPpp9B2GhVPJkJLkX6bApdA8A8VNxo0HhFKAGV38ZtLnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 17:30:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 17:30:06 +0000
Date: Fri, 18 Oct 2024 12:30:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI v2 3/4] drm/xe: Move suballocator init to after display init
Message-ID: <66lrio7qieuvevgzkdsmgjt46swaxzxgvdnnch6w472uzjdsu4@xvn7pvrfpiih>
References: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
 <20241018170631.6598-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241018170631.6598-4-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d38315-3f1a-4cd5-c225-08dcef9a81ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f1mx+rRrw6cRBt98ErvRyKu/PVV+GdIu+lNgriY20P+Oj23vekhsG6FWpS0g?=
 =?us-ascii?Q?MhtiJMex/dhuWuindWosW+zFAqOG7Zc8uDAdjxa4rFDyo7TBgu8+YN/1p9GC?=
 =?us-ascii?Q?FjyELreyIvXILQZT2WriBWA4Kr5zDKylt3XWy2IZ6CMtPMY4U9pql9P9EJdn?=
 =?us-ascii?Q?OZVMEYGgrU4YS2UM7QdxJV9fQmFpzu9O538bYTVlTICbRFa1uSu5tpzl7IjJ?=
 =?us-ascii?Q?Ubab+iLxfJt2HkSjhy6/7VxHMKaNkHBUBn2WQb5KSZ2JAkj8PnSsm/S+UY3P?=
 =?us-ascii?Q?OQFrAFpS7x145CcZaRtA60bErgDJI/qMf/0k+BmvjlfmiDVqlzAm4JoBjha6?=
 =?us-ascii?Q?rPbbcFaDE7E+rYZLp0004c2cdul5zHY5ddifcmh+TZU1Z3Wo0MzWrGOljBNl?=
 =?us-ascii?Q?y5E2Oexmxj6ddrP63q7fkJ55V9EM5AgAp0xQ8fdpuB28cvigRYAV40r7IY/P?=
 =?us-ascii?Q?cCxJ6RpkwiguuN/LxLUUoKz8M+uTYL37MymsgsvkQsdrUgBEWgGVH4U+QrSJ?=
 =?us-ascii?Q?WmDpXUFjcH8jYdpwR9bgmIhy4xPc7T95Bs8L6oNljZyUHkyHgmCHUzrjbb+c?=
 =?us-ascii?Q?gkBpHYHVIvTvS6OFl7e2uoEDoZhZACQXDxPMLlcRFpefAWCqkgelWfvSyXqQ?=
 =?us-ascii?Q?WN46EQwQ11zi+zmkWjHKPdrIwOI995bA41Jaj27JuQ3vkx24rDyfCGaTisb8?=
 =?us-ascii?Q?I0RqP9X8r6JbhYoHusxsqfdaFEBPD+lIlt+HPgApIHRzAw8wyc9kSHEx9bEL?=
 =?us-ascii?Q?wcfTbhm8GLMQGQ0a3du4cj66oR5ybf09Od2nVlHS2v2tRDnwtTwUCeKvx3Rx?=
 =?us-ascii?Q?nLohQcRMkV60JqOeVm9dbMeCwzIrawCvE/w3YIrgONGRSIPYGn6jBSOqfEfn?=
 =?us-ascii?Q?x/Tbu0mp6oznd0pOBHMtFIK7acfn9XKDHRba9VCxA9Q9Cj60NL7v1ahtNsJM?=
 =?us-ascii?Q?w6O/7PuxVQVu7667T0yVSlOq2uoFa82n54RVqTmbbdBjvHEdQ5PPggr/Dz5J?=
 =?us-ascii?Q?GDww+5B2xP+Bw1haK1KiYPHM4fBc2XXc/60FCazfCIsNYX79xyOXssWcXCd2?=
 =?us-ascii?Q?ZyECgcPRIj9XHku4TUYtAy6OtR/WBcSyJ7hKmyKIcmUgYIjD2htBv0L/P6sz?=
 =?us-ascii?Q?G2EY1VrfDclDviAsZt4/KjShqKGGIdJFUI+KoV1UrQkhNxaJ86jH3wD/QNhj?=
 =?us-ascii?Q?9ag+gdZbhZQ3TXfLfNzVUi9cnbs1gKcIDcy1jU+aTv+Peh+3vLmVCxBiEClQ?=
 =?us-ascii?Q?8zkFeVJgIFob5HS+Om3nEoi2V0nZTUXocHh32mAmKnMKZ7ihj7uplVNaMpl0?=
 =?us-ascii?Q?uN2pnCKnMNPzrJHxQLxf1zjN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/MMoeXlKdPMvfAacG7HxLV6oD79PY6jB420nXsJiSKO3Uo6eW/enN3hfYzD/?=
 =?us-ascii?Q?GwFj5ZzJT8aRwr1ti+W0LATcTjQyJNH4yu0Nzp7u3zNgTxHEo9D6e0FHdhB4?=
 =?us-ascii?Q?xB1fMrUdibngDFUoTX/xI14/bNWHWkAiCYsc/PYwjAD2d7H11alqEdQFUDa9?=
 =?us-ascii?Q?/N/EdMTksWw96ACzyIFqEDgvvHzX0SykVKFiPX7yic+FK1NjaMLfMqCp9d8a?=
 =?us-ascii?Q?weDbVG217AgujAdxGMNWyVh8lJYCHjhn3NNeo+ByznGzYuvUoXwllpHQ9p5V?=
 =?us-ascii?Q?YtvZZwjgz+djgltNVS19TdHdFtOXRbfoZ4+RTuFO27SsUb5TkxkzhnZ0yr6y?=
 =?us-ascii?Q?YAovnRpaslX2cE3w82Vk+G8WAlCDSbSWL4i3b1ZHc20ogI/wCcgFHBY6E7b9?=
 =?us-ascii?Q?ii0H/3DofcIwTtv9u4/mgklFZgJfeO6TR7E4Mg4KCMkChtvyx2Ln9j+0MtEe?=
 =?us-ascii?Q?BSTCLGBbFVoTPIQ0T4YWr+vEPzbFdkzo18uEyVD0+Uo4iFuV2x0o0sXEENg0?=
 =?us-ascii?Q?0wK6pA1Vcqn7ZQBn/Zm8LpB1qqXmj51CaI1c3xEC7RklkLDi+7O2qG9tFxrP?=
 =?us-ascii?Q?UE5E//ku7GqKgFwWyyBnHGGO1kaLpDp8glA6cFQ+viePGFyJQGN7Rumt0zHT?=
 =?us-ascii?Q?O9U2akA6eiKEXpYvzEH/Lp3hDkOwpixaKnldbOZdaozMRFFdQQ72TsJwjuet?=
 =?us-ascii?Q?yqKVqmtuxoq1CMP6kdZtBUd0CLwNI+WPJTIjBZo5/32K7yr6+TTaCvAvw5lp?=
 =?us-ascii?Q?EUQvdN0jAUWGLmQSum/hUcM88d2phCfMr9cYm/PR75Sh71hgu3tNKuULdBkO?=
 =?us-ascii?Q?RBszQRxwtbZCWjPfg97BA1nQiqj7rMiYvfQWaVn9SBnM6Ex0CLl0mTg1AV+q?=
 =?us-ascii?Q?VsZsxUbF9xz2nHFKj/IIHCOde9PB9SncXx3ww5WqG54ClJYCWFBlKpcJcl9h?=
 =?us-ascii?Q?rGBXNfdx3UQvEYYy6G6n07kLxPdRmLl7Z/jTcx0EC//0lfgs0/JKahR2BH85?=
 =?us-ascii?Q?M/AwkqlVRcuIN8UZsnS8u4q77CARERn/23Tw+w+WHJbQo6kghXMTsdJAaf07?=
 =?us-ascii?Q?i+H5Adz7CiOXM8EGwX5FLLR5s9GjwAl7tvj6eybiGg0b20qyZFBaQMIFPo/f?=
 =?us-ascii?Q?0LNGwpacUnXR6/vK/EnRHr5rsWGGGxeDClIJ2aow41uDFUJ6qUXG58IhlR2B?=
 =?us-ascii?Q?Mm+BbCgy0fG4Uhm+8L2xFz3rBYTl/KK/FsC49uh2E0WuXYOqEb2eGqBnmzoS?=
 =?us-ascii?Q?Et/hRQdliMtmH1MNBsNlk6cNdGNmUhJMHziwnVDcZ6cdiN9AKztHLqHQ6uYu?=
 =?us-ascii?Q?/SbYaKVrTdQ4SGyY+E4l4eKu8JaGvQ8BAouOJNijfaLKmuTP1JZu2FjGKGuF?=
 =?us-ascii?Q?WoytXz3G5qhcKaIsd16mAr2cJzlByhzz41xwcdYszFi3QdJ3MZg6YDpXXNOV?=
 =?us-ascii?Q?w+iJO6YNZ5GkxtloBQ6et/2MuG64TNCjlHnd+1naF+ZfrPrX0iqLCL00wSp/?=
 =?us-ascii?Q?7cw6Xu2+Qg7aNL+T+0hIXiBKhFP3QhFJ4SCXYdIKO/jcjh/PqPlgdsdWSYjf?=
 =?us-ascii?Q?wrw4M9qfH1yI0bUh85hOOvykgww7CMnKhwO5+apL1DGReIz452iBzeE3bYYR?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d38315-3f1a-4cd5-c225-08dcef9a81ea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 17:30:06.5239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOxq6tuYzRl6UT5Z0yAYcD/9kELDXiAbtU128kbp59JCRdV2+6Ra6dW7ApCva2/F/AGwLddT4/NLmOTlsVfcnCUdAzv+5LPpfEnRIXwNm00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

On Fri, Oct 18, 2024 at 07:06:30PM +0200, Maarten Lankhorst wrote:
>No allocations should be done before we have had a chance to preserve
>the display fb.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c |  6 ++++++
> drivers/gpu/drm/xe/xe_tile.c   | 12 ++++++++----
> drivers/gpu/drm/xe/xe_tile.h   |  1 +
> 3 files changed, 15 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 51bb9d875268f..76d8c6868d15e 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -736,6 +736,12 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err;
>
>+	for_each_tile(tile, xe, id) {
>+		err = xe_tile_init(tile);
>+		if (err)
>+			goto err;
>+	}
>+
> 	for_each_gt(gt, xe, id) {
> 		last_gt = id;
>
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 07cf7cfe4abd5..2825553b568f7 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -170,10 +170,6 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> 	if (err)
> 		return err;
>
>-	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);

ha... so this here was against the function doc, which was
supposed to be **_noalloc** and made this way exactly to cover the
display case:

/**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
  *
  * This function prepares the tile to allow memory allocations to VRAM, but is
  * not allowed to allocate memory itself. This state is useful for display
  * readout, because the inherited display framebuffer will otherwise be
  * overwritten as it is usually put at the start of VRAM.
   ...

I think this deserves a trailer so we backport this at least to 6.11:

| Fixes: 876611c2b756 ("drm/xe: Memory allocations are tile-based, not GT-based")

Before that commit the allocation was done later, on gt init, and hence
the xe_display_init_noaccel() was already called.


Lucas De Marchi

>-	if (IS_ERR(tile->mem.kernel_bb_pool))
>-		return PTR_ERR(tile->mem.kernel_bb_pool);
>-
> 	xe_wa_apply_tile_workarounds(tile);
>
> 	err = xe_tile_sysfs_init(tile);
>@@ -181,6 +177,14 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> 	return 0;
> }
>

missing kernel-doc here. Something along the lines:

/**
  * xe_tile_init
  ...

  * Do all the rest of tile initialization, including memory allocation.
  * After this point the tile is fully initialized.
  */

. I think it's important to note the order in
which the init functions are called and what's the expected pre/post
state.


thanks
Lucas De Marchi

>+int xe_tile_init(struct xe_tile *tile)
>+{
>+	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
>+	if (IS_ERR(tile->mem.kernel_bb_pool))
>+		return PTR_ERR(tile->mem.kernel_bb_pool);
>+
>+	return 0;
>+}
> void xe_tile_migrate_wait(struct xe_tile *tile)
> {
> 	xe_migrate_wait(tile->migrate);
>diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>index 1c9e42ade6b05..eb939316d55b0 100644
>--- a/drivers/gpu/drm/xe/xe_tile.h
>+++ b/drivers/gpu/drm/xe/xe_tile.h
>@@ -12,6 +12,7 @@ struct xe_tile;
>
> int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
> int xe_tile_init_noalloc(struct xe_tile *tile);
>+int xe_tile_init(struct xe_tile *tile);
>
> void xe_tile_migrate_wait(struct xe_tile *tile);
>
>-- 
>2.45.2
>
