Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CDCD132A2
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 09:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7905F10E2AD;
	Mon,  4 Nov 2024 09:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGMbCM91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D4A10E2AD
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730714111; x=1762250111;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/yQaT5MMo8QJSP9pZEG4Q7bOou/Sxl/AeEOBox706Wc=;
 b=OGMbCM91I022tj0Y0r6bkYYhJMKb5kt9rI96VzkW5MT6Z025HoDmB9f6
 DWrGBKURMqfPD6Ud4stL3r7Y2/elmu/v019gsuzXdmd9pqS9iQOeNxlWe
 4MSYlDIzcPx+t9uvl62brJIXARAIoe3lBLNJMlvfJ2s++dEKjXuAN01lR
 IrSwoOhJ1m+D6GTLVpZgHufH4uqvGvw4R4w8cIbN1e10ztE8Z88/ZmgHc
 fgGVizaUkP7yOdalU0IjUOC6bb05FhzH6DSgQb6NyjebiL4agf6NegfmO
 1QFikzo/kXEOtcZ8RHSkFLOXSAIHuagPKbNF/qRl5S0MyY8eDHeFLT3cU g==;
X-CSE-ConnectionGUID: FKz8QSm2QJmBwbJ4kt0tvA==
X-CSE-MsgGUID: +nMwFDRkQOeYq/7GdtaE1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30621871"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="30621871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:55:11 -0800
X-CSE-ConnectionGUID: ZwU49cviSheKfwaWfrC7fQ==
X-CSE-MsgGUID: DN4IMhANQ7y43Ub44/38hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="83487939"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 01:55:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 01:55:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 01:55:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 01:55:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtLej6VQ1+nZYT7s7CKOOnXfxwPVbzFYt0MeciqWmmS7LlpOLHhDno5OMkXSR9dS/d5GuUWSdAUdMeZFNBFhsOwfZMKvWGXSABThoKgz3C26/mnDSrfxVh3AKe/qXImsRdLScaTGw0/bpNkiksiB7qAhNxvmRwzIPWGnUpxD1gga2ebSlnt1z9aatdM+Fb4rvrauUOmgWxKg7nzEZkZdSa56/xssGvYhMBziG3syO+ZDnZQy81IEQGH6cxbBe/PkpY9xIHil2rxX8C3R4rOfrjklaKcNrnh0bqLn+YMvqerM3u2NIkjn9bxjRLWzoeEfiuqmdfwO/D/X0Yqw5TinQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yQaT5MMo8QJSP9pZEG4Q7bOou/Sxl/AeEOBox706Wc=;
 b=ZaZshY8lEfaU+v4uHbbexaNoCgpwLOC7qTP/I3tMxP+BeOyg3najP3iVF9/F9IpDwAfY99SXPLaB6uaZXxzRqJVRi76zExkrZubUiko3+MqNyVRdD86Dr8geajtdPMlDLDo/IrA91QAu3n1bCXYKSXV8qL6e8QEPKzZW0UX2Ia9Wflq4dwiv9XmcNw5H2p8nTCDuGDWDKMVLO3ijZWA3CFZLtYjCBmkwdQZi5WsJDoJA8gdXYk84LrS/l6iUj3cUptByoMKzjv3A4aNYUjMceMyrTV7NThNb2jpJlrKlRVzvszMJOlM0kwfKqDyLs6cHJ2vHyAjhYsl7s33KkkHSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 09:55:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 09:55:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: RE: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Topic: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Index: AQHbJs1Z9CgXn/xug0OnrMYEe+6a4rKfBjWAgAfrJFA=
Date: Mon, 4 Nov 2024 09:55:03 +0000
Message-ID: <SJ1PR11MB6204467733E2AC5A7544B25A81512@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
 <2d46d261-2d28-4e0b-82d3-fce624587c5c@intel.com>
