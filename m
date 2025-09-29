Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAB6CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 08:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A0910E3B2;
	Mon, 29 Sep 2025 08:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B65PboVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895AC10E3B2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759133001; x=1790669001;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MjqkpCM71BA/ukktlG69HYTlQasEY9HOxduXTkJZyZc=;
 b=B65PboVccEhhHZoJJlLxtLAGqBfE3ro4TNrgLve+/kLK9yfGUAHcrrEI
 cZhQPUCNINLx2ypqO9CXgRwbMdcJDlkaoGddMo9y+SILSh7mkWMWcOL57
 w/TR23gO2cZxvmqHE/+9My2AGelcPaITxWcrRxhnDzk0eF2pEBk7j07OE
 VuTzvju51cS/GDro6uYYZYIA0n5ikoqEd2aDUwLAGZj4B8Nde+DWgO6DU
 2mRKQKFV9wKlL30S8mZXsMwWe9t9wLWL/PzLSPd8f5m9gZbzEu4S+5xXO
 2xJUkQ4kLZxliHFaCQiWLbIz6acuIrtBhQS9FOY5fDl1ibSQbIicdt0yS g==;
X-CSE-ConnectionGUID: 0Tr1XWZQQsedYopjzynHZw==
X-CSE-MsgGUID: /qwetNAuQAuz4vGdzrnLcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61287453"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61287453"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:02:14 -0700
X-CSE-ConnectionGUID: 8N3jff5aSr60NCTRhuwPHg==
X-CSE-MsgGUID: LWWUgbS4RFubMiRXWAaLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178555257"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:02:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:02:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 01:02:11 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5kJjf2YdVu4RgInAw8nVNZLcB4RBuk6DSqdmjMRQmnFC6CsFx5dHUGZ4XMtKezYfateJa3X1q+7MJmLPx+y2+l3DlFeMI6r9xgpRa9O4bzCbcffKlDnKBlk9YDyh5Ky8EhGdARw4l6UcPNExro/WlWKyrIq9RhzuW7OItDN0Zi9QZoB8SVuAMsh/J2QJqYFenL0rjsVykegCoCVcjW/L/aYBO2k7U7wAsSy25e2bI0vtXYBVFmlVYkuUdNdIZ87Gz7d1i2Fvkf6ppND5ZRJvH3tB/JZkn7MX3F7kh6ETrXiia2UxCMaBJTXnqZxcxw7/67TJKgeRL/mls+1+k3Adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Dvluf4aBDEZSxI1vjiFwtDTYCAJ/4MEGc0HfvVk2UE=;
 b=qZ+mTF8TkGntM2RxBSXbEIv8yT85XYRpwBdP1vb6NiWXgQGZuzWxVM5M1KRfxhL2HvOiACVPO+LETSm/zjjcemhKgLRgm0bQxT9ZxoNMdJ+xq5jHmWO+TZxM5V1BpAQt9HytS4akEMWks1Qm2S4o9QCaHhcG6oGmmtXIV19vEzjcQNl9AvlcvlvB9bcAkKrpqTAYAUwsm0N5qIagswi9YF/NuOz0YDMmU0bbrTQsxQLIaZHyfK3sr8KwjuEkBShqOWKlmN0rxd4453dffOEZUrjQ5I4VofI+m4XKzF9+KnE1T7DiLIqJS0JPvNAYXOCtoXBuenl3/l3N6+c5DT2goA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:01:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:01:59 +0000
Date: Mon, 29 Sep 2025 10:01:56 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't claim support for firmware
 late-bind if VF
