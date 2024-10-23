Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61B0CFA450
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 16:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC2B10E17F;
	Wed, 23 Oct 2024 16:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UB+vqzME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9BE10E17F
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729702029; x=1761238029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P0b6DnjT2PRwoswuQloeERtl0Y5mdoWu/KfTxBcDCIA=;
 b=UB+vqzMEvw/gMHj/mS67OpQ7EMGhZqMmvwlHkgiNzuKPcoNhrhPm+3ay
 tIvLenl+Qi3M8yDQMiOM+E2xzF0RsxnZW0GCdASGOumiyQLAsYxRUveu/
 Duju12m0Jv50Gd6zayekqfhBvGZ0+UcBO0ySJQaDK+bZHo02x0xHzIXPL
 MwmESuMH+a7nb+AasJZ+hnyHTIngVL9lQkwc9aJr0ATrQT/emG5Dd/lzv
 caavqSaPhave6YuYLYwSEbnnYCq2C+HFRumcHPp6fXcsOzNQU//4s6Byw
 0F7V6labvVftun2WLKXlCmhDUdSytlgmT27RX5zFOXO7btOyMHZ5MxLjO Q==;
X-CSE-ConnectionGUID: ovzm0s1tSUCT48FIQ0EryA==
X-CSE-MsgGUID: Ao2T5GrtSBubsmBcjml8tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40694852"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="40694852"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:47:09 -0700
X-CSE-ConnectionGUID: 8CGfxYpKQp+qxhKgU0RmsA==
X-CSE-MsgGUID: J06bSTJMR/ul+SoGhUOO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="80470366"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 09:47:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 09:47:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 09:47:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 09:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idE8+Z2wZctrJP7cWGIY0Th45i38nRwi8+wl3BHo9ab0yvDFBnawl/7hWSQC5fKSCOL+8GFLcQQYFdSUlhwEasOuQd9ii9X+Y6D063MTMJ7CDh0/3+Dv8MRbDL4C1IUfzJxUGIa3/cxt/z73ID4jI3mMQN9QKahnTbDwnAm/nBhg2/wfuOKzqWkxK45cEjvna1KehY3CVm1sOT/iboDkRsBRvtTN9MFhbD69c7jN0neYM3QvEwwEBwSEavnjKzgLl0v4mQTVvNOBBaLuqrxSYUGojhpmzKAhfUD8nrMlcH1H92vdGMZBROC8ybPmBBQeKD08bHuPMlaaPE+G5oiPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0b6DnjT2PRwoswuQloeERtl0Y5mdoWu/KfTxBcDCIA=;
 b=ryFwyglIrO2pRkEm9HkQuwTgAfzBrdn0LlhM/9HPNn/bmctKSRz83b0DA6K4pzOD9DhAzW+uga4DLOEn1kCV6f81LG8qb7WFkUI+kKp7yfLOk/44FBqsw7MF8d+OMFlT//FzcpUVFUQ0bsVTsgKz2yxczr/ALUXdWyNtoaQMnlhlICGJJij76kmwzW5OVtUXoBmkwNK/ThljSysmdbe6UArFRVShlhlHov3MwuG0rlUa7sSvOJLlgiVJTAxfBGt2rM4Fiv0y/RYYqiU/lFRyR2GD509jtU6lp2Qoa9BaRg3zPdyIq4GoC2QopHmIXbDDVZoVssXS2TJistb3CyVwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by DM4PR11MB6192.namprd11.prod.outlook.com (2603:10b6:8:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Wed, 23 Oct
 2024 16:47:05 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede%4]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 16:47:05 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Justen, Jordan L" <jordan.l.justen@intel.com>, "Briano, Ivan"
 <ivan.briano@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
Thread-Topic: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
Thread-Index: AQHbJNoE4WGXDyvkEki0eg9X8NqxYLKUjJqA
Date: Wed, 23 Oct 2024 16:47:05 +0000
Message-ID: <1a5852ccbf8713023a71fc435038a80546801746.camel@intel.com>
References: <20241022232756.1769013-1-matthew.brost@intel.com>
 <20241022232756.1769013-2-matthew.brost@intel.com>