In-Reply-To: <2d46d261-2d28-4e0b-82d3-fce624587c5c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB8544:EE_
x-ms-office365-filtering-correlation-id: c8ed2960-88bd-43f4-9163-08dcfcb6c0ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eUNORjQ4R21teDcybFlvdWdjVFh2QVVjUGdibE96MTg1eXlUbjUvNkhpSkF0?=
 =?utf-8?B?V2IzV2R4N1AzWVA2U2lvRFVYY1VVNW1jVFIzTXh0S1RIR3o5akl1T0psTFQr?=
 =?utf-8?B?dTgvS3cxamFHbERzWWhUYlU5Z1dRMDZDYUlnZk9LdFR1NlZSVVpjY2JQVEtU?=
 =?utf-8?B?eWdKZXJLcTc2VW5TdUNPczlzN2YzTkRRenBtUHVURGt4eFhSdkg4RnJmM0Z0?=
 =?utf-8?B?dThvYmx6SFN6dm1jWVpaMHJURnhBUTBSN3piLzZ5cUthR0JvZEppYXJDYW1R?=
 =?utf-8?B?R3hBZitucXdRakFvbFYzMTFzQ2l5c3ZNMEZpN3Y2eStMS3JXVmRqZkZvMG81?=
 =?utf-8?B?WHBIR1dBK2NUZ21RR1VuOExWYUJldVFsR2RKUXRWd21NYksrenNmd2RwZzAr?=
 =?utf-8?B?WERtQ1RwWmdGODRQV2RFREw2ekQvNnZHeC8yYkJmS2xYbFZWeGN6bEFQZWw4?=
 =?utf-8?B?VnVtTk5DcTNGSkxlaWRRL0ZLTDVmOGpRRTJTOVlWMUpjWS9FaWNmMmYrMmwz?=
 =?utf-8?B?TXl1ZFRCNEQxMUlOcnk3ZStsVkdGRXo1bW1aMXNOR213ZERXY2dSSjZMdnEw?=
 =?utf-8?B?NDMvMU9aWjNpZGNOVHdJbTlhb3BhMTFLRkdOTThqbkRBT25yNi9qSkNQRnFa?=
 =?utf-8?B?bGsvOENQS1N3a0RXNDdMaGM2S0g5bXcvc3g1d1Q1NmxTQzZ5eFFMYWNLY1F5?=
 =?utf-8?B?ckpERlAzNnpxa2xuSFBrT1hKcVhQV09ncnEvVUI0NHcySkpTNnNpZmVVanIw?=
 =?utf-8?B?T3BqMUxuUjdvaUNldEVuS01ZR1N0SHhQa0M0S3RicUR2Z0pjQ3JPbkl4c0VX?=
 =?utf-8?B?dzRDakRaUkdrRkc0VEVpU3lTenVrRVhtakdodlVjellFM0JCbU1FaE9ZeU1o?=
 =?utf-8?B?Vjg5cjlsVFZCM0pCa2x5aFdRUTRvbkVHNmNObEtDWEdIOWcyUHQwRVRyYUd1?=
 =?utf-8?B?NHhJandsVWNxOGE4S29lNi9VWVNEcldIUjF2WHR1RndRa3YxaUNmbllkaVpY?=
 =?utf-8?B?cmZCUlVUM2VhZzB5L3lMekVpSVNLKzlzWXlHd3BvYXg4Qzcxc3hYZGRQSWp3?=
 =?utf-8?B?cjdkemlYVHZqMDNqcHVRR1BZZVdsdEFTMUFYVmd1SVIxbERXSnN3enFxQVBw?=
 =?utf-8?B?NUxnVmpESG1aeXFGcXV4WEcrcWxUN2FLbFVCNWFrQmhoeS9SdDBnRHc0c3ZF?=
 =?utf-8?B?NTM4dmd1cUg5cjJqenZhQ0N2VndRQW1DMWtsMDdWekFFWkp6RTlPY2wzSE53?=
 =?utf-8?B?c1Bqb3ArZ0NUZWw0NHVJbnVhallrbjFUM3VyOUpxWVNVMEFHdjJLcXNtM3ZK?=
 =?utf-8?B?OW8yMXhFZC9uUFE2QXBlL3RBL3REZCswRjFlRVBqM0doNXhaZjJRRHBSVElT?=
 =?utf-8?B?M0dFN2w4MVloVmVhVzBnR2hXVnVKc1VPUFRjSjNsYlNnbGZJZkNqM2FtNmsx?=
 =?utf-8?B?QVdpZWJTeWNManNnc0NPS0U3WkJ3WGVkcXQ1bXJWQ2NwbHpOZnJMclZVU2Vl?=
 =?utf-8?B?cWd5bzFoMUo1d215bzVuNVp1dkRQNXdmdENjTVliY2c1S1lPRFB2RmxOdmF3?=
 =?utf-8?B?MVRUeEdLMk9UWEVBRnQvMUpyV0ZrclpTcEFWQVUzS2VlM0U2MVJZcEEyR212?=
 =?utf-8?B?Q0FheVNjbWV3a3ZIYzFkVUluNnk3ZGljNXlrMTBSQTYyeXlzQUVSUDgvUlQ3?=
 =?utf-8?B?ZkwyYWV3NTRxMVl6emdCNXVxbmczL2dCYTZSeEEzL1ltOWpOQ0FabjBBU2E4?=
 =?utf-8?B?NVBQeEFmZjd4T3RxdHExdDQxV0JhWjN6S2ZoZnFGN2dPRXBuLzRZU00wVXMy?=
 =?utf-8?B?amtEWk1UeW54R2w5Nk1Sdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2MxMHhsT3duQ1FvOGhrQVJ4OGlFQW5vbkZFUzNvRy93Q2lhR1ZnQmRQUUda?=
 =?utf-8?B?cCtBNGVFajdwYXRkSW9XYWx5TG1GTWpDcC9HQ1RwUWNnRlRSRHlaeEZQWHdW?=
 =?utf-8?B?SzdvRkVBc2QrMXJhRkoydXFEVjl6dVBOUUNxdXJNSll2Q0s1N012S2FSRmVQ?=
 =?utf-8?B?SStPem0zNVN0Qmp5c20xL0JCQkNPWnVoczJFd3VkajNsNm9zT2t6UVNiM29Y?=
 =?utf-8?B?cGRsVlJVb3FVVzltOXFmR0Fsa3hVQXl6aWFyejVsN1JWRFNtVmtBeVl2dFFu?=
 =?utf-8?B?bGw2akx0bjZYQm5Wc3VHUUhTNVBkWkEwdFA3eHhiMXJTUHdtbmVXZldieXpK?=
 =?utf-8?B?TTFadjlibzRabEtsUVBvYThyZlhZUVRSdzZ3M05aMzMzdmhYMVp3MHBMOXVJ?=
 =?utf-8?B?WXl5OWpRZTFUSVUwZ1FJVGF3bnNDZzFMci8yTEJLOHJqS0FXYnJFNDNieFUw?=
 =?utf-8?B?V2lNSUVtQU1tL2NYK21DMno5UTEzVVFRWmhkVlBiQldpc0dRem5HU3crVC9m?=
 =?utf-8?B?cFB3RkJWbE5Nc2dXSFNIZVJzelVKUmRwNW40OXl3ZlNNNG9DYzFUZ0lvZW95?=
 =?utf-8?B?TjJsMDU1VTl2RFlsc21jRlZ5RU11d2dJMFhHQTdJWlpPejJDdzkrSllRUW80?=
 =?utf-8?B?T05lZGdzaDd4dWtUdGl2bFhDakNyS2tYRmZCRWlyeHhHK0Z0Vjd5eUZBb1cr?=
 =?utf-8?B?dnlQYVpyWXZJcEVNS211OEFGc1BhOThTUTlISkJtMEpUSmFSZm85STh0aWFT?=
 =?utf-8?B?bnhuck9OTnZJcXNGTzM5Y1FlYWVSc21xL211WHF2T1MwNWRxdWN5M2pjMGoy?=
 =?utf-8?B?a1h1TitBYStXV1hJRnVUYkpVNkFNM21iSHNSREtHYm94bEQ0ZjdldzVVT1Fz?=
 =?utf-8?B?SHZJOU5RYzVDSkZyS2N2djR6cWp2QVJid2JJeEhreFpnVXZMVDJVZ0RiZkpj?=
 =?utf-8?B?RHlheGI4VThESzN6eFVDN1RkakRkK2dUYUFvRGJhUFhrUk9telk1TjRlak4v?=
 =?utf-8?B?UjF0ZThpRHM2N3ZoSEVTQ1lidm9lK2RBNVdVNTdSYXZ4ck00SWR6WVpjWEQr?=
 =?utf-8?B?dU9mMjZobVJtWURNWWlMWS9kMnFaU21CUGxnUiszeEFndEl2V0dOcXhldHhS?=
 =?utf-8?B?Qk95dUliVVZvTjhBWWdZdzZBaFlzTThjQU9mVTgwNVh2Z25nK1NqZmwwRWUy?=
 =?utf-8?B?UGVXUFFGU1JzUzlDWTRhWWk5ZFVROHovcHlXa25vOTVkTi9jVThGcXdTUXpY?=
 =?utf-8?B?WTBUWHRiTWI4cWlVSXU5NDc4L1NObnlaSmIyTnZLbTBicmtJWFR5UFBQYnF0?=
 =?utf-8?B?WGJCcS8xejFlNmRiS2I5dU1KT2c2dXR2SzdwVFRTMVZrSGZHQVQrOWZTTEY0?=
 =?utf-8?B?Q3JQOCtzZm9CWG03STJndGhXaTVCK2lnaGRWa2xXVlgxei9lUkV6QWJlNjQz?=
 =?utf-8?B?YzEvU0RZYWFCWWxwWnVvSFJuZ2grVm5aL1RYWUdLVERWN01yaFo2Q1I1ZS9B?=
 =?utf-8?B?SWVEbDR2UXVwN0FSeEEzL28vQmFOVmUrRmp4cTg3YnN3b2psSU9mNWJDL0JY?=
 =?utf-8?B?RzUrblFqS2FWU1dYTFB3QlIwdjhvUXVNSDRPd1pTR2poaktlNDgxQjdWWksx?=
 =?utf-8?B?SzlGS2NROGFSUkx4NUlJTVFWT0lzc0VmZ0Q2Q1lxMTZ3Y3NJUUZBQ0k5NlRa?=
 =?utf-8?B?cm8ya2Q5NVA2THpXK0dtdWxDdGtFT1JScVdoa254M1V3OXZMSnNyeDFPdTZk?=
 =?utf-8?B?aURLZWhHOVhESWMzV25LRGE0UTNSL3NQb2NLTGJoRndCckpBUk56L2FuVnRM?=
 =?utf-8?B?dmZtNGozV0hpMU5xUEhoV0IxVE1PeE9GL090U2FaRDVqVXBBcXhMUFpheXU1?=
 =?utf-8?B?MWEreUtNRVhDNEUrVkdjZnFyckNmQUhYS0lCcjB0NktlZ3N1L3gzUnpaUVY4?=
 =?utf-8?B?TE5nSnh3ZnltNDFFRm14K3JvVFdxZlU4UDdsdkRZT291UjZqc0VZa1dRMmVX?=
 =?utf-8?B?UlFLcXd0Y0FuTWpvSW51VGt1Q2pJRWJxZUNnWkN1cC9VWUZSNkFnNEIvWXM1?=
 =?utf-8?B?Z2M4MUwydFRUcTVLU2ZtaGV5RlFxVkFQYnAxRE5PQTJVUFY2d1U2dUduUnND?=
 =?utf-8?Q?YzDCtMPY5x6/ZwmXcl2vnOetz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ed2960-88bd-43f4-9163-08dcfcb6c0ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 09:55:03.1937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrMjdgk09Xlh9AjLry6Fb6/ojEumtaevlDhlBh7JLJoMNCnKF3OIeHcWcslUjLa1u+8rCBJbtfMQQgfi4pDFMgab4knImOgF+mZNVZVWhM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEF1bGQsIE1hdHRoZXcgPG1h
dHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAzMCwgMjAy
NCAyOjI5IFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE1yb3playwgTWlj
aGFsIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNl0g
ZHJtL3hlL21tYXA6IEFkZCBtbWFwIHN1cHBvcnQgZm9yIFBDSSBtZW1vcnkNCj4gYmFycmllcg0K
PiANCj4gT24gMjUvMTAvMjAyNCAxMjowNSwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gSW4g
b3JkZXIgdG8gYXZvaWQgaGF2aW5nIHVzZXJzcGFjZSB0byB1c2UgTUlfTUVNX0ZFTkNFLCB3ZSBh
cmUgYWRkaW5nDQo+ID4gYSBtZWNoYW5pc20gZm9yIHVzZXJzcGFjZSB0byBnZW5lcmF0ZSBhIFBD
SSBtZW1vcnkgYmFycmllciB3aXRoIGxvdw0KPiA+IG92ZXJoZWFkIChhdm9pZGluZyBJT0NUTCBj
YWxsIGFzIHdlbGwgYXMgd3JpdGluZyB0byBWUkFNIHdpbGwgYWRkcw0KPiA+IHNvbWUgb3Zlcmhl
YWQpLg0KPiA+DQo+ID4gVGhpcyBpcyBpbXBsZW1lbnRlZCBieSBtZW1vcnktbWFwcGluZyBhIHBh
Z2UgYXMgdW5jYWNoZWQgdGhhdCBpcw0KPiA+IGJhY2tlZCBieSBNTUlPIG9uIHRoZSBkR1BVIGFu
ZCB0aHVzIGFsbG93aW5nIHVzZXJzcGFjZSB0byBkbyBtZW1vcnkNCj4gPiB3cml0ZSB0byB0aGUg
cGFnZSB3aXRob3V0IGludm9raW5nIGFuIElPQ1RMLg0KPiA+IFdlIGFyZSBzZWxlY3RpbmcgdGhl
IE1NSU8gc28gdGhhdCBpdCBpcyBub3QgYWNjZXNzaWJsZSBmcm9tIHRoZSBQQ0kNCj4gPiBidXMg
c28gdGhhdCB0aGUgTU1JTyB3cml0ZXMgdGhlbXNlbHZlcyBhcmUgaWdub3JlZCwgYnV0IHRoZSBQ
Q0kgbWVtb3J5DQo+ID4gYmFycmllciB3aWxsIHN0aWxsIHRha2UgYWN0aW9uIGFzIHRoZSBNTUlP
IGZpbHRlcmluZyB3aWxsIGhhcHBlbiBhZnRlcg0KPiA+IHRoZSBtZW1vcnkgYmFycmllciBlZmZl
Y3QuDQo+ID4NCj4gPiBXaGVuIHdlIGRldGVjdCBzcGVjaWFsIGRlZmluZWQgb2Zmc2V0IGluIG1t
YXAoKSwgV2UgYXJlIG1hcHBpbmcgNEsNCj4gPiBwYWdlIHdoaWNoIGNvbnRhaW5zIHRoZSBsYXN0
IG9mIHBhZ2Ugb2YgZG9vcmJlbGwgTU1JTyByYW5nZSB0bw0KPiA+IHVzZXJzcGFjZSBmb3Igc2Ft
ZSBwdXJwb3NlLg0KPiA+DQo+ID4gRm9yIHVzZXIgdG8gcXVlcnkgc3BlY2lhbCBvZmZzZXQgd2Ug
YXJlIGFkZGluZyBzcGVjaWFsIGZsYWcgaW4NCj4gPiBtbWFwX29mZnNldCBpb2N0bCB3aGljaCBu
ZWVkcyB0byBiZSBwYXNzZWQgYXMgZm9sbG93cywgc3RydWN0DQo+ID4gZHJtX3hlX2dlbV9tbWFw
X29mZnNldCBtbW8gPSB7DQo+ID4gICAgICAgICAgLmhhbmRsZSA9IDAsIC8qIHRoaXMgbXVzdCBi
ZSAwICovDQo+ID4gICAgICAgICAgLmZsYWdzID0gRFJNX1hFX01NQVBfT0ZGU0VUX0ZMQUdfUENJ
X0JBUlJJRVIsDQo+ID4gfTsNCj4gPiBpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9HRU1fTU1B
UF9PRkZTRVQsICZtbW8pOyBtYXAgPQ0KPiBtbWFwKE5VTEwsDQo+ID4gc2l6ZSwgUFJPVF9XUklU
RSwgTUFQX1NIQVJFRCwgZmQsIG1tbyk7DQo+ID4NCj4gPiBOb3RlOiBUZXN0IGNvdmVyYWdlIGZv
ciB0aGlzIGlzIGFkZGVkIGJ5IElHVA0KPiA+ICAgICAgICBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvc2VyaWVzLzE0MDM2OC8gIGhlcmUuDQo+ID4gICAgICAgIFVNRCBpbXBsZW1l
bnRpbmcgdGVzdCwgb25jZSBQUiBpcyByZWFkeSB3aWxsIGF0dGFjaCB3aXRoDQo+ID4gICAgICAg
IHRoaXMgcGF0Y2guDQo+ID4NCj4gPiBWNihNQXVsZCkNCj4gPiAgICAtIE1vdmUgcGh5c2ljYWwg
bW1hcCB0byBmYXVsdCBoYW5kbGVyDQo+ID4gICAgLSBNb2RpZnkga2VybmVsLWRvYyBhbmQgYXR0
YWNoIFVNRCBQUiB3aGVuIHJlYWR5DQo+ID4gVjUoTUF1bGQpDQo+ID4gICAgLSBSZXR1cm4gaW52
YWxpZCBlYXJseSBpbiBjYXNlIG9mIG5vbiA0SyBQQUdFX1NJWkUNCj4gPiAgICAtIEZvcm1hdCBr
ZXJuZWwtZG9jIGFuZCBhZGQgbm90ZSBmb3IgNEsgUEFHRV9TSVpFIEhXIGxpbWl0DQo+ID4gVjQo
TUF1bGQpDQo+ID4gICAgLSBBZGQga2VybmVsLWRvYyBmb3IgdWFwaSBjaGFuZ2UNCj4gPiAgICAt
IFJlc3RyaWN0IHBhZ2Ugc2l6ZSB0byA0Sw0KPiA+IFYzKE1BdWxkKQ0KPiA+ICAgIC0gUmVtb3Zl
IG9mZnNldCBkZWZpbmF0aW9uIGZyb20gVUFQSSB0byBiZSBhYmxlIHRvIGNoYW5nZSBsYXRlcg0K
PiA+ICAgIC0gRWRpdCBjb21taXQgbWVzc2FnZSBmb3Igc3BlY2lhbCBmbGFnIGFkZGl0aW9uDQo+
ID4gVjIoTUF1bGQpDQo+ID4gICAgLSBBZGQgZmF1bHQgaGFuZGxlciB3aXRoIGR1bW15IHBhZ2Ug
dG8gaGFuZGxlIHVucGx1ZyBkZXZpY2UNCj4gPiAgICAtIEFkZCBCdWlsZCBjaGVjayBmb3Igc3Bl
Y2lhbCBvZmZzZXQgdG8gYmUgYmVsb3cgbm9ybWFsIHN0YXJ0IHBhZ2UNCj4gPiAgICAtIFRlc3Qg
ZDNob3QsIG1hcHBpbmcgc2VlbXMgdG8gYmUgdmFsaWQgaW4gZDNob3QgYXMgd2VsbA0KPiA+ICAg
IC0gQWRkIG1vcmUgaW5mbyB0byBjb21taXQgbWVzc2FnZQ0KDQpVTUQgaW1wbGVtZW50YXRpb24g
UFIgdG8gY29uc3VtZSB0aGlzIGlzIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9jb21wdXRlLXJ1
bnRpbWUvcHVsbC83NzINCg0KVGVqYXMNCg0KPiA+DQo+ID4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0
dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPiBDYzogTWljaGFsIE1yb3playA8bWljaGFsLm1yb3pl
a0BpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVw
YWRoeWF5QGludGVsLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+DQo=
