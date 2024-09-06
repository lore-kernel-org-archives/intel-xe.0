Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0900DE6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 22:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C3210EB1B;
	Fri,  6 Sep 2024 22:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CECh95JW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B80D10EB1B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 22:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725662210; x=1757198210;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u5C0D37HPGT8M7PYj6hXDnxpkB4i9+rg7Bcak6ocLvk=;
 b=CECh95JWBRdbZ+tBps1njZg7pFzj7wxa1+OJ8vFczDW2IcvIgN8BbN+Y
 nCKAespfZzeNhXjIb263FrG1p49pBKnGeHhUhsJH/g3iZ+gQGcPTXvltI
 uw1UDOw4Vse9MC/3NpgPCO1YIRVFE9vX/Y2s5a+KMGECVBcJEnjlusZ2U
 +MTygyH/y6htOBKqyDeKgDPwlfIyDAokICQQ7MqpXbUq1FD1APPozxs/Y
 drQU8ri6Wh0ZOO8gq4244FFVbrl+RCtiqSrRSQp4n+/Hc1w1aXnyvNFL5
 2UzXvg44B3G5lQFfs6mzGKUucxtZuCxVHI0yTrumISTyVF08sVRDg9e35 w==;
X-CSE-ConnectionGUID: Tx6kdWIvQNut4oKcPDY1tA==
X-CSE-MsgGUID: yNeQ2n5bQ5iaHjzLcjqi9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24311643"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24311643"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 15:36:49 -0700
X-CSE-ConnectionGUID: TIApUY+/T16RWTiTvQuBRw==
X-CSE-MsgGUID: YByLC0yrTgK03F5tQlwJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="71040807"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 15:36:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 15:36:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 15:36:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 15:36:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 15:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChWVDA/jyehCO4swlsGhToX89hpBnazVsHFerSw7lgmuc1ZNprsdTqP6+tV54irj+Y2cixb6fvHZwiZOWy2IETc6EFBshAIpOlAgSFYfuSEoZjORZtUmrpaSKmxzUMb+dCjQlAMf7DRXNI7wGzscQuBtGvslO5YXTIIfSu6hB3hJacNKjrw3g6T9jRl+1dQ6t1OlLhiFmHekihbWNayVR/7PbfM6+vtgyyueyJO5moycIo3c67sWexkM6wXaUruTpopGJ68KKlnhsrVrSj3pD4y0egkpttr1XujQyU3berFpcfxueijt3Z7GYmnKdutkknNXnKiEvSEvZ+elLqVBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHmeRuKJfXvD/wkWqEMAyFnNNXsSdFIyaU56EBhqW8o=;
 b=JPkKuOUHxr9N5mirAH/q9L5ZFWg8yhkJKjG19KklRNFkeJzYU5hKBwIYsddYHzAU81+mlQHfrlrlPvKQPkLf1TlUuf83QvCdyTM6aNl26QAE8zxZiXoDQ1szrpUTrQqv5Hlp7bSmQurSKu5n+kF9eT+GyfR04YJfWlAtivL8xD7CJ6aUUngPDh6FSpg42AtgYUlu5Cl3RVoP5OmFsSE8FfYn/zWRvthbbA37eUVzj0231mGP1SPG8cIwaJxmScuQzqvICtJcXdRjQCaSOUm3xTciuiF7FOGOUtnw25XwCKXtm1n6BybEmrReH7Fllo7JDzPbenOIGDYTE1RJ0qtx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 22:36:46 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 22:36:46 +0000