In-Reply-To: <20241022232756.1769013-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.0-1+b1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|DM4PR11MB6192:EE_
x-ms-office365-filtering-correlation-id: b564f09b-856d-465c-d3cb-08dcf38253a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VnZYbHZjSFl5ZDhKanp4ZXp0cTdGZEtBcUJmeDRDVTE2czRCVFdFdkh5dDMx?=
 =?utf-8?B?UmZjZkZ0MEwrMXVXVHprWkhuUGlOVCtNN3dKQmx6QW1WMWFYTHNjdkdTTlpF?=
 =?utf-8?B?Ym9heGxOZFFEWmdLWnRVeE1oVzYyUFhvNm9tbHloZEprNXQ4eTh2Z0RUNWo5?=
 =?utf-8?B?TTVWL0hCZDNuRkduR3FKOE0zbkxIcUxSU1VnSEQzdWpMR01ZajBrQUhub0lV?=
 =?utf-8?B?MzVpQU1PMVpUelNiT1MxVTkzbzlxSzNLVjVtTjNFS2YyUTFlaXAxRzRNOXlZ?=
 =?utf-8?B?OElHbC9nUzZTOWVjdlFobGwySUh1MlAxbkRDTHBqSDV5b1V2VWdMbW4vK0lN?=
 =?utf-8?B?dzRrK2ZUS3RBdkpRUmY5MUhsc25lVFhXTDc3UTcreTd0Q3d3T3RjRXBsODNP?=
 =?utf-8?B?UEE4L01LTXQzb3RHUkJ0TzFsZWhlaW5pM3h6ejIrbklua2dHanhTYm55dXl0?=
 =?utf-8?B?cWZZNjhhOVJpMnMzUnZYWnNxQ1VuT3k1ejNBaDdwMUJsdlJzQmdTanlOaGVu?=
 =?utf-8?B?TWtUVFluSjJvdWg0U2xZbC9MeTdubjQ5ZmY2aHBOU0YwUjE4SFJxUTRGZUUx?=
 =?utf-8?B?U2JBclVZVXdMMDJYYTA2WXVaRGhLNElqaGhJRHR3OU9ZbDhhakIxOVZySVF0?=
 =?utf-8?B?Ynl1WFZDbFBOcjljbllEalhhYUdEZGMyRGdHUDh0K1RzeGpDWG40bzlqa0w2?=
 =?utf-8?B?MUg0eTZaQUh1aEFIVnZhanNEQ0xWTStHS1YzSjl1NGtNQ2VEbDJFWmhtMWda?=
 =?utf-8?B?aC95QmlvdHN2SnMxbVNMTkxjdlpJeDAycWNXSUNRYXFRbmljeHNGOVpHemgx?=
 =?utf-8?B?NUROL2J6K3JVK2xlNy84Zmg4Nyt0NzhmZHdKdkoyZWdsbXV5TnV3M3JtMThU?=
 =?utf-8?B?Y0wrdXBmejg2TE5JUndsaGhSSWRmT3lCMUo0N2g2V3dEVVJucThOMzVCbVov?=
 =?utf-8?B?R2ZNdytQUThFQmc2YVVpQVgraEMxQjJlbm5nVktzY3N4dUhibEU2SmlwaFRv?=
 =?utf-8?B?MmNHTkkyWnhUYzI5UXliMDVSUGQ1NFRJTFo5QTJFZ3J0bVYvSE53R1dkYW1l?=
 =?utf-8?B?R0lOYkoydjhBcFRjWExyR3E0aG5OKzJUZ1k1Q2RjWVJXUzRBTUlDN1BaVi9G?=
 =?utf-8?B?eDhPelhhcjJnNnpzL2Jvc1dRREd6R3NoRTY4WWxlelYzMEt2eUxacnhuMmNh?=
 =?utf-8?B?OFN6Z2NCYkNSWW1xZjRBbmtuZ0xqREtZdDBIdkROaUpUTHdwK0U0bWlDU0hU?=
 =?utf-8?B?NlpjY1JuRjkwMmZ4eUxka0Fxa1QwMDZYcG81S0p6cGt6cXBjT2k5dk1Ob2VW?=
 =?utf-8?B?RkVnL1EvbnIvVlJsRkdwME41cWt0NVlIbllqZVZyeDB6anQvdTJndWJxKzk3?=
 =?utf-8?B?VlN2N0tiV2dvRHRSbjJOZXNobW5ZZi9XZitDd2lYWXV6MDYzVG1CTHhWSHR2?=
 =?utf-8?B?WXRhU2dtN2gveUgrWVFBZWgwc2VmTVY4VkMwRXpKa0QzQ2JQWC9jME9aYzVX?=
 =?utf-8?B?bVpNenJMWWFGVmhNME91OGtwMWFnMVo1TG1jc0RJcTE2Y0JCNVV1UFAxRXdJ?=
 =?utf-8?B?SXo4TEJCVnNxMTh2L0tzTGRmeVJuNDRIRUVnbFB2VkJoUzlvdDM5a0d3SE92?=
 =?utf-8?B?c29kazNFV01QRlRPK0w1UmJpZm5RVlRFTWxOaVhwMnd1OFFYSFV2RUtYOTZ1?=
 =?utf-8?B?VjlHc1lWeENlR0xyTHc3ZFFYWElTcHM2Slc4L0FrazBXNnFCM2hvYjd2OExo?=
 =?utf-8?B?UkJYanNQYk5WMlVUeE9JSzRTZEZNTkJQOXVobjZsWTlTeFlKQUI2RGhtV0Mv?=
 =?utf-8?Q?Orin7kuWo8ZLND5fpbyhI1UkRYZq0ECcKBS2U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFo0LzFOTUZzMFFBQWJZcmRaTklPdFdPMENRdmZ0Y3lIRGFtL0lsdWk1endy?=
 =?utf-8?B?Rzc4UGRnMUljSmVSZnNpUkp5OFpzV25yMjZEQXZOaXd5ZWNGQVlHaWhCNlJm?=
 =?utf-8?B?cjAwMk1MK1RBNGpLckhiT0V2RzIwT1BTbGo1cGR1YUJObENDTmprZUgxeE5Y?=
 =?utf-8?B?K0FkQXJBYktQM2plZm5wRk8rdHR4QkpRZzBDcmM1aGplRUpwbUpiYWprVHNt?=
 =?utf-8?B?TSs2U3p3QmhYSDJ0OFE2NUl3T2k4SnRsa252dCt1MWVYYjF5SXZrZEw4aU5H?=
 =?utf-8?B?eW1nQ2F5QWF6ZkI0a1k5R2QxN3FDVUgzdEQ2c01FdmZTNGl6ZVFWNDU5aGw5?=
 =?utf-8?B?aXA3VkhnL1k0OXpSUjk5b0VRSGNyV0lZSXBFQkY0aStwM3JjZ1pFSFl5Mm11?=
 =?utf-8?B?QlZZclBxdEZ6SDhDVmJLdElBSEFucnJZVTJWcktXL2V1a05lSFJsTzlIRzZt?=
 =?utf-8?B?MXh1amJDYnFxUlZxdE9iUmgzcUxsaWIzRG1XOE5pRFkyNmovc00ybGE5Y0hQ?=
 =?utf-8?B?WFBpTkhpbmFGdkd6RWgrYlVsNWtJNGR2SEFYZVg4bFlwSjNWalpXMGphVDhY?=
 =?utf-8?B?K20yNTlFWVh3NEhFNFcwS0cwMUs1TW1pVm45eU5Gb3hvTmVXa3hKUm4vbXdR?=
 =?utf-8?B?R0o0RStJNVd5RGFMVEpaK1ZrYXBsU2ttZUpaMFJldm95cS84MmZubzZJNWtQ?=
 =?utf-8?B?Mm9wWU12YWZ6Q1pYcWkxSU5rWTBaRjQwdkJ4YjRsak5aZkpCUjZITUlCM1Ft?=
 =?utf-8?B?dGRYQWlGaVFrTW1sQUVobU5vMGlYTFp5bi9tTHhGRkd4WlJjSUNVOEE5M3Nk?=
 =?utf-8?B?NDlRRW9lZmQrUnZYdFo5MGZCL0JlZmxFcktZMnlBUEtEUVdhS1BXUmJYKzYw?=
 =?utf-8?B?WlY4c3d3cldzNGl5Z3NaM1V4SDdGcmF0eXNVZ2ptdHMvTXI1QWY2ZjA2cmdS?=
 =?utf-8?B?SFRtVjNRcUdycXk0ZXR4UGZYSDh0cTRuempzUkJMdnlsRW14blJkWTZrTEtp?=
 =?utf-8?B?bXFidGUrUnBCVlBmeURLcHFuVXdPeDVXWCsyK0JnTXZXbjQrMUFXL1JhcE16?=
 =?utf-8?B?cGhLMDlwdTcwL3h5VENZUzZzb216bzdZUFFGSlpPYXZCTFl3a2xxZ3Mra2hK?=
 =?utf-8?B?YkxVaVlCWDdHcUwwZGY1ZXlUWWxDZm44YmwyeXZSV3Y0anBSOUlPeXMrbk5u?=
 =?utf-8?B?bzVPUzZRU25KeVR3cTY0ZzNmNU5URE5wdHBHY2RoRWQwNE1WUEdvUGpZYVIz?=
 =?utf-8?B?MUFJTkw1QUNad0UvWHpQdkhjUVFtenBUNUdsbUFNYUwrSUlvK0RnVW9STDNV?=
 =?utf-8?B?a0ZvQlhteVZVb2lKVk5WMUc5ZDUxd1l4VERZOVNvTWc0QmpVMVlXUXE4dHMr?=
 =?utf-8?B?WVc5Zmhta2wxQ05tWHNnZzBuYXBCOUd5ancrZVVJa1FWMkxQUVFKeGh6Z0g1?=
 =?utf-8?B?NDBvWHk2a0ZHNGJDSEFyYjdnUFZtVkhBblJBNERDbDdVdExoOUZONEJmQU5I?=
 =?utf-8?B?TWtrbE1lR3NXQlVQTzRKcHZUdVYvcmRMeXJJN1V5NGtCN3R1cUJpL1NnMFh2?=
 =?utf-8?B?MnVrQXVkT3doY0Y0V05URHIyYVFIQXltZ1ZxOHJjWm01K3h2V0RyUmFvbXE4?=
 =?utf-8?B?VTlTTmp1U0E0V01TRWRSYkhrWFJ6V1V4THBRZC9BbGlOVmp6T2xYVDg0M2VH?=
 =?utf-8?B?b003dlFMcjJnMGZsMG1FVDNBc0xabUFEb1dobnFQOVBOYm5NTmxNakVOQ3do?=
 =?utf-8?B?VGRVa1RubDZHU0w1aXRGcVlnU0FxN1djbzYxTkJvUFVjejBxK1Y4OURzV3dG?=
 =?utf-8?B?LzdQVjBKSzRVUU9CQk1WSXNpQlIxWmd4THB0SjN4TzF2eVhlOHlIS0ozUWdv?=
 =?utf-8?B?Mkc3ZUlyc2owc3lCayswd1dOeElRd3krRVJzSk0vSm9La25uaVhETmh0SGRW?=
 =?utf-8?B?dzVnMVl4LytYbE9hbUMxT2RuQTU2NHJGemVlYWdNNDU4ckZpSDFnQWxpTkpJ?=
 =?utf-8?B?MTB4L0dhR0F6L2NBVC9paHVUV1ZUOFBZYU9YejFHSEtRUmdINjUxNHcvVElU?=
 =?utf-8?B?U2U3OThRSXdBNGYweUlaWHYyODl3L3VGSUdkY0t4TGlwQWhEWk1TdzRpUUwy?=
 =?utf-8?B?KzkwNVVNb3RmeVlYUmQzTTd0ajRIdHN6UkRmbUI1YmFPMkVydWJmTFhDV3Nm?=
 =?utf-8?B?Nzl3MkU3eGoxNGJiNjY1UWJWbkFGdjhJQ25SR1cvS1dwU1Q4bzUydEhONHdX?=
 =?utf-8?B?ZEhqZHZrYk5SUGVuZlNxQ1VjY3VBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1CE0EE01E8BB147BFD905E46775CE69@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b564f09b-856d-465c-d3cb-08dcf38253a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 16:47:05.4353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkLZOBTwBBy8iWpcmNz3v5TH8/jRzP+EIpnywRgxs30K1VH+QvdNw5+uHJrxraTtqQ2aFcMVqdWmptAlmToY+9yxabt6coYXEuWEX0NPtNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6192
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

