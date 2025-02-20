Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9528BC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 15:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4110E991;
	Thu, 20 Feb 2025 15:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HczKRxZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD06310E991
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740064744; x=1771600744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WtlbXnQqW0AMEW3pDMFzF6YORBu9FeadiGozM7EJSC4=;
 b=HczKRxZfyio7ux2IGqS2EPQMPKGAVm0fha3yAekX6fAWaJzROZ90hsZp
 aATNa1rh4ImvOoEqDWJzmAVIeK0KDQsJ9ptl4ygdUMhWEULnG52k5Wal7
 e+EDz62HAznHTtBhDioWsn/gRWROmds2F/hv4sgtxJaf4nijMjPyl5IpJ
 TTPiEiV8nJaOyDFEpz3FTmPGvcwJJxYr01snyEnsLRCPWmW1tgDMt2keA
 k/PpFUAib/nO/lxgIap94kfl935npm5uCfmvZJ+qIGx8KCwr3+3CfQcYM
 5qqN44CjZVZb+WRefTwfxfonOX5eudDqmCyb1AnwYk07fjb0MDarU3CEk Q==;
X-CSE-ConnectionGUID: vmDONBp0QOal5SF5s5RV5A==
X-CSE-MsgGUID: c39aAwgxT9eFdctfApRJSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51063272"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="51063272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 07:19:04 -0800
X-CSE-ConnectionGUID: raxh4j7TQiefRC666LhVQA==
X-CSE-MsgGUID: bHDG3E42TpWkk9AXI6huJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115598881"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 07:19:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 07:19:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 07:19:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 07:19:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpcLcjsKBxPEGYc6gJUKDviggepjrDPFd2Y0AkPKnFyUTi7cnM1rgLvt6a1gK0hL3Zu4mrLTXgCwW3CRxVa/BzbjMpQi83bQfSY8J/KbRF8krEbZr0XxYSphjUywH+WHktDI6t9V/tGI7l/27EeY8azHFRCY5dMh5WW/HDAE3nApbkW66N28iPYbYOENGHME5GX6LkuomNup/+ePNw0Bnxkkn2KobCMxay1N61KgcLhcz/VIL3ENRz0d/HK/3ULqSUJn7Ud43zgcP4pO//mgv05kWYzHmJP3A0qiI8FmS7SXk0HFRolj/0Z+zcwMqC93Mz41tdDBrclyKLbxvq9ryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtlbXnQqW0AMEW3pDMFzF6YORBu9FeadiGozM7EJSC4=;
 b=CVLEd7fcnUICpH+MAuCd3JacLXrtJDGp4uSAnaRQA94ApFCo5z60uC5/tbEK9YFyYzJzqNtKP6zKGWC/nkDCcUJXvV4Tp2LTmWwZpQI2XPKOD7KeQJ1k/3osfFJiDS0J5R4DPI/eucojOsFXUDICDfK/LFN2ivGRspMlCa8fZv6M4LmN6I3bqwKtpW/utl0zFMnJx90MrxQx6PudnWFBcYK7inHhxho+GEktkZk36axRo7Nh+sVh3/dsUXUoQW5u5LiYPF8HxoFW8YLauWCKTeEjGawjWrj5kJueDl6fsKTrygwlbwSnaulUuP86Ep/pG3+SMvMbpfzN4BQZ7xKvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 20 Feb
 2025 15:18:48 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 15:18:48 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/vf: Retry sending MMIO request to GUC on
 timeout error
Thread-Topic: [PATCH 2/2] drm/xe/vf: Retry sending MMIO request to GUC on
 timeout error
Thread-Index: AQHbg2BU4lsYSdu6dUWGVk2XNWQZhrNQFT2AgAA10wA=
Date: Thu, 20 Feb 2025 15:18:47 +0000
Message-ID: <LV3PR11MB86950263A23A64F6840F489DF9C42@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250220064119.26623-1-satyanarayana.k.v.p@intel.com>
 <20250220064119.26623-3-satyanarayana.k.v.p@intel.com>
 <20250220115303.ywzoaxc6w3aawszr@intel.com>