Date: Fri, 6 Sep 2024 18:36:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Don't keep stale pointer to bo->ggtt_node
Message-ID: <ZtuD-jwDQ_8Un2La@intel.com>
References: <20240906220348.1836-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906220348.1836-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:303:b8::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: b591bde8-e0bf-43d3-56ae-08dccec463ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6+0nWV87DLDWPKYyjFrB/xUOq9o897poAUX7LkTfKPndIeHQmb6OxUIJK2p0?=
 =?us-ascii?Q?X85EQtOtLH5muaTW3SxUJDx9l5YCaz1AGlqyPWGQ1dtl0KQLYHaAQbQbO3r1?=
 =?us-ascii?Q?BSUYZA1zhdeiipfcSoOl/rrn8g29U5LlxIbpd/em12ShTK/g00AalzhBmNy5?=
 =?us-ascii?Q?ojDukyKODN/h6pSSAJfuK4kPSBgIP4lXRT6OI8lh2Tu2wFbl7uTcbWiqF4CA?=
 =?us-ascii?Q?caT8SC9CtcMlD8dvVVZmNYogwhnRh82F7C9OVa+9YlPKDflXdPiF2VkAObS3?=
 =?us-ascii?Q?VoZnVT5X8FbPhN7zfTG1aincyCtCeSdCq5gMKGqHMoaYK9bHxZY/iDX/30XC?=
 =?us-ascii?Q?MsfCKpKjtSM5WzOqXmnl81HOQq19UozFwJpIpRSjGq+cO31H/Om3eXnw4mqP?=
 =?us-ascii?Q?WBZ13xWitgLxLLG7hqje+Bd8JL1cBKr/Y88q8FqCPvGF9GODbY8Xi4/jSvxu?=
 =?us-ascii?Q?MRRg1uh1mv72eelKhtS4FxdM0Otnu8on4Gz19QauGJ42LYTQHe6OFHx5A7J7?=
 =?us-ascii?Q?zYzdBl5ZwfpnXENwYd/cmbl5umK72/F1cD4m0PqbpKzxkE0QoXQg1YDX2swN?=
 =?us-ascii?Q?BDpkFs0U1ORNO9j6QBP+4GAPx5YdEC5XcHwVIPhLIWv7ypC4W+lZs1asTaOz?=
 =?us-ascii?Q?jr2l0ogsiGrvLZ1eG6qAWXft38brg5wZThA4psASXcCDEU1wjvkhACWTLprW?=
 =?us-ascii?Q?ZozqBY73Vx3sF361jdi0EjPmPRlS3GOSmSM8Cq+CKm1cesUkJUFr20wRXr+H?=
 =?us-ascii?Q?ru6ElY3Nm/plxr0A144LRix8h8V5Z7JC3kA3BndXO6Ba3eWvccjRu0CnZKTI?=
 =?us-ascii?Q?QEuAjT+HsmDraZf74AXYEPxw1D0K7mKEcKZWQxj75BZu7i7iLGtqP7d070+d?=
 =?us-ascii?Q?HyaTx8+ktCd0I3WaPFnU00R5zlNZLsDKd86Y16h1nnVUakZv9NU+HOpJkvHA?=
 =?us-ascii?Q?sdPlDJptaDzXIZ+VM3h0zbPbpUESvPz4ZnMCh3K7vWvm43qSeYH+n3RIPiYB?=
 =?us-ascii?Q?IYT5LE4rRqhaqZgD6jrkqUL73uCMF3fvaOQD4PCEbMoWRXPjC+X6QbvHUlka?=
 =?us-ascii?Q?Rt5NavMH+r/IBDF/50ZmePh/RyhF3BBLf+ffb9hZwas1pwl3st4PQlcu15U+?=
 =?us-ascii?Q?5JCejUHZFgUcmEzysNJpzKSXLMiSMnoydchyaYCTdnvzKIunxBIrv6ENWZEY?=
 =?us-ascii?Q?pyXG6bQvmIA+AY046+fAPtkz24cunb2Il9IM1r6w95u9tPEFObrBGBFwQcMJ?=
 =?us-ascii?Q?e7ktRw5v9MynO3x+t1i2gMQv8EVx2W+6ZRmpm1G4t+3QZV09Bh61c0eNnQtB?=
 =?us-ascii?Q?s4kOS3Xr5F69zREQ/4eOrH+muoFQJa4kLOzjZY6zvkF0OQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+JHW7Jm5mTXqCc7PwemesiBWFIkq0biXI5P0AxyGnPs+J4e2dj+FeuKdgCJ?=
 =?us-ascii?Q?+BBwDXmJbIuuxJtW3Oa2C8/SSl67Sz4qu64yVA99KGfWoZhuFGSui00MVtz1?=
 =?us-ascii?Q?loG7W5kwGCTSecdi4Qw2UWJQJbailag/KvS7kP8BomHmu4YsnYH3ckUnAlTo?=
 =?us-ascii?Q?2gJGSHLSIF7p8rWFkQ/tuW35MNZE787DS6niSy2YjWBDHmX6v69+S2cCv52l?=
 =?us-ascii?Q?k6qsW4vDDdg+rcbhoQoCNQv8M34QOAAbEi+a/fN68S3CsxED6XV+vkV7HQux?=
 =?us-ascii?Q?pKS7gA8soWPVP4RExc/yUZPbCJybBPc7qO5Sg8fGGIq0zU2vPBxVWOdHoXN8?=
 =?us-ascii?Q?1D2qUCUd7EfUIg7w5XdYQnrvFQtTTeuwT9vbnbw34NcSBJM7fdl8tI2ZmTUS?=
 =?us-ascii?Q?hpOFkB4QfAu36ZBgo0U+H8Dr8dtmOPoXye5LJOS4IWLfujwkZHtTKmjK8rmu?=
 =?us-ascii?Q?77jmIsuz3Ms7QfR6Y7f1SnIXo7O6uCdG2nnCNi0wt2VKLWnDmfzpJjKjW9R2?=
 =?us-ascii?Q?3zewfmfwRG2GFyNDYYEoTMZ9n/dhbGvJvW6Q/boC5fRwjCjqB759sK2udzEZ?=
 =?us-ascii?Q?T5u0JGxKjrB0Ad23hJIcHR/TRkntlm46+9UDFizKkaH6oyBgCztm2phVCik7?=
 =?us-ascii?Q?FJxp2c8rR4DwBRqj9lKszuMWZ3Wr8VI8uSUZ+c/a6u7nDHg2dQ0gvdhyO2Qf?=
 =?us-ascii?Q?WVcbqSLGDCSqs89QrUtu2wjOLLaCn8P9glBI40CRQw9+72zZ1z8c3GFC03kz?=
 =?us-ascii?Q?z6myuaQ3HVS7BYjiGPqD612iiXD8IFy4sKhLAdYXljGf81c6DXa9aOePcuUQ?=
 =?us-ascii?Q?LKlgzZHKxP2gGTWQkx2ctn8uRiJINPFMoRnTCaxBIjk7D8UcapyIoW8U85mm?=
 =?us-ascii?Q?looG3+f7L+Qei1LamAQhsFlXx5VlRSWtmxDA2cYYA2lGfsqnAD2lTel4QAm0?=
 =?us-ascii?Q?NaFXLpl/JrbT7F9Cs/rmya5VTcOXzJMqzrUjJLr2pob7urkIRPJgSv+djj99?=
 =?us-ascii?Q?Lus3BkES7rwWCLRzhZoQuPqK//s/sdyhOTCVc1A/0D7gGGiFx2LwzeYGVxpf?=
 =?us-ascii?Q?YABJwjOA6FQgMm/2OJOfaX8QtyMfZNsNXm1lnPNqteE60vaEQ4vweppSsOBR?=
 =?us-ascii?Q?8iM7C1IR1HpJGAIiPOM/D7rI0/Yh9dVysomiFgYEJR4Bq32Lc/n6UVGWBoOx?=
 =?us-ascii?Q?gec4NSSdNYPRDPWytiFXmMJTd/FpFpxZv0dqK8YzamfHPRjlCxQSaJLdDg/K?=
 =?us-ascii?Q?i+Kdat3Pn3qss9WN4ezVF6S744rPh9uFZ52uoGDdtm+nW0ryqG9CQt1sMm/2?=
 =?us-ascii?Q?VHfzaZ7E3ay8ND1nNcBHb4r/7vRczu2iBwP1cT5NtM+nLXKGWK5dARwrLF1d?=
 =?us-ascii?Q?mloWQC/qy8qnWpvj6bpBaraq5/HrzSVTydnU/8t75B5Lu8wHkhWGs6qwX41N?=
 =?us-ascii?Q?Ufq5AB37t/dz0BuZDQjcQQntlkG+K0XM4sRmrfBaWrrk5aOp1VyDnRgoOIab?=
 =?us-ascii?Q?rSJvkWQm5xITKP//UEdhWTWoKWkAPNOvEqw3yGCZqd8655UKhOLZAtr/EL89?=
 =?us-ascii?Q?ggbImHEz47SUJMuUhZP1a5Yk8ZfyzzwguJQ4srhGw3KoT41EISWpw0tYyDQD?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b591bde8-e0bf-43d3-56ae-08dccec463ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 22:36:46.2658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYDpHXwd96T/Oc5hN9bUjQ41eotfnWI9W1w6JXPWZPglmNJyw0LtLqZmJshRCrc0bwrCDuFfgkCJpbQXU+bdaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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

