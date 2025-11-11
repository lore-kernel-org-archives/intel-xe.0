Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57502CCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 04:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF6D10E004;
	Tue, 11 Nov 2025 04:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmWdHbtj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E5A10E1ED
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 04:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762835085; x=1794371085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sSt+j2HWEtmmek8qrLYRKzCmgkO1O8ThKECw+sNlvec=;
 b=VmWdHbtjSaJB9EweEiWKKIwFfoqeziyYw+cDgq+icQJ0tvXY7FL8rf8G
 RzYLil631C3hUvRHakAHrkR8o1C8fVQaXehwpWDpY0RwzgqiudfKXaBc/
 PWnofMb0emW89jZB0yr0InH52A/Uekl1PoFkFJo8UstFCmI4p08kYUDC1
 PcraNz3rcncOPk/TnT1S488M3TYG/wV9YnA9aAnHywk2dkvNC5N7UmHu7
 yN7Ip+tFrqHzshOnvSvUOEr4fDvs6LiR6h12l62HvYdFvKN+OcIQM3E0z
 n1Y3JdjLqGgeXBwfUHmzlNqxLvLxQj2PDVEZRhe7XUsnrfNDdWwovgkJr g==;
X-CSE-ConnectionGUID: h0jglN4TRPitsAt97r2J2g==
X-CSE-MsgGUID: Qe5T9khQTbOIGrz0Outt8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75578923"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75578923"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 20:24:45 -0800
X-CSE-ConnectionGUID: lVkvfyMFRyGN6st5FeBpQQ==
X-CSE-MsgGUID: YizgPnuQTDC2SHsRNQ5kxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="189109223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 20:24:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 20:24:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 20:24:44 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 20:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZINXxC6kh+UJZ1PF+mWiFgphBiWOw2bXfMNuY3USw6j4y/JK3/kbBuhm1Z6wpmEL4+OLCUq7rVyASv+n8NNsPrUkPCL0JWpPQmE05vpqB6rS44yOwj/j5wEsTevrr/8zKbZTC/pYkywMpC9oROuvSci7Ukrif7zsQbOoTyWFxnU8aKRyPOPooLDHoFKyjQQszNekMlV9Vg6aTf7RacGI77l2oUw03e9GQpE7bCzhAakmvwZ4kJ9pvYNatkdv2H0arIPp4VcuDZt5G+aA5f+TnnbQve3Gv5Y4eM755A8gCUHQDD5495QRoCFMCAuynx2fzfEd6zitNdS+38uUernAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSt+j2HWEtmmek8qrLYRKzCmgkO1O8ThKECw+sNlvec=;
 b=GMq1kMMWJGpN7UZ3Mrl0uhKwuBAfdK/hkxoew54EGlm8ipq3b3MNPTBLohIkRqrRouZNVXd9zzneaAV+vjKJg1w/dohBS6hF1fVeWweyqn8H0p05jerdUEQqzQZWDdENHI226E/f0Jrw6PZ8Z8RxwSTctI9bAMFvscNREu7tbkh9xW2EAHNmB7DL92X8r0eajtjujAMoHWslthjWw9oAZ8Cgt0MspW8WcwwdxFT6+aY0R4QmDPkjVRwOulu6gNkgMks6f9uFGf28r44tFa1c1P1fIr/0mZnyIaUvrj5OJ7WAl45mblHv/D/cYsOPb5gBU1P2idxEt6Su5lmUJo+gwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by BY1PR11MB8030.namprd11.prod.outlook.com (2603:10b6:a03:522::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 04:24:37 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 04:24:37 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: Remove duplicate DRM_EXEC selection from Kconfig
Thread-Topic: [PATCH] drm/xe: Remove duplicate DRM_EXEC selection from Kconfig
Thread-Index: AQHcUpnfa2M/yjizE0aa019BXDTsyrTs3zKQ
Date: Tue, 11 Nov 2025 04:24:37 +0000
Message-ID: <IA3PR11MB8987EB76C5369B50E8EF02B2D0CFA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251110232657.1807998-2-shuicheng.lin@intel.com>
In-Reply-To: <20251110232657.1807998-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|BY1PR11MB8030:EE_
x-ms-office365-filtering-correlation-id: ab903f51-673c-4190-69a0-08de20da39ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?a3A1QjZjWHo4SlJIMXIxcXJzeVNlaHplYW9WSXg2K1dhSFRCNHROVVdCM2FM?=
 =?utf-8?B?R0kvM2w0SFVGRk5nd28zMnU0dk9rc1U0cXdCL3hQOXg1Zjg4RVJ1RFE0UlNx?=
 =?utf-8?B?cnVucWVmOGUrRkpmWDdxNm5xdTZWVEY3eld3TW40MjQ1VHhqSXJSclpRcit2?=
 =?utf-8?B?THNIa1VvVHZDMkl5NHFnbmlDMGlEYThKeC9CT1N3aWIrczZLc3l1RFU5KzNE?=
 =?utf-8?B?RW9RREgwSFVVOThHWElYaEhFelVNTEc0UFQ3Z0RzaGxIYUxuR2RYSjFyTkow?=
 =?utf-8?B?d0VYenNFWGlCSlczdkFEbWhSNlZTSC9PTWUxS2NyWCtTSitGVlA1OHl6VDdY?=
 =?utf-8?B?QnRKRTZXNmV0ZmdPTVJGekRHMENRV05FdU1Bcnc1N1lrVTF2VksyV3VLV2lp?=
 =?utf-8?B?ajVmMFVWR0tBRmFmK1h0V3A3cEZqaDEzcERrTUU4N2xLYU93azNOa2hWakFB?=
 =?utf-8?B?MU8xek9KcUlJQWEvQmFUcnZ2UzF6TkZPbkJaTDBlVW01U3hBMEVSdHlQcWpy?=
 =?utf-8?B?ZjFJQVB3a3VUbzVCOHF4K0pNZmZMYjFaRlQ1WksyUmxCWnMrS3FEMFpvRUVa?=
 =?utf-8?B?UWsyUWhSNUx4eG9XV2Z6TC85KzNGa0drd3Qzcjc2NWNkZkVaRllVUU5TYVlh?=
 =?utf-8?B?bkNBYUMyZUU3MjJ3bzB6WVZwdWtUdDUrTG1ZdkVvNldxaTVPQWdGWVpIbVV3?=
 =?utf-8?B?Q3Zyb0t2N2RlMnhQbDhaY1UwLytxcTJycFJOMXduS3R1ZFh1QjZReGJHNU11?=
 =?utf-8?B?dTgxbWwzbXpBQm1tQmo0MlkwUDFhaWlPdm1Jb1hGaUIzenhtT1dJYnpQckZt?=
 =?utf-8?B?N3FUU2dXd251VVF4ajVLRWx1TWVDNnZ3cXVyQmF3ZGJ5ZXRFZ2IxdVhZN1Ja?=
 =?utf-8?B?bUZaOWh2N2NnVWpPbEswMkxQN2tWdGpPNmhPbEZLUllTaFZmZHptdklkalVw?=
 =?utf-8?B?V3BEK3pBNUtORlZjd3FBNjlxVVE2TW9tU1N3TUF4M0htSlZvY1BqUWhmRWF4?=
 =?utf-8?B?aGk5V09xY1FwVDlMRlNIVDdJTTJES2tWbStUZTZwNXhMcjEwenR3ZlRGUWVE?=
 =?utf-8?B?dlBMT1A5cngzc0hLMU9HN2orS1hGc3Fqb1h3am13R29pYWRIaGcwcVBEUHBr?=
 =?utf-8?B?ckVhNk9RQ1NDbmcwWXRWKzdzMXBhTW5QY3hTUDFrcDF3V20rU201VEFiMEZT?=
 =?utf-8?B?Ly9XSE56OFVXU2JhdGppcVZjYzZKakE0cUVHQlVPTWxDUlFMMUxLY0tPd0pC?=
 =?utf-8?B?V3F4NzRKKzdxN1c5ZWE5bkh1VHN2aEMxSC9rN2FQOEFhK2lndkFJV1kvb3hT?=
 =?utf-8?B?MTNqbXNTTTRCa2c1bmR2ZUE4NERVOVM3NHdZR2czTVFuMlUzNi9WaC9KRlAy?=
 =?utf-8?B?OFBGd29PL1VycW5rMkx6eDNTYXIwVzRPUURRejByQ0FOS296NW9jd254Y1ZN?=
 =?utf-8?B?K0UvOTU2cmswTGFjaTJNS0p3Tkx4L012VjJDdWo2SDd5c01uSzFHdjE5cWM4?=
 =?utf-8?B?b2RpUG9GODQvQ3AwU0l3MElydksrRUJ1YXJmUVZERzkxME9YUXR4VnRjR0dk?=
 =?utf-8?B?b1dZaXVNRGVUVGpFTjF1U1grYmhHK09NT0pxNVNoWHNFa1BkOWNwc1hQbmhX?=
 =?utf-8?B?WVduNWNWZk1uQWNmVkxIWjZ2cVB5MGU0WjR2bEIvbU9ycGIxZFNUdjZMWTVs?=
 =?utf-8?B?V3l2ZnJpamlqVXBVNHYxY09kZ0RIU1E3am5WMk80TlZETjEzbS94Q2g4VHRt?=
 =?utf-8?B?YU5tUFdaZXQwbGRpL2FIZ1dDTTFRd2h1alA2Mm4zSjI5cElGRUdkdDZYWC9q?=
 =?utf-8?B?RmI4bkthQjl4ZENwSDVQSG0zMC8xbzlsalRDYzJiK2g5bEJPMnk0M29sZE03?=
 =?utf-8?B?R2ljU0lvWGVHZ1RhVUVPZnl2QTVqSWx0ekNkSG5YVDlpcTUyNkRVM3hBcjA5?=
 =?utf-8?B?YWIvQkIzN1hNSVZFRVVFRlZsUjk0UVMzMWJvN1YzLzUrdHZmYUp3K2RRc0pz?=
 =?utf-8?B?UmlCek03cXJkTlNhTXhwMTNVNVlheVJ1UU5UVFBtQXY0T0dpWnVDTGNaUFpV?=
 =?utf-8?Q?5YcE/k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmRYVXhrb0ZvcHlDL0RPY0w2NW5pNkVYS2dyc1E2UGh0SFVQdi9Hdk9WY3pG?=
 =?utf-8?B?RGUwNmpiYVcvcGFCYyswSjNzaVZOclNtLy80OExOK3FIRExIOWZ3QmRjeTNj?=
 =?utf-8?B?c2tqS214c3lGcFZpdWkzMDJjbVdrazduNVJxRnpQWFRQVHhqWHAvaHFXdVlq?=
 =?utf-8?B?cllobnJiTzZEQXB4aCtDNkRZcENzYmZMZityOTV2SDZ5UzlNT21KMXN1WVlm?=
 =?utf-8?B?RUw2alpFNVlSRytRMkRzanNKcW1PR0lUWlZteHpCc2cvcE9DY2s2dmc4Wnc4?=
 =?utf-8?B?cTU0S3k2eWRLRndCQi94QjBtNEcxZW5jdDNLNWlCR1NLQ25uaDV3OE9WOU9N?=
 =?utf-8?B?ekFHcXZJNU1PanBlb215QnBPNzBxSisxa01qRFRpUkJkRHoxM3U2K05uaXcy?=
 =?utf-8?B?RC9UT3psa0l0bytSbmd1L3l2SHY2ZjNKK09Bblg2QW91dDMrb0NxdnZrR3lQ?=
 =?utf-8?B?VkFhSmczMUI3bHk1RURDbkY2M0V5R0Rydk13TnhHVTIxVnVuMnpTcW8wYUpJ?=
 =?utf-8?B?alR5N0dET1JTLzJxMzc1dGNlZGU5dkZNWGNZQkd0dExuUVQyNFBxYXl1REs3?=
 =?utf-8?B?Tk5DM2JkM2c4N1hOcDFUSndNeEZubG5kTzk3RmFDYWhidzhqVlFoc3B3VnYy?=
 =?utf-8?B?SU1ETml5MHVrbzVEUDZ4ZDNodzcxUnpFaC9FWXlMWjkyZkVlRUdvYi91akVE?=
 =?utf-8?B?VUVub3NUdWVwTitOZW9INFVBOWZWWU9ib3poTlo3NU1nQml0djNwWEdEdkd4?=
 =?utf-8?B?NDFMWmZSZHNQcGlKaUxJdkE3QUR3TjNmaGpaMVNpbjhCS2xKNGhPWlJ4RXYy?=
 =?utf-8?B?TlZ1anZIa2pXNkRKVzFuaEI5Wk0ycHM5Vk9MOE1KM3Fwekw1cWVNTGpzVlpG?=
 =?utf-8?B?UnZzQjlJcE5RTjVOc24vRHlycTV6NitXbkNEVWNEZEIyWllKL0Q1RGlXTGJK?=
 =?utf-8?B?RzBLekxVck5mWlhTV0k1bk5sS2JDVmFGcm43UUR1dHNMVVZTVkpRNWZ1bjlS?=
 =?utf-8?B?ODFYZys0YVZtb0JPaUJidnI0QmwyNUxrMkNDM2I5YXBUOVVZNHZadUFCeFNE?=
 =?utf-8?B?T0pER01mOTJ0emVtTjAxeWFWSU5KV2QvK0s1clFoN1pkTGZldFFUR2s0Z1Ax?=
 =?utf-8?B?R3VxRHJ2dndUMENZaFNoRHI0VTZyMHJ3Z3pZV2swdmRzUzhjUnpwd2ZZZGVo?=
 =?utf-8?B?eWcvVDYwNWR6TGZ1ZHhOcUR5dzRvSjEzamZxbjJjRHUrNjJ4MUpVVDJxL2VQ?=
 =?utf-8?B?TlVLbHgwMCtyY0c5amFWdVI4eGcrTE5ZUVc2Mk1IOXU0dVMycDZRQ2s0U1Mv?=
 =?utf-8?B?ZzNteHRKWmJnZFIzSCt3YTByaDc2ckhIYjdKTWl6ZjRLY0paRUhQS2Z5elB2?=
 =?utf-8?B?Um5DemlKMVJUcTJNSEhYLzFnNHFINTgxYmJGRUo0ZmJqL1BoSTJlakRJYnl2?=
 =?utf-8?B?bjBDVVkybkpFaVJsS2JnVVF1NngyT2d4NFlvRWV0eXVScW94TEFvdXhma2to?=
 =?utf-8?B?T2lpQ0xEcDJoSGo1MGkxVFJEckhGTGdPLzFVa1drR3VrUmhUMUdzUWp1eTcx?=
 =?utf-8?B?WTJ1eDFIaGhRNXVpZURYSXhRd2RKd2dudmU5cUVLN2FFRXhGRnhBNHJ4K0NL?=
 =?utf-8?B?YXEzQ2dpay8rdzduYjF2ZWMvZVUyS0hIc2RndFplYzEvalFQdVRZc0FydUd4?=
 =?utf-8?B?WkEvOXZNdDdJSDJQN1NxZ1ZqZmdUdlNxd1FsNmY2U2VXb2pxd21rS1ZaWnpk?=
 =?utf-8?B?MDZjZFJ4bGh1TWprMFNUcmM5Mk5iUGdvQmhxUHBFTnI5b1F4NlZ5cHNpREcz?=
 =?utf-8?B?dUc2SkxLQ1IwbFNTSEpFalNUN3gwZDFNWTB3bTNNeDhjUU1oMTFQejE1QVp6?=
 =?utf-8?B?MXYwUi9tamtkV0VRYXRyOXh3enVTR2xYR2k2WEVsTCsvSW1za1NuaXB0S29E?=
 =?utf-8?B?bGJLVi9HaWpMcGNzYWk4REdaN3JzNlFvRW9vQXhndVZDcEJTZEtWQzRjZytR?=
 =?utf-8?B?Qlc4aTJZZXRhNkZxaDZoVTE0V0liRzVIaTh2ZXY2L0FZaUNpRC84bkN5SVFs?=
 =?utf-8?B?S1hhR0dXQ3lMU1ovNzgxSW5GUDQwVm1lQkcxenBTdnNUV08yVnpVcjFnY0Q4?=
 =?utf-8?Q?S9i0rYDxEFTJSQmfxpFvWHCLk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab903f51-673c-4190-69a0-08de20da39ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 04:24:37.5267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nQbKJyq0tXsfG1eFMPM55knfkPYstkRRHQzZqxx0jb2tvVWC0WcIVOzRXOV99gJKYwl62vfGgBmniyW9BDB+NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8030
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLXhlIDxpbnRlbC14
ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFNodWljaGVuZw0K
PiBMaW4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTEsIDIwMjUgNDo1NyBBTQ0KPiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBMaW4sIFNodWljaGVuZyA8c2h1
aWNoZW5nLmxpbkBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzDQo+IDxsdWNhcy5kZW1hcmNo
aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBSZW1vdmUgZHVwbGljYXRl
IERSTV9FWEVDIHNlbGVjdGlvbiBmcm9tIEtjb25maWcNCj4gDQo+IFRoZXJlIGFyZSAyIGlkZW50
aWNhbCAic2VsZWN0IERSTV9FWEVDIiBsaW5lcyBmb3IgRFJNX1hFLg0KPiBSZW1vdmUgb25lIHRv
IGNsZWFuIHVwIHRoZSBjb25maWd1cmF0aW9uLg0KPiANCj4gRml4ZXM6IGQ0OTBlY2Y1Nzc5MCAo
ImRybS94ZTogUmV3b3JrIHhlX2V4ZWMgYW5kIHRoZSBWTSByZWJpbmQgd29ya2VyIHRvIHVzZQ0K
PiB0aGUgZHJtX2V4ZWMgaGVscGVyIikNCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMu
ZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVp
Y2hlbmcubGluQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvS2NvbmZp
ZyB8IDEgLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9LY29u
ZmlnIGluZGV4DQo+IDcyMTlmNmI4ODRiNi4uNGIyODhlYjNmNWIwIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvS2Nv
bmZpZw0KPiBAQCAtMTMsNyArMTMsNiBAQCBjb25maWcgRFJNX1hFDQo+ICAJc2VsZWN0IFRNUEZT
DQo+ICAJc2VsZWN0IERSTV9CVUREWQ0KPiAgCXNlbGVjdCBEUk1fQ0xJRU5UX1NFTEVDVElPTg0K
PiAtCXNlbGVjdCBEUk1fRVhFQw0KDQpMR1RNLCANClJldmlld2VkLWJ5OiBOaXRpbiBHb3RlIDxu
aXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KDQo+ICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+ICAJ
c2VsZWN0IERSTV9LVU5JVF9URVNUX0hFTFBFUlMgaWYgRFJNX1hFX0tVTklUX1RFU1QgIT0gbg0K
PiAgCXNlbGVjdCBEUk1fUEFORUwNCj4gLS0NCj4gMi40OS4wDQoNCg==