T24gVHVlLCAyMDI0LTEwLTIyIGF0IDE2OjI3IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBTaG9ydCBjaXJjdWl0aW5nIFREUiBvbiBqb2JzIG5vdCBzdGFydGVkIGlzIGFuIG9wdGltaXph
dGlvbiB3aGljaCBpcyBub3QNCj4gcmVxdWlyZWQuIE9uIExOTCB3ZSBhcmUgZmFjaW5nIGFuIGlz
c3VlIHdoZXJlIGpvYnMgZG8gbm90IGdldCBzY2hlZHVsZWQNCj4gYnkgdGhlIEd1QyBmb3IgYW4g
dW5rbm93biByZWFzb24uIFJlbW92aW5nIHRoaXMgb3B0aW1pemF0aW9uIGFsbG93cyBqb2JzDQo+
IHRvIGdldCBzY2hlZHVsZWQgYWZ0ZXIgVERSIGZpcmUgb25jZSB3aGljaCBpcyBhIGJpZyBpbXBy
b3ZlbWVudC4gUmVtb3ZlDQo+IHRoaXMgb3B0aW1pemF0aW9uIGZvciBub3cgd2hpbGUgcm9vdCBj
YXVzaW5nIGpvYiBzY2hlZHVsaW5nIGlzc3VlIG9uDQo+IExOTC4NCg0KSSBqdXN0IHRlc3RlZCBp
dCBhbmQgaXQgc2VlbXMgdG8gZG8gd2hhdCBpdCBwcm9taXNlcy4gVGhhbmtzISBIYXZpbmcgYQ0K
NSBzZWNvbmQgaGljY3VwIGlzIHN0aWxsIGhvcnJpYmx5IGJhZCwgYnV0IGl0IGlzIC0gY2hlY2tz
IG1hdGggbm90ZXMgLQ0KaW5maW5pdGVseSBiZXR0ZXIgdGhhbiB3YWl0aW5nIGZvcmV2ZXIgZm9y
IGEgc3luY29iaiB0aGF0IHdpbGwgbmV2ZXIgYmUNCnNpZ25hbGVkLg0KDQpUaGlzIHBhdGNoIHdp
bGwgKnRyZW1lbmRvdXNseSogaGVscCBNZXNhIENJLCBzaW5jZSB3ZSBjYW4gcmVwcm9kdWNlDQp0
aGlzIGJ1ZyBhbGwgdGhlIHRpbWUgd2l0aCBWdWxrYW4gQ1RTIHRlc3RzLg0KDQpTdWdnZXN0aW9u
czoNCg0KLSBDYW4gd2UgZ2V0IGEgbWVzc2FnZSBvbiBkbWVzZyBldmVyeSB0aW1lIHRoaXMgaGlj
Y3VwIGhhcHBlbnM/IFdlJ3JlDQpub3Qgc3VyZSBpZiBpdCdzIGhhcHBlbmluZyBvbiByZWFsIHdv
cmtsb2FkcyBvbiBwZW9wbGUncyBtYWNoaW5lcywgc28NCm1heWJlIGhhdmluZyBzb21lIHNvcnQg
b2YgaW5kaWNhdGlvbiAib29wcywgd2UganVzdCB1bnN0dWNrIHRoZSBiYXRjaA0KeW91IHN1Ym1p
dHRlZCAzMDAgZnJhbWVzIGFnbyEiIHdvdWxkIGhlbHAuDQoNCi0gU2luY2Ugd2UgZG9uJ3Qga25v
dyBob3cgbG9uZyB1bnRpbCB0aGUgcmVhbCBmaXgsIGNhbiB0aGlzIGJlIHRhZ2dlZA0KZm9yIHN0
YWJsZT8gSWYgaXQgdHVybnMgb3V0IHRoaXMgcmVxdWlyZXMgc3BlY2lhbCBHdUMsIGl0IHdvdWxk
IGJlIGV2ZW4NCm1vcmUgdmFsdWFibGUgdG8gaGF2ZSB0aGlzIGluIHN0YWJsZSBzaW5jZSB0aG9z
ZSB0ZW5kIHRvIHRha2UgbW9yZSB0bw0KcHJvcGFnYXRlIHRvIHBlb3BsZSdzIG1hY2hpbmVzLg0K
DQpUaGFua3MgYSBsb3QhDQoNCj4gDQo+IENjOiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25p
QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQu
YyB8IDQgLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gaW5kZXggMGI4MTk3MmZmNjUxLi4yNWFiNjc1ZTlj
N2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiBAQCAtMTA1MiwxMCAr
MTA1Miw2IEBAIGd1Y19leGVjX3F1ZXVlX3RpbWVkb3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqZHJtX2pvYikNCj4gIAkJZXhlY19xdWV1ZV9raWxsZWRfb3JfYmFubmVkX29yX3dlZGdlZChx
KSB8fA0KPiAgCQlleGVjX3F1ZXVlX2Rlc3Ryb3llZChxKTsNCj4gIA0KPiAtCS8qIEpvYiBoYXNu
J3Qgc3RhcnRlZCwgY2FuJ3QgYmUgdGltZWQgb3V0ICovDQo+IC0JaWYgKCFza2lwX3RpbWVvdXRf
Y2hlY2sgJiYgIXhlX3NjaGVkX2pvYl9zdGFydGVkKGpvYikpDQo+IC0JCWdvdG8gcmVhcm07DQo+
IC0NCj4gIAkvKg0KPiAgCSAqIElmIGRldmNvcmVkdW1wIG5vdCBjYXB0dXJlZCBhbmQgR3VDIGNh
cHR1cmUgZm9yIHRoZSBqb2IgaXMgbm90IHJlYWR5DQo+ICAJICogZG8gbWFudWFsIGNhcHR1cmUg
Zmlyc3QgYW5kIGRlY2lkZSBsYXRlciBpZiB3ZSBuZWVkIHRvIHVzZSBpdA0KDQo=