Message-ID: <20250929080156.2laxwtjuavlrsqol@intel.com>
References: <20250928174811.198933-1-michal.wajdeczko@intel.com>
 <20250928174811.198933-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250928174811.198933-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: b3809bed-2bcd-40dc-25c3-08ddff2e774c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEErbExURUNhOHVPdHozODljMURndm1LbnUzNTJCcldGWU4zRHh2OUJqR2FD?=
 =?utf-8?B?eGRkdythZnp2QjJhQVkrTWdqWDhBMk9ReGplTGdzWURVZ3RnRGEwMjBqTmxo?=
 =?utf-8?B?S0lVM1pQRTBUZVRaUmVpUEkrdi92WThUdEk0c3JrV0hhZ1dZUHFTTUJISnhE?=
 =?utf-8?B?NU5rYUtqWUNFeDNYYWQ2M0xSOVlianhLcXdxdG53cjdKOE9GejNXclQ1cERs?=
 =?utf-8?B?MlVrS0tJN1pjZk5mbkxQc3BKTnZvL2lYb282NitRMmJmdDQ5ZFZKY1FBSXJl?=
 =?utf-8?B?dU1Qd1RpS2NtN2grVFdmaUQ5YjV6M0hsTmlsVW0yL3BQWU5MSkdadDBVekhy?=
 =?utf-8?B?WERCU3pobkhRV0dWeUJmOGgyNzVUOGFYUkptY2IrYlltUkNZSWpFczZaTlJX?=
 =?utf-8?B?ZHZsaHBDcUFoaGxweDNLRGZYSnpiaHVGWkkrSkY1SS9MTWVYT200SGtkK3ha?=
 =?utf-8?B?TWdZck56ZlM4a0RVV3VkR3FwTmtVUWxJcFpoM0UwUWFGSW15TlJhemlXR2Vn?=
 =?utf-8?B?QXNJMk80dzhyYkhRdUI3YU05VlBHeDFsSFhsR2ZScEk0MlZGOWN2RW5ldjJs?=
 =?utf-8?B?NUEySDIxc3l5QjUwTW8ybmlHQXZ2TTc4RkdlNHloYTFxZ1BBMTE3Y1NYVWlP?=
 =?utf-8?B?bmNCaFI2UG1Ya0gyYmpkTnh0ZHJiODVnay9naWRJYkNDOU4rOXphcTFKL3NU?=
 =?utf-8?B?UG9RZ0N2NDhyTEdQR3BUUFZ4eWVJaTIzL1VTRzMwR29LS1FiS2kzZy9tWmdi?=
 =?utf-8?B?Yy9ySzZqeTRnVDMzQ2JTYkIxNStuMkZ5M3c2WnNNZW4zdmdmYzlmcnd0MzBk?=
 =?utf-8?B?UDdhaFo0YXA2OUhSUnhCR3Zxcm9vMmlJU1NNUUNNZWYyUENpSUpCckk2STJY?=
 =?utf-8?B?TWEwV2U5KzZ0OHUwRmoreVVDMXo0WWY4cC85ak55L3pLck9KUi9YK01FNGFM?=
 =?utf-8?B?dWljMUJRbXNuSTNFRk9zQmVhbVk4bVFMZnBSU1NBKzJLeGJuanFWckdOSER3?=
 =?utf-8?B?VlhHZVF3OEhlYUtlL2hvNE8zcEYwZnVxRVAyWERFRnl3ZjNOWUdPeVJtcWdk?=
 =?utf-8?B?NnJ4QktZa0xacGw5MldOb1EvbE81VW4raTZuREZ3SlhGZTNoZk5qaXp5anJX?=
 =?utf-8?B?blVOWWlBRjFwVFY0dEx3aTNwQVlZYVlNV0IrOG4vRjY4V3pIQ05kMkptQWRw?=
 =?utf-8?B?djlrNWd4THIzL2ZnT3l1N3BkR2kzNis0aGpSVDVOTkIwNXREWmFaSmh2L0xn?=
 =?utf-8?B?blpKZ1Z3c2hsSm9OekE2R1RMNFFBbWtIYTlWOUgvalpsNlRiQno5MTdNU3Y2?=
 =?utf-8?B?WGxhVXhUcFlCVWVHc2lJUVdnbWlVbHo0bWtIUWh4ZTZvUXNuUUNNa2s0YmxN?=
 =?utf-8?B?NnBHd05oKzZBbmRhK1c3UjdRYUF1Zld3K3RKaXJmelhib09mdkVXemdGcVJy?=
 =?utf-8?B?THYzT240SXhSRm81RmJHUWtFZkxGT3ZQaVo0U2h2djVmR0JKdWpPRUY0am1w?=
 =?utf-8?B?Tll5amZOS3RrQWFRYklrTmdCTHlEZk5xOVprRlUvblhFV0M3bTNRUXpCc1NW?=
 =?utf-8?B?d2M5Nll3dkhtd1BaUXBNbE10cGF6WTdkUlJQME9VbDJSRHZ6OTJyU0VFeEta?=
 =?utf-8?B?a2NoVmllOXZ2bGtJMkZlb3A1ZDZQU0ZrOWN2U21Dc1QraXY0WFZueFNIeGdR?=
 =?utf-8?B?QXNtL3BYcWxmSDgwVFdJay9mQmp4a2lPK3o1eWVGMms4b080N3BQNFMxY3Rl?=
 =?utf-8?B?VVVwNldWQnFLQ01iaHZYUmNsUFNSNEZuakxvWGpwbUR6enJXNmN0Y2drRUZE?=
 =?utf-8?B?aU1NR0NhcVJnbngwWkxJL21vdmJ5OWFkWjNQOHRndXN4NW4wYVFXNENyRnV2?=
 =?utf-8?B?MmZzOUVHNTdFSXhxLzl1WDBXRmlDaGo0ZGZlRHFnM2tyWGpGMU4veWNoQzZy?=
 =?utf-8?Q?YBUTNeHa8fW61SsP65ObGou6Oplb43wp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wms2blBsVmt3VkJWM0haUjJJK3FYb2RPbzA0UjNTQU1rNDdEenVpRHgyS1o2?=
 =?utf-8?B?QTNGLzBJWkJVU0VBdTFhVHFFa1RVS0VRdjVBWFdaa3Q0d3lLeXNtK0gyUEdW?=
 =?utf-8?B?UUt4YzhISjQ3Qk9BWGczanNyRDVEemJmZ0FXZytYYlBlMTBUOEp5R1hpVTJZ?=
 =?utf-8?B?ZXFhK01ndGp3WFRJcDc3dTFJYnUxNDBvOG9UUm0zV0JMWU5Hb0FOdjBSM09y?=
 =?utf-8?B?VmhBeGI0NzVKckdadXJLaFJ2MXozcFNtSE55a3MwTWRBVUZLRGFDc3hYcDZO?=
 =?utf-8?B?ekJRaWdSckdDb0toZXFlQ0xEVzNXS0Eva2lXSEVCZTZPOXREc3ZndVBpV1VR?=
 =?utf-8?B?d1NkeUVmc1NhR2QxcEIyK2hPVWttazViVzlJSXB0enhNVEM4OGVQNEF1a2Vv?=
 =?utf-8?B?bDZEcUE3ait0RjBwZ0hjVmtROXJ5cmNwSnJjZnZRSnVLeXc3YXNXNUxCRWtj?=
 =?utf-8?B?QnNIckxTaGNyVktIb1pFZEpBcTJlSUNIaU5pY01hRWkvRDlzRnRxSTBNeGov?=
 =?utf-8?B?VkV4QlY2REF0TEl0a0pGVUN4WVY2OUdxaWtuWEFERzlEcHQ3YnAvblRBdkJT?=
 =?utf-8?B?SjY2L211c0RLdWNqMk5NOHZ3Wk8wNDFMcVNVTUxXMVB6YWI3SS9WOEZjVm1P?=
 =?utf-8?B?bFkraHUvakxaN00zbWVqekhVdVBkVTdCV1l1S0U1Znd6dnYzK1VMengyeEFT?=
 =?utf-8?B?ZTJmeERVK1dSNzlEZTIwcnpjU1hrdmpkQTNVbzM5cUoxUVlOR0Viei8xVzNo?=
 =?utf-8?B?QWZTYklRTmd5cDZFc3Y2UWoybjhKS1BQL1BZUjh6NFhiWHFrMDdtMnhJY3Y2?=
 =?utf-8?B?RVc2TnNuQkwwd0g1cGhuK1V6TmVxRklhazJkSUxDVFFkL1g2cHhKaTNEUUhn?=
 =?utf-8?B?VG1UVk5IblBpdDh5ZHF6MlZTTEtOVjFXZ2hQMHlxbXVldCs4L21mWXBkYUZw?=
 =?utf-8?B?SjZJYzU0cEJHU1k1YzdvSVVmWnZDdzk5aWNNZk1aR2RPaTAvaElzd3QxbUY5?=
 =?utf-8?B?V0RBc3VYV2JYYnZiOXVwZG1uMWN5OWhxUEFTSDZGRmhtREFlaTVTYlpmaldp?=
 =?utf-8?B?VG0vUVluWDAvVDk0ZjVaTGdKc0lrUmVXTG80ZXFMTW5VaitrckI3eitoVGtE?=
 =?utf-8?B?emswK3ozWGxEK1Q2cmVJQk4wVmZXZlVSNURQdStiWG93aWRTaml0Ymwwc3ho?=
 =?utf-8?B?OGtZSUN5STdmZWRKSjhOQVNLQlZ3blM3ZGlpVTdXYmtvd1g4anErckRMeGFi?=
 =?utf-8?B?YkhISHd4ZzNVNEg1UE0rcjFJNHBIbDduY0JlS3hKOWRncDV3WGdFQWFUazhM?=
 =?utf-8?B?OFBzVFhsai9aRjR1TDNRdmNIQmlqUnM2a2FYQlhOVTcxc2gxcEhGT3VCb3o1?=
 =?utf-8?B?MCtWa1JzQ0piQnBVZUlXWGxEdS9NcXJuSFFOQmxWcTkybVA4eVNCY3hJVkFu?=
 =?utf-8?B?dW90YkxRNXdpVVl0enpGYy9sQmZBSmZiaTFrOVNtSHpreURxRCtjejlSdVN0?=
 =?utf-8?B?NnZkMjNQdEFlN2lLcFF5anF2MHpSWStDTnJ3WlBDelV3QWZDUkJFYXRQSlpr?=
 =?utf-8?B?c1BXWlFZL091MHVVM0R1UldBSjgyOTJaTmduUCt3SlJUckVOU3pkL1IzNzVm?=
 =?utf-8?B?Vkt2d3dUMGtTMFdzTThHNVBPN1lXNXR5VVZhaTljV3VGYzIrS25GbUN3MzNx?=
 =?utf-8?B?TWhTa0NZRnc5VWFlN3M2SjlFS0FSbnRpbG1MdUt1TUI3OS9kQlg0ZE5OTGdC?=
 =?utf-8?B?dVp4V2dabmp6Vk5mQXZNOURuL0F5UjR6MHd2N1E4cWpXY0dhQjVGd1lwT2xW?=
 =?utf-8?B?NUpVTG9qUm4rSXFwSmVzVEVCbGZONENzVmJPVFRINXNZVEVtMklIa3hxY2tr?=
 =?utf-8?B?NkFnZHpLU005V0FJZlNaaGVxaHlZWlNiNndqWmhKU2lIYVZOQjZKZjJpMXp4?=
 =?utf-8?B?YXpqbUd1Q1JjV3FNMUJRRFc5MEx6eGpBcWtURWlNUGxjZm5ZQWU5YTVmWC9H?=
 =?utf-8?B?ZWJUS2hBQTRjWDhnTjNJSE9vNTlQSXp4dHFmYnUzY216MHpMRXhHeGhYTCtv?=
 =?utf-8?B?R205djV1YWd2Tk00NkdyS2EwSDdEZ0x5QzZDY2dhT0F0cHQzcXRzUzJBN2Jj?=
 =?utf-8?B?VE1lSzFmcnpuOHRhaVp0NzFzWTFBQTgrS0xCVE5yM2hYT2M4ZEVPSVBGUTFP?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3809bed-2bcd-40dc-25c3-08ddff2e774c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:01:59.4214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlaB8w+F6LcbUfbWfy2HP5Bi9DA31qLMQcyo3XfLdhxqAAMy1t/RIAjt49VQptR5WrZ2wMwVsf1hgXfwxAylJJpy700jWkRx+UTwD1Oc9HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2025-wrz-28 19:48:11 +0200]:
> In general, the VFs can't load firmwares so attempt to initialize
> the firmware late-bind component leads to errors like:
> 
>  [] xe 0000:03:00.1: [drm] *ERROR* Late bind component not bound
> 
> Fixes: 918bd789d62e ("drm/xe/xe_late_bind_fw: Introduce xe_late_bind_fw")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6190
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0421042597a2..386940323630 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -695,6 +695,7 @@ static void vf_update_device_info(struct xe_device *xe)
>  	xe->info.probe_display = 0;
>  	xe->info.has_heci_cscfi = 0;
>  	xe->info.has_heci_gscfi = 0;
> +	xe->info.has_late_bind = 0;
>  	xe->info.skip_guc_pc = 1;
>  	xe->info.skip_pcode = 1;
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.47.1
> 

-- 