On Sat, Sep 07, 2024 at 12:03:48AM +0200, Michal Wajdeczko wrote:
> When we fail to map a BO in the GGTT, we release our GGTT node
> placeholder, but leave stale bo->ggtt_node pointer to it, which
> triggers an assert immediately followed by a crash, due to UAF:
> 
> [ ] xe 0000:00:02.0: [drm] Assertion `bo->ggtt_node->base.size == bo->size` failed!
> [ ] WARNING: CPU: 4 PID: 126 at drivers/gpu/drm/xe/xe_ggtt.c:689 xe_ggtt_remove_bo+0x1d9/0x250 [xe]
> [ ] RIP: 0010:xe_ggtt_remove_bo+0x1d9/0x250 [xe]
> [ ] Call Trace:
> [ ]  <TASK>
> [ ]  ? __warn+0x88/0x190
> [ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
> [ ]  ? report_bug+0x1c3/0x1d0
> [ ]  ? handle_bug+0x42/0x70
> [ ]  ? exc_invalid_op+0x14/0x70
> [ ]  ? asm_exc_invalid_op+0x16/0x20
> [ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
> [ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
> [ ]  xe_ttm_bo_destroy+0x11f/0x260 [xe]
> [ ]  ? ttm_bo_release+0x31c/0x350 [ttm]
> [ ]  ? __mutex_unlock_slowpath+0x35/0x270
> [ ]  __xe_bo_create_locked+0x4a0/0x550 [xe]
> [ ]  ? mark_held_locks+0x49/0x80
> [ ]  xe_bo_create_pin_map_at+0x37/0x200 [xe]
> [ ]  xe_bo_create_pin_map+0x11/0x20 [xe]
> 
> While around, for similar reason, also don't keep an error pointer
> if we fail to allocate ggtt_node placeholder.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f3fca5565d32..2895f154654c 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -619,16 +619,19 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	bo->ggtt_node = xe_ggtt_node_init(ggtt);
>  	if (IS_ERR(bo->ggtt_node)) {
>  		err = PTR_ERR(bo->ggtt_node);
> +		bo->ggtt_node = NULL;
>  		goto out;
>  	}
>  
>  	mutex_lock(&ggtt->lock);
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node->base, bo->size,
>  					  alignment, 0, start, end, 0);
> -	if (err)
> +	if (err) {
>  		xe_ggtt_node_fini(bo->ggtt_node);
> -	else
> +		bo->ggtt_node = NULL;
> +	} else {
>  		xe_ggtt_map_bo(ggtt, bo);
> +	}
>  	mutex_unlock(&ggtt->lock);
>  
>  	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
> -- 
> 2.43.0
> 