In-Reply-To: <20250220115303.ywzoaxc6w3aawszr@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SN7PR11MB7139:EE_
x-ms-office365-filtering-correlation-id: 985b1eeb-e3cf-4a44-30bd-08dd51c1dfaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TG9NUVFFL2RaQWJicjY2MDdDcnVRbnFRTDVvMklaL0ovd243ODNiUkgrQ21i?=
 =?utf-8?B?cFNaeTNlUmFOdS9LOUhzNEpVd2M3YStDS2UvejdaMUdEL08zajJRTFlhMWlZ?=
 =?utf-8?B?YmUwZzRXNUZjN3p5NXkxeFZDWjIwMWEvQmhVak14KzZGbElSUEpEOC9oMDd5?=
 =?utf-8?B?L0dBcTBkYUhkd2g1eHNLU1FBcDAzSk1hZnk0cy9MaWIxRmN3cTJTaSsxdUEw?=
 =?utf-8?B?MUljZG9uaVEyVCs5b3FFVXh3dXE1WTY4RmI4MmdQUDh4TlBmMFlwVitNeDl6?=
 =?utf-8?B?MWhvZGNWa0wxNkU1NWlaK3Rhb3lONWs5YW0yekRWenZPa1JXWDFsTlR5SlZZ?=
 =?utf-8?B?ODNHU2VwV2dNUTJmSWcyTmhjSEdBTHJnQUxuMkl6UmNPTDlGZVdER25HdzR1?=
 =?utf-8?B?UDljbGJYQzRiRnlpNThtVE1Oa21qem9TK3Q1V0JXajVQRnBuZmdMUXNlbEdH?=
 =?utf-8?B?Q2J5L3c4cEhwRUc0eW1UZDEvbDA1clBSUzM0ekYyNDNKMG9ITWN4MWZHTmpX?=
 =?utf-8?B?MjFYQVowU3A3d1QvVndtb0NqWFlQYk8wdm9zdlBKK0psOXNsaXNNR2s5a1N0?=
 =?utf-8?B?V2x5TG5XSkppM2FuVlZUYWM3dFhWRGJxSHJ4cWhOUGlwRXVrR0RUTFJjdzB3?=
 =?utf-8?B?cTdNNUZFcHYySXBvZkNhZnRWYitoYWdFdC9ibmFBTGg3RzVvOTVWK0VLcDdy?=
 =?utf-8?B?ZXhoZ3FLZ0ZtVVdER3pVSHNsK3dHUDh6dVNBQ21FRjdVRkkramNwYVlLWml5?=
 =?utf-8?B?NW1XSFllWXhNdGp3aFJHR01ReGI3MTFVdDVCT0FxL3hEeG0wY0ZZY0VvUkFG?=
 =?utf-8?B?dGdYeVBXd1h4K2JxVHJYNzZUOXpyNjh5TE5vY29BdU0vMUd0T01YTmMyWXlh?=
 =?utf-8?B?bC9lY0lsK3NYNUx3a0I2UEI4M3dTZXI0ME8xMlJJVTd3cnduYlRyLzZVRzMv?=
 =?utf-8?B?bTJkc3RuRW9hdmNuRkhXRGV3Uk9PNGNGNUJnUEJqVzlIS2RMVHU1ay9KN1Zp?=
 =?utf-8?B?OVhuN3pLdVhUeWhmSWhjQytWTGU0ZFAxbTIyT05CVlBjdUNEb083UDdlNVhp?=
 =?utf-8?B?NXEwYWZ4V2dEaHhBWlkrTkoyTndZL1pFY0ZieTdoVlRUbGlLMjlTbEh5d0RW?=
 =?utf-8?B?OFdhYllWSmo2aGRiaEN1VWFtS1FFQ2VjV0loRVJHYzA5RThaR3huRmhuNXBu?=
 =?utf-8?B?dTR5RmxSSWNwbmh1eS9hUFViaXhKeXJsaHU3elRtamtUci9xVEVjNVg3VFFo?=
 =?utf-8?B?NlliVnpaelFpYmkzNlB4SnlMb0ZMT3JLT0xna05QQmpRNU5SZmw4Q1krb3d4?=
 =?utf-8?B?L2lYWnRabnNDc1o0N1R0Y2tNZDVYV2ZZVnl1L0lndEJZWWtvOE9IZVF6Y2VO?=
 =?utf-8?B?eEtxM0NmYWI5UE5DQUgwMmR1R2x1M0l1TlB2UjZqQWR5SEdSSXh5NDVJT0hp?=
 =?utf-8?B?Nm45Q3Y4Q2V3YUp3WlEyM1g2aTJvMGswRTQyck4xQWNpemxHdjRrbWZpVmIz?=
 =?utf-8?B?UGFEaFM5QXRtZmJnNlI2SzAyMmRuKy9vNTlCbXZZMitibjZidnZOMGZZbCt5?=
 =?utf-8?B?cHRzVld6N1FXZTFJK0FuaTR6T1FvUkZ4N0VMdG1mcFNtKy85d3I1cjFYaUcy?=
 =?utf-8?B?cE1XeDJYT2pYNjY0ZTZWbVZBU0l6SFpiVmoyZStrZUFUN3lJRFpIMWI2Z1Uy?=
 =?utf-8?B?ZTJCY0ZxQTFGRi9nNjdTb29oR00xL2Y0ZTdsaU9XbDFkb2JQbjdZR2pOWkVB?=
 =?utf-8?B?akc2OHZZWUkyOUtmNlgrdzZjbE1SeDdDNThpYXJjYXh4YUdYeldQMzhEUjVE?=
 =?utf-8?B?ZE1sdXFvVWtWK2poWkwrVm1FdUZpd1ZxQXNaczNwdzV3UnNXamJKb1RVeHNo?=
 =?utf-8?B?bkVLRkhIL0Z3WjFlaWI4OTUwOGc5aWNubWc2RDZWMklIQVkvMzkraVlNSWtH?=
 =?utf-8?Q?x+iQpTSu7AEP4gnc+2L9YOuLtfQTBnSH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTVDeHh5VHd4bUcyeDZiUEJteFR3S0JUcXlmZHJvSGl4RlAvL2RiTWJXYnQr?=
 =?utf-8?B?aVk1dE8xZE1WVVQzT0ZOWWJtcnhteW5tWHBLQjJERENlTkRlcFpHNERBbUU1?=
 =?utf-8?B?bDNKdG1EbnErR0RTVVVSMDQ0M3ZDSDI0L2hpTitwSlRlR3d2ZGt4NDRPZ01v?=
 =?utf-8?B?VnlYQ052QW4xZzR3bDR0TGovcExqdVBCZmlsS3dWeXJ4K3hZa3JDYkdzalZq?=
 =?utf-8?B?bWd6cExWdEtCL1ZSRktFV1ZBY0czYWYybnJqZFB0aHhMbDlCc0VnNzdZdWhs?=
 =?utf-8?B?TkY2V2tCQU53anprRjJPR0llME1WQitBU1N0aWZlR2d1T2U1WnlsM3dUWUQr?=
 =?utf-8?B?V0hIVzdKVDZlUWxBVnhHM2ZaN0U0V1NUOHl0c3d5N0x3TGNjak56ZGd2anRy?=
 =?utf-8?B?VWU0N2xmY1pPK1N1SU54a1dUZENBYk4vZ3gzaURZZ2FyQWdEcjlUaUMxRzBL?=
 =?utf-8?B?N29EL01pSFBYOXdocFRqSFlmRHhRMU9MeUduRDNVZkw0cU4xZWRhb3dQTDZT?=
 =?utf-8?B?S3kxNnhQNUszY0Q4ZmgyU2JubkdhMDBkdklhejZQelJ4dUNKWStUUzdCbmJX?=
 =?utf-8?B?cXlSaEFVTmFiNjNXbUZoc2ZjMWJxb21LbW0yRDBDbU9tb0d2SEc4KzN6ZThv?=
 =?utf-8?B?aStoQ0JxcDBJUk9zazU0SjNoelZJL1lPd0hQQm01ODREajNqVXN1UW11YVVB?=
 =?utf-8?B?WDRRMUEvWlA3STErbkpOSlVpKzEwdWFXUFZRSjc4OVBsbFFWWGJ6VjNPRFZk?=
 =?utf-8?B?QlJhNFpoT2YvSlZEYlhSL1pkR1NUcitPd21TVmNFVTNKeEdUbU4xWXdlbTYv?=
 =?utf-8?B?MjNNdUJVZks2MS9GUlU1c1FuaCswZ1AyRUNEb1Bwb0JPUkdUVm12SDV2L2xk?=
 =?utf-8?B?L1gxenlJcTFCVHJDUlJHVzMySzdsOHF1d0VPcGxTUFlBZ2ZFK1paVjhTOStO?=
 =?utf-8?B?Q1dxd1pUWmVXUDJXYVlWTm83UG9TQk9yUU1YREU5dS90ZzY2WHVsZFBCQnRV?=
 =?utf-8?B?cXdaWHBKK3VHRDVhcVBRa1BVWi9Rc2dqSW00b0I4WHBHVXpMQWU4Sy9xTXZD?=
 =?utf-8?B?L0RJYjJHRzlCSTBmTnhXd2tXa0dxa0g0M2J2NzZwNWtMZ24vRGkyT094OTYx?=
 =?utf-8?B?cmpKZ1JWZlVzSWJKQ0lIU0p2aG9KdDBVWDdMZXpaWHRuOHBDbGZrWTdlaHNW?=
 =?utf-8?B?cG9KbEdoQkVHdDF6bEdrQ1dsRGpCYS9Kak9pZEoybjJBK1cybVVlRHlwRzFx?=
 =?utf-8?B?M3dBSmZ1S1ozTGVvM2JwdDQybTJwSnVEWXZYUDZXRzRHdHBUUmpaYmM4L1pT?=
 =?utf-8?B?Y0FQb1FtTWlGU0R6QUNjOXRBQ1JPaXZJMkkxTEd5UnNtUTBGQVFkTFRzb2xN?=
 =?utf-8?B?ZWVxVlBrTHlBU2t4eVVObzhyZTAvTU1hMDhHVGpvcEdKMzloMTdVRWtxZEFp?=
 =?utf-8?B?dXVXNUY2cTczejlKNC8raVNDMFRhN0RwdEpOaThlMGlJcHNZb2J2R2hvb2lG?=
 =?utf-8?B?K01YZWp4Ri9jMU5OY3Ric3grdHRYcWM1WS9PR3dySWxVSTlOenNTdjNvcjhG?=
 =?utf-8?B?dW5OVzhXTHVvWDVRam0xSUd2dzQ1WTJxenVRc0lidTRqc3VLcll0Yys3OWg3?=
 =?utf-8?B?VFdwYWpRcUZEbW5QRWdJcFdnWU1jNTEwT1UwcnMxR1BHNi9GeFpkcHBvZkVN?=
 =?utf-8?B?Z2w1dTBGd2ZaVU9TSHMyOWxYYTQ1MmpmVG1ldS8vekZRLzJCbUFrV3dwTitX?=
 =?utf-8?B?eHpaTm00SFZYemxQWHRFalhseC9CZDZNT3pjZUFSWlQ2RjdEZEFBclkrdzg0?=
 =?utf-8?B?SlFCSGJMSCtoWmxjY1NkdXR0QU5jTWZHdU96cGE3WTVxQUxCSXp1NEZnbHEv?=
 =?utf-8?B?WXA3VUJGd2dCUXkwc1lMcDBubHJlUGJ2YnVFK2RJcmxWOFZPS1p5KzQ1WU14?=
 =?utf-8?B?Tzg2amRXVTkvbzJGbUFaMDA5aENSbVkxU2UwTlpwemh6Skhxbkh2eTRjait5?=
 =?utf-8?B?dklVdyswUXRKWmpJbU0yaUkyelp1ZXZlTEwrWFQ1Slh6T3ZPMVNXLzk1Vkxa?=
 =?utf-8?B?WmN4b1VuTVVuZXFzZGQrcGxmWDZMdUkwZnZIdnNhZDB5aXk1TVoyN1BaZ0k3?=
 =?utf-8?B?cFRFQ21HenZ0QjRRRDV3M3RTMnV1b2ZZTGpnRWE4ZUFqNnBLQlZFWXBTaDZl?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985b1eeb-e3cf-4a44-30bd-08dd51c1dfaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 15:18:47.9136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1V7bafK3zu2UlJ8CKbh9OUQEa2dFnarEQqFsQhW8UVfL45KXFEUqJPJJB1mXx/H65WcscCSCUpvYHyiINSyX2rxqqTdqh/mfmFTovPrrM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaW9ya293c2tpLCBQaW90ciA8
cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAy
MCwgMjAyNSA1OjIzIFBNDQo+IFRvOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0eWFuYXJheWFu
YS5rLnYucEBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IFdhamRlY3prbywgTWljaGFsDQo+IDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT47IFdpbmlh
cnNraSwgTWljaGFsDQo+IDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAyLzJdIGRybS94ZS92ZjogUmV0cnkgc2VuZGluZyBNTUlPIHJlcXVlc3QgdG8g
R1VDIG9uDQo+IHRpbWVvdXQgZXJyb3INCj4gDQo+IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlh
bmFyYXlhbmEuay52LnBAaW50ZWwuY29tPiB3cm90ZSBvbiBjencgWzIwMjUtDQo+IGx1dC0yMCAx
MjoxMToxOSArMDUzMF06DQo+ID4gQWRkIHN1cHBvcnQgdG8gYWxsb3cgcmV0cnlpbmcgdGhlIHNl
bmRpbmcgb2YgTU1JTyByZXF1ZXN0cw0KPiA+IGZyb20gdGhlIFZGIHRvIHRoZSBHVUMgaW4gdGhl
IGV2ZW50IG9mIGFuIGVycm9yLiBEdXJpbmcgdGhlDQo+ID4gc3VzcGVuZC9yZXN1bWUgcHJvY2Vz
cywgVkZzIGJlZ2luIHJlc3VtaW5nIG9ubHkgYWZ0ZXIgdGhlIFBGIGhhcw0KPiA+IHJlc3VtZWQu
IEFsdGhvdWdoIHRoZSBQRiByZXN1bWVzLCB0aGUgR1VDIHJlc2V0IGFuZCBwcm92aXNpb25pbmcN
Cj4gPiBvY2N1ciBsYXRlciBpbiBhIHNlcGFyYXRlIHdvcmtlciBwcm9jZXNzLg0KPiA+DQo+ID4g
V2hlbiB0aGVyZSBhcmUgYSBsYXJnZSBudW1iZXIgb2YgVkZzLCBzb21lIG1heSBhdHRlbXB0IHRv
IHJlc3VtZQ0KPiA+IGJlZm9yZSB0aGUgUEYgaGFzIGNvbXBsZXRlZCBpdHMgcHJvdmlzaW9uaW5n
LiBUaGVyZWZvcmUsIGlmIGENCj4gPiBNTUlPIHJlcXVlc3QgZnJvbSBhIFZGIGZhaWxzIGR1cmlu
ZyB0aGlzIHBlcmlvZCwgd2Ugd2lsbCByZXRyeQ0KPiA+IHNlbmRpbmcgdGhlIHJlcXVlc3QgdXAg
dG8gR1VDX1JFU0VUX1ZGX1NUQVRFX1JFVFJZX01BWCB0aW1lcywNCj4gPiB3aGljaCBpcyBzZXQg
dG8gYSBtYXhpbXVtIG9mIDEwIGF0dGVtcHRzLg0KPiANCj4gTWF5YmUgSSdtIHdyb25nLCBidXQg
c2hvdWxkbid0IHRoZSBwcmV2aW91cyBwYXRjaCBoYXZlIHByZXZlbnRlZCB0aGlzPw0KPiBJIHVu
ZGVyc3RhbmQgdGhhdCBpZiBQRiBhbmQgVkYgYXJlIG9uIHRoZSBzYW1lIGhvc3QsIHRoYXQgcHJl
diBwYXRjaCB3aWxsIGNhdXNlDQo+IFZGDQo+IHRvIG5vdCBzdGFydCByZXN1bWluZyB1bnRpbCBQ
RiBoYXMgZmluaXNoZWQgcmVzdW1pbmcuDQo+IElmIHRoZSBWRiBpcyBwYXNzZWQgb24gdG8gdGhl
IFZNLCB0aGVuIEkgZG9uJ3QgdGhpbmsgdGhlcmUgc2hvdWxkIGJlIGEgcHJvYmxlbSwNCj4gYmVj
YXVzZQ0KPiB1c2Vyc3BhY2UgKGFuZCBWTSkgd2lsbCBub3Qgc3RhcnQgcmVzdW1pbmcgdW50aWwg
dGhlIGtlcm5lbCBvbiB0aGUgaG9zdCBpcw0KPiByZWFkeS4NCj4gDQo+IFNvIGl0IHNlZW1zIHRv
IG1lIHRoYXQgYSBzaXR1YXRpb24gc2hvdWxkIG5vdCBhcmlzZSBoZXJlIHdoZW4gVkYgc2VuZHMg
dGhlDQo+IHJlc2V0DQo+IGJ1dHRvbiBhY3Rpb25zIGFuZCB0aGUgY29uZmlnIGhhcyBub3QgeWV0
IGJlZW4gc2VudCBieSBQRiB0byBHdUMuDQo+IA0KPiBCVFc6IFRoZSB0aXRsZSBvZiB0aGUgY292
ZXIgbGV0dGVyIGlzIGEgYml0IG1pc2xlYWRpbmcgYmVjYXVzZSBpdCBvbmx5IG1lbnRpb25zDQo+
IHRoZSBQRiBhbmQgVkYgbGluay4NCj4gDQo+IFRoYW5rcywNCj4gUGlvdHINCj4gDQpBcyBtZW50
aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBUaGUgVkYgcmVzZXQgYW5kIHByb3Zpc2lvbmlu
ZyBhcmUgaGFwcGVuaW5nDQpJbiBhIHdvcmtlci4gIE9uY2UgdGhlIFBGIHJlc3VtcHRpb24gaXMg
Y29tcGxldGVkLCBWRnMgc3RhcnQgdG8gcmVzdW1lLiBJbiBjYXNlIG9mDQpNb3JlIFZGcyAoc2F5
IDE2KSwgYWxsICgxNikgVkZzIHRyeSB0byByZXN1bWUgdG9nZXRoZXIuIA0KVkYgcHJvdmlzaW9u
IGhhcHBlbnMgb25lIGFmdGVyIGFub3RoZXIgYW5kIHNvLCBWRnMgd2l0aCBncmVhdGVyIG51bWJl
ciBzdGFydCByZXN1bWUNCmJlZm9yZSB0aGV5IGFyZSBwcm92aXNpb25lZC4gDQoNClRoaXMgc2Nl
bmFyaW8gaXMgdmFsaWQgb25seSB3aGVuIFZGcyBhcmUgcHJvYmVkIG9uIHRoZSBob3N0IGFuZCBu
b3QgYW4gaXNzdWUgd2hlbiBwYXNzZWQNClZGIHRvIFZNLiANCg0KQ3JlYXRpb24gb2YgbGluayBi
ZXR3ZWVuIFBGIGFuZCBWRiBpcyB0aGUgbWFpbiBmZWF0dXJlIGFuZCB0aGlzIHBhdGNoIGZpeGVz
IGFuIGlzc3VlIA0KYmVjYXVzZSBvZiB0aGF0LiBTbywgdGhlIGNvdmVyIGxldHRlciBpcyB0aXRs
ZWQgYXMgIkNyZWF0ZSBhIGxpbmsgYmV0d2VlbiBQRiBhbmQgVkYiLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5j
b20+DQo+ID4gQ2M6IE1pY2hhxYIgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNv
bT4NCj4gPiBDYzogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29t
Pg0KPiA+IENjOiBQaW90ciBQacOzcmtvd3NraSA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+
DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl92Zi5jIHwgOSAr
KysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlv
dl92Zi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3ZmLmMNCj4gPiBpbmRl
eCA0ODMxNTQ5ZGEzMTkuLmE0MzkyNjFiZjRkNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3Rfc3Jpb3ZfdmYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9zcmlvdl92Zi5jDQo+ID4gQEAgLTQ3LDEyICs0NywxOSBAQCBzdGF0aWMgaW50IGd1Y19h
Y3Rpb25fdmZfcmVzZXQoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ICAJcmV0dXJuIHJldCA+IDAg
PyAtRVBST1RPIDogcmV0Ow0KPiA+ICB9DQo+ID4NCj4gPiArI2RlZmluZSBHVUNfUkVTRVRfVkZf
U1RBVEVfUkVUUllfTUFYCTEwDQo+ID4gIHN0YXRpYyBpbnQgdmZfcmVzZXRfZ3VjX3N0YXRlKHN0
cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gIHsNCj4gPiArCXVuc2lnbmVkIGludCByZXRyeSA9IEdVQ19S
RVNFVF9WRl9TVEFURV9SRVRSWV9NQVg7DQo+ID4gIAlzdHJ1Y3QgeGVfZ3VjICpndWMgPSAmZ3Qt
PnVjLmd1YzsNCj4gPiAgCWludCBlcnI7DQo+ID4NCj4gPiAtCWVyciA9IGd1Y19hY3Rpb25fdmZf
cmVzZXQoZ3VjKTsNCj4gPiArCWRvIHsNCj4gPiArCQllcnIgPSBndWNfYWN0aW9uX3ZmX3Jlc2V0
KGd1Yyk7DQo+ID4gKwkJaWYgKCFlcnIgfHwgZXJyICE9IC1FVElNRURPVVQpDQo+ID4gKwkJCWJy
ZWFrOw0KPiA+ICsJfSB3aGlsZSAoLS1yZXRyeSk7DQo+ID4gKw0KPiA+ICAJaWYgKHVubGlrZWx5
KGVycikpDQo+ID4gIAkJeGVfZ3Rfc3Jpb3ZfZXJyKGd0LCAiRmFpbGVkIHRvIHJlc2V0IEd1QyBz
dGF0ZSAoJXBlKVxuIiwNCj4gRVJSX1BUUihlcnIpKTsNCj4gPiAgCXJldHVybiBlcnI7DQo+ID4g
LS0NCj4gPiAyLjM1LjMNCj4gPg0KPiANCj4gLS0NCg==
