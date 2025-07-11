Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A75C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223AD10EA80;
	Fri, 11 Jul 2025 16:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/cRDVNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904DD10EA80
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752251381; x=1783787381;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ai45jmsa2gX3Tp63kvkHFyE+vjmsbzYUXLVA6H40dAs=;
 b=l/cRDVNtcvLfctqZhGYNU4l3PEH9DVNwJDIXRPnhvDj0fggyUSkAlzYD
 pF2M1uv7kkj5MIVZood+i3nQuJaX1CV47mvElX5oXcg0sQmocLrUH4KIC
 zbCyNx+s1c6uZG25uyj4xg1if7bz3Cu/wlucUwsV14TR3JfwgVNwU5pGq
 RZEH9LVtGXdJygUz+6mojoZuKJU/z+8Ai32gS9pu8SZcIVGH6eCtsLsbx
 GtYgbZLtXRRS9mBuWZ/CJBoNfoEarnCm3pc9KHbYT96/xwXFct4YPLglz
 VfCRsCuB6JW+3BXvx4nflMXwQuFyast8lon7KFqZ8aaou5HWQGd56a9pL A==;
X-CSE-ConnectionGUID: UW6cOQL0TSGZCbDbtF6MRw==
X-CSE-MsgGUID: TbK8Ffy6TEmfO3+QpRf6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53662985"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="53662985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:29:40 -0700
X-CSE-ConnectionGUID: mB/M25npRMaLUFSnGphvnQ==
X-CSE-MsgGUID: SbAURaYATgqsF5q/VHLcyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="156034627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:29:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:29:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 09:29:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4r29gqgL+6J5WfDaioeSOlUR/vN6yOPXNrKbCZywjz4PXkWam26MyIr7U1wfcNHDlYU5PakIAxddS1T6dxc1KAZ4tX9SeHfgNdPktad2Bv6NPW7MbM1z3Ksuz/DFOFEmjiQ6LR5D4tj/5A0Q1NDEdmMlS0wOdKc03MZE591QbFWA82klkQNu4T0mjpB51WbWJOWqzsHZnEY/aVMOm7oY5p5zJOtbKU6sQPbZ8GuH3kmwrI3s64VHzimPOX9Cu7qOMrV1ykFdE9zvHtgk/zaCq+FSQ+0+xH8F8adr9ba68jYpnKkvv0x+Y+zrcKGhXc8hteN3LTjXs/5XHmyIfVAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai45jmsa2gX3Tp63kvkHFyE+vjmsbzYUXLVA6H40dAs=;
 b=DSu+XJPwMGEGKpem+l/PC+svpsR95Q5iqf8rteBPDOervPVH1tIemSMpSnt3Xszb5TMNqVBvHM39j2ehtQbae1eLEUv7KDKDQ9l73o/nSX8JGusHy7/nsuM89tuHEBYsKO1DlHNZcDTV0S4DAyhGjRc+Ks2uSEvsptef70lL20eY+7e9uxI0GTFcQNXXCCaHrvLErk+BQXBl0u3U9LYJZHNeq8N+5/FSovdvkGr8sToCAPQtl+nIjBCOz5VpFe0COOuCKD8jKuJm94Di8OeG3wJVuZnBfM1EPzupQFjipGVAeFFR0Ttij2GCNr4znIjzAMLvSlHDH/yZTcBp6L4rAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8492.namprd11.prod.outlook.com (2603:10b6:806:3a3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Fri, 11 Jul 2025 16:29:35 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 16:29:35 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move page fault init after topology init
Thread-Topic: [PATCH] drm/xe: Move page fault init after topology init
Thread-Index: AQHb8c5fpuImmq5hQ02lKybd9fjshbQtB9IAgAAVcgCAAAEWgA==
Date: Fri, 11 Jul 2025 16:29:35 +0000
Message-ID: <ae1477a49443fc4c5c9c80e8935d259d7be8141d.camel@intel.com>
References: <20250710191208.1040215-1-matthew.brost@intel.com>
 <25add0bffd0a1a561aef4e32074c93b73ef6fd01.camel@intel.com>
 <aHE7BHmgZSRpcxr+@lstrano-desk.jf.intel.com>
In-Reply-To: <aHE7BHmgZSRpcxr+@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8492:EE_
x-ms-office365-filtering-correlation-id: c3c51bc2-9726-4a67-e0f2-08ddc0981f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q3dxT2NTejR4elErVHQ0QkVzU0VySGZJTmtMWDRBUzdkOVMzNWtYQ0pFSXlq?=
 =?utf-8?B?U3JHOGRSdWp4MFZjUnYyaEpkTnBtTWRReUI3QXZYS3phL0Y0dHUzdFMzaDlv?=
 =?utf-8?B?YmlBcUNNWXlORUtwT3A0MHd1RHQyWVMxOGM3dlNFUmNtSDV6RUNSZmdzdVZC?=
 =?utf-8?B?WUx6L2EzMjlzK24rUUsyWEpMQkN6WnRUUi9ubUpSZHNVZFF4cEJNd0xRSG5a?=
 =?utf-8?B?UlYrMTdTa1ArVGI1LzJOOFQ0TTdDU3ptUEtpY3drNHZ6M1hjbDlGeW5UN2pY?=
 =?utf-8?B?NCtEcmpTemhqV1ZRbmVJeC9TalRsZDV1MVpIZG1sUnlZdnNwaS9QS0JpaHlI?=
 =?utf-8?B?VzhZUlRleWVNNUlsNld3OFljTUdtM0s5Rko3RTFvN1RDQmNraWt0SUxLZnNr?=
 =?utf-8?B?L0E5SCs1OUFYNUF6RkNvVHpGcU9nK2VMYXB0YUpsVkNpTFlkUWxnNjVTem9X?=
 =?utf-8?B?Q2ZQdzlNNnhya0tLZ1lwM2NjeG85Q083S0EzRWtnZ2ZtTnZzQytnOXNXQllE?=
 =?utf-8?B?UVMzS2ZVWEVTa09tYWcwMTR0dCtMSmtwaTdYUElNNDJJMFFObXo4WDBGWDBn?=
 =?utf-8?B?SllWRUxaT3c4NFRJbTR5enY1ODFuQkpUbFpqN2hPcGVNSXM2V3U1WndnRUpE?=
 =?utf-8?B?NFdvRVAraTlFM3NBTlFsb3Zqb0NudEtNSmxYbVBKOUczbnRwOXdDOXlMODFW?=
 =?utf-8?B?OVo0MHpuYTlsWWpTZk9wbm1EYm1uQ21qcTIxRVdpbzFJaFdhMkRJR09EVDk1?=
 =?utf-8?B?V1dwYmRtZUdWUlQ2enVSVCtRc2ZacytWekVodDFpK1Avd0JGYUhuUXBVT1Ux?=
 =?utf-8?B?U25oeWhpMnlYT29hNG5ZdmthVG1aZGpSQ2c0VG9UUmpGMC9hR2VoaFNHZERl?=
 =?utf-8?B?QzRHMW1kZ2pDWlkvYUp0VmE1NEQreldxbURFUWFwWHJLSzBrejR0NkIzajhC?=
 =?utf-8?B?NnFIV1lheldOeEYydTF3OWNLcERxQkprK054ZWE3M3VYV0grd1ZzOVRqakFz?=
 =?utf-8?B?blgzNmxCMjV5UFdjYTc3WG5uTUZ2bmpvT0drTnFCcXdBS1doTmt2VVlpL0xM?=
 =?utf-8?B?K1pnNUdUdXQ2OXMzMnV1TERGZE1uYzNQN3gxaGpWTTZ2bDJndWI1SXBzVldp?=
 =?utf-8?B?SVh0SGp5S2Ftc2ZDdVl5RHozNUFTZnRubUNRcFRPc3V6WTZIUFVtNXd2Wk5y?=
 =?utf-8?B?a2xDcW9nVmhJMmlrYml5N3BGWkNJNGpqYjVBSGQvMUZhZWgwSnJXRGw1Z0RO?=
 =?utf-8?B?NkN6cXlCRjJBSmNydWMza3JhUytVemJFSE9DOWVzM2pJZlVLdkowWHNRYnhk?=
 =?utf-8?B?eTg3dStCM1NyWis2VzFZTXEySXI4Y2hxYTFsTk42Q2g0NGxEYWkxeEM0RUth?=
 =?utf-8?B?d25CWkZodnRsbjYzUjd5SDVqL3B2ejBVMzF3THRxNkxlZ2N1d1RqVWR0M29I?=
 =?utf-8?B?WkJhVjlDczN6QjBRUVFGb3REZjlwOFNmRmNocVVnSmFybWRRT1N0dXBiVE9o?=
 =?utf-8?B?RjUzT0ZxaDRiaEUxcCtuZjNEempRVzJJcGNGMnpSUnEvb1QxWVZkaUNTSnYw?=
 =?utf-8?B?Mmg2MWJJVkl3VVZ5OGdxa1ZrdCtCbWpiMFJHUlAyNWlmMHJGUmZ6cFJqYUZ0?=
 =?utf-8?B?VUlaUXg3QUI4akZHR2pZWU1BSVlPa3g0R0QwUXdNY2ZuSmFjZFlvcXhGeXk1?=
 =?utf-8?B?cHpBbEN3S00zNjBSRk40U1NESHUvM2UvMDlpY1lkYzQ0ZE9pdlY5ZDNKQ3JJ?=
 =?utf-8?B?SFpRQTA2amNxSXQ5Qk5JZVJtdjJKZUQxNHZBbXV5TjZHQXNCOGtsc3hPOGUx?=
 =?utf-8?B?M1llQWJ5TXBwd3NVdXBZRFRkY2Ezc0ZzZW0wUk9nK2lhUjJiNDlTSmRRV21I?=
 =?utf-8?B?QmVhYzR6YkF1SlJYWEs2NjVBeEZnRm11amlSem50N0dJOG0yTjBQRkRSVDZC?=
 =?utf-8?B?V1pJUitKZXhSdVBBMUVNamRiQk9ialR5Wk5UamQrVkgrUUF6VjFBR0Rnd2hP?=
 =?utf-8?B?TVd6ZkJCZzNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3RyeEdBaC8yQXVqVHlGR05oVk5zc3NhREdFcWR0cGZTdmdqMkFqSUFsL2h5?=
 =?utf-8?B?VWlsbVBaM0ZuNUcyNEdOYy96NXgrTzExUlpTSEkrdkVTa3A2U1djWWFveTNT?=
 =?utf-8?B?N0ZFQ1FjZUwvM1UzOVRUbWVRd0E4SEVZMGU2S3lZa1llTGZtYXk2STd3SkQz?=
 =?utf-8?B?YmpZbmI0MlF6OXBXaU1CM29SWGswMU5KSjlDUFNYTnpPakFyUkV0QVlDK2hv?=
 =?utf-8?B?QXRIMlpNZ0xZWmlNQ1d1ZlBLQXhMY3d1K3UrUlkreDljM1VCTGRTT1pDQ0cw?=
 =?utf-8?B?MEZIaGZ2dGE4QUFBOHNnZE95ZndZUFU1ODdQblB1NkNRajNLVVJUa1JPeWM1?=
 =?utf-8?B?VWpDV1VMTlpUVjVQalh6aWYzaDhtdElsM0NKcTZTMnFyTThsZW9EdTVaeHVX?=
 =?utf-8?B?cXFicU1PdTdnUFVIeWl5bmxIQ2RBNENTaFNzbFJIbnE5dXE3eGpFcGh3U0Mz?=
 =?utf-8?B?bWtUQitmTTE3YWZnK0tEbnczNVlLalIvVy9ScEJUUzNjTklDaVBtNW8wUWhz?=
 =?utf-8?B?b0lCWkFNcTVtSzRxazN2dEM0emkxdnR6ZWNaNmdWcmlxeUtSKzBzNHBXbUtQ?=
 =?utf-8?B?czlZcXVvS1lmNk0yQ014ZUJGWXlDRHVDamliSjdHaHBhUFA4U2E0Vmo0RWtI?=
 =?utf-8?B?aHMwc05LWVhmRWNvRFF4TFo4RjNlUDdKeWkyU0VaVkpBOG9udmFBLzhSTXNR?=
 =?utf-8?B?dlpTaUVMVVpmS21QL3o2ckxLUkdXVG1UditxMTdvU01Eem1HbUViOGFXSFJE?=
 =?utf-8?B?OE9rUlBqVVZNRFdHejcyRGVhOHJHZzVIaGxHaW5FdjV0OGh1Rk5FeHVNWWQw?=
 =?utf-8?B?dE5hL1FNMWNuTFl6OWU2bnU5SzBxM0tLdFV4WW9oTkt3Y3pTUGw0UGtZTlVF?=
 =?utf-8?B?MTJVdHlJYXloZ3JEQ2VIL3hxUXZFVjk0SWxaTDBzTTd5OFUyczc0ZnpUQzYx?=
 =?utf-8?B?bnJ3SE5aSlp4dTdJazJqWXc0ZStiRk1lYUpkTHAwa3hlWktkTWt0aERtRFZt?=
 =?utf-8?B?MFZINXNSVXFLZUtxVzA0SDNRaUN0djdNTjJhVFRhZGN4YzJJQm52YW16eUF5?=
 =?utf-8?B?dWZpYW9IUUhBU0lqWnA0RExMOC9SdWo3QWtSZUZzMnVRcGR6Mi9MKzJnL05D?=
 =?utf-8?B?VGQ1SmZlVlRCM0U2UForTWVVSWVSc25ZdHJFdmROWW9tUVljRG54aENaRmFw?=
 =?utf-8?B?dGt6VUhOaUR3VHM1eDhKc3pkVCtCT3A0ODBuN0xPUXVGbzRBbnpNNWgycm1k?=
 =?utf-8?B?a205NXh4VWx0cFNZWDcwRHJLM2VIcUxkYndEazdnbUpvbjJ5TmxFZ3VvY2Zo?=
 =?utf-8?B?c0M2eTIxRWUxM1lsaTdTQnBWa3Vvemx4aSszVGF3ZGE2azlPN2VLRTRPczNo?=
 =?utf-8?B?Si9Cc3hlVkhnL05TTm9yUzZGWUFNbEFYSmR6UWVRZjkyY09WZk9LRGI1Vkhs?=
 =?utf-8?B?L1RzRldNVE1SZkE4VlhCNmJNbDh5bXdtYWtRTzdtV1hPMmV4a1Q5UkE4OXVv?=
 =?utf-8?B?S1JrcHllUks2TGR1U25RdzRMR2NTbFVTdENVRnliSGR0bHVxSkdKWkQ3REl1?=
 =?utf-8?B?ekhPSjhPYjlKU0k1YW04dzA0K1lqdmV0dnZNOXVOYm5RSEszMmlqQU5vWHVa?=
 =?utf-8?B?SERVaitUd2RGSk1qaGxiQWN2TDh3TWlzK1JoNkt1cmhpSVZ0VjJMa3ptYXJL?=
 =?utf-8?B?S1VtUkFSbFZNSkVnbk9MZFA5Q1h6eTM0Umk3dnVmNTFXdUJiNFY1bWJXR0Y2?=
 =?utf-8?B?YjFQUzVLeXowRjN6ZFcwNVkyUGFHTW9SWWJsd1RzOE91UER6NDQzV2d0bGFH?=
 =?utf-8?B?RXhZZjFnaU9Bb2RyQU42THMvdW1GbDZad2VqMVVnVU9iSWUvSEZYUytpaWQ5?=
 =?utf-8?B?YlFvSDBPK0ViK2FFWDJVWjhtMHJNcWloYzRRaHV1QXBtWmltWFJ2QWs2MkRv?=
 =?utf-8?B?MjdPajAzbGVaazJhYTM5NzRvcWR5akFzRWEvNUNhL29vWHp1L2IzSEJnbXpE?=
 =?utf-8?B?UHR0ZjJpenBiTlFhb2Yxd2xaWFpBN1VmZjV4bEc1aHVxZ1BhUE5SSnVlYTVP?=
 =?utf-8?B?ZkxJaU1HSUpYZk9haC9iczJ0NUZMVG9hZWM3RkpYMU15OW84QWFaL3BBQXRG?=
 =?utf-8?B?bHlPeFRHREVhZDNjalloSE8rOE96enE3dTJIZUNLM1EvUkVoQlZVVlArRTY0?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0029A1D76A58B489CB71445B6E558DF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c51bc2-9726-4a67-e0f2-08ddc0981f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 16:29:35.2460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogki4OQ9PaFWYgAmGBYcDHlXeXqWCVbP6NWYn6mvXlmtsH6BlS1WH66/Gi2FKEFPj2Ape+C1BnSTq20YtUxg628nrUrb68KXrd0T+MOYxJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8492
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

T24gRnJpLCAyMDI1LTA3LTExIGF0IDA5OjI1IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIEp1bCAxMSwgMjAyNSBhdCAwOTowODo1NUFNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gVGh1LCAyMDI1LTA3LTEwIGF0IDEyOjEyIC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gV2UgbmVlZCB0aGUgdG9wb2xvZ3kgdG8gZGV0ZXJtaW5lIEdU
IHBhZ2UgZmF1bHQgcXVldWUgc2l6ZSwgbW92ZQ0KPiA+ID4gcGFnZQ0KPiA+ID4gZmF1bHQgaW5p
dCBhZnRlciB0b3BvbG9neSBpbml0Lg0KPiA+ID4gDQo+ID4gPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ID4gRml4ZXM6IDMzMzhlNGY5MGMxNCAoImRybS94ZTogVXNlIHRvcG9sb2d5
IHRvIGRldGVybWluZSBwYWdlDQo+ID4gPiBmYXVsdA0KPiA+ID4gcXVldWUgc2l6ZSIpDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4N
Cj4gPiANCj4gPiBZZXAsIGdvb2QgY2F0Y2ggYW5kIHRoYW5rcyENCj4gPiANCj4gDQo+IFRoYW5r
cywgSSBmZWVsIGxpa2UgdGhpcyB3b3JrZWQgYXQgb25lIHBvaW50IGluIHRpbWUgdGhvdWdoLiBN
YXliZQ0KPiBzb21ldGhpbmcgaW4geGVfZ3RfaW5pdCBnb3QgcmUtb3JkZXJlZCByZWNlbnRseS4g
V2lsbCBjaGVjayBvbiB0aGF0DQo+IGFoZWFkIG9mIG1lcmdpbmcgdG8gbWFrZSBJIGhhdmUgdGhl
IGZpeGVzIHRhZyBjb3JyZWN0Lg0KDQpZb3Uga25vdyBpdCBjb3VsZCBoYXZlIGJlZW4gYSBwcm9i
bGVtIGFsbCBhbG9uZyB0b28uLi4NCg0KKG51bV9ldXMgKyBYRV9OVU1fSFdfRU5HSU5FUykgKiBQ
Rl9NU0dfTEVOX0RXICogUEZfTVVMVElQTElFUjsNCg0KV2UgZG8gaGF2ZSBhIG5vbi16ZXJvIGNh
bGN1bGF0aW9uIGhlcmUgZXZlbiB3aGVuIG51bV9ldXMgaXMgMC4gVGhhdA0KbWlnaHQgYWxzbyBl
eHBsYWluIHdoeSB3ZSBuZWVkZWQgdGhhdCBleHRyYSBtdWx0aXBsaWVyLCBldmVuIGlmIHdlDQph
cmVuJ3QgY292ZXJpbmcgdGhlIGZ1bGwgcGF0aG9sb2dpY2FsIGNhc2UgaGVyZSAtIEkgc3RpbGwg
bmVlZCB0byBnZXQNCnRob3NlIHBvdy1vZi0yIGZpeGVzIGluIHRvIHRoYXQgcGF0aG9sb2dpY2Fs
IHBhdGNoIGFuZCBnZXQgdGhhdCBtZXJnZWQNCjooDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0K
PiBNYXR0DQo+IA0KPiA+IFJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPg0KPiA+IA0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndC5jIHwgNiArKystLS0NCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+
ID4gPiBpbmRleCBkMzk3ZGYwNTZlNGMuLmFmMDNlMTllZjliZSAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3QuYw0KPiA+ID4gQEAgLTYyOCwxNSArNjI4LDE1IEBAIGludCB4ZV9ndF9pbml0KHN0
cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsNCj4gPiA+IMKgDQo+ID4g
PiAtwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndF9wYWdlZmF1bHRfaW5pdChndCk7DQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndF9zeXNmc19pbml0KGd0KTsNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqBpZiAoZXJyKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gZXJyOw0KPiA+ID4gwqANCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGVyciA9IHhlX2d0X3N5
c2ZzX2luaXQoZ3QpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZXJyID0gZ3RfaW5pdF93aXRoX2d0
X2ZvcmNld2FrZShndCk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsNCj4gPiA+IMKgDQo+ID4g
PiAtwqDCoMKgwqDCoMKgwqBlcnIgPSBndF9pbml0X3dpdGhfZ3RfZm9yY2V3YWtlKGd0KTsNCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGVyciA9IHhlX2d0X3BhZ2VmYXVsdF9pbml0KGd0KTsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gZXJyOw0KPiA+ID4gwqANCj4gPiANCg0K
