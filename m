Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE53E87839
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4A410E05A;
	Tue,  3 Feb 2026 14:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6s4jEJh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD1810E05A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128480; x=1801664480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TQPA8ljbFiAN5bHkF5fxqSfo7SGcj7zQ8It8olSYYvw=;
 b=Y6s4jEJhOSYLOlc99AljTwOksA+Y+zuUkFIWzAj2aXYxAp2cYKL0u6Q5
 JbLMcORS+Ak10QTKb7EHb3vHieLIM8GG5LSmVeF7XJIV1TapSKKDgPEbb
 IMogQldvyo9ZorMXDXqaSIP8LYBBeR/nYBLM4qm2BMpB/IA2gPFrDs+nT
 GtAtB7Zj1TSlvYOWW4tLdcsib8e2lfNGrHViF40AXWtSeQ5GX4nFsOPl0
 EJWbMD62Eb8OzxM++4ukDkmz0nkQ6FHdFpXN24FLo78pNcTeHLJ4+Xvij
 oBMiPxifuUK6D38smYP6PlEMVZnurYs64tE8qmAMdibVW75wavxEpf3nr g==;
X-CSE-ConnectionGUID: 1x3YwWFBR+K/mX9S4KL+hw==
X-CSE-MsgGUID: OzBpFK+7TOSJfm7YYHdmpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71281566"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71281566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:21:20 -0800
X-CSE-ConnectionGUID: E4Qax6VOSSi/l+ehRuUXoQ==
X-CSE-MsgGUID: +NDXPOeVRCSql3Jvb3NWEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="214622141"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:21:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:21:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 06:21:18 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:21:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFFpbhCy7jg3xTM2rjBh/oeMHRufEetvWsB+DmZULhWmuLj01YpPznxaEws6FpsSfRuAe69i9MUKS50JjXwV01KFbkPDR92sSmtO3wrZdNTs918oZO0uIwR7PQXNyHTkDjjWA8pbmU1B5W2H7H9ArNlwEe4JXNpz/+9vuXxJL7/vbi0OwoT/O8VSgX1ywENrTrUWzQRMuwOQiM1mgTkDs+lFRfhO9XvB3rl93H7WvVz558DCCfcdRk3bUMHXiU6MHJriQSZGAZ0EdLwkd3kIQD1A/xbSLywCocIKrA+WFc65EfCUhkHTMtI0Ba2qZnO9n3TZPIJpxjR03EqH9RxKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQPA8ljbFiAN5bHkF5fxqSfo7SGcj7zQ8It8olSYYvw=;
 b=jgpCQ0gectxtaxp/0P/2fXZdVh/yOwr3vweJvdEcOggZKyu5PL3D4DG4sJDRub38N4xB/jA98gisg9XpYmDrLHyBcUI4Rs1ZOd2oWvfSFmgcMgiR6pnJAg6keXesMOGaFHcEwklzcp4L50Q/FQzyCr+suQl5PYeqf+rXvm9+Om6a5JVRBJVSU0EfuaxHKjSn1Zv9nSiBPFGdMe4HiUvEU3A5Dj+497BSdNR/eJRaT7D70yHQSECUkzZvMHBaSm1nged3BH46CGzqxYYgXGn0o6R6NurHttfCIUoImfKpfRGZyrEbFgOnkvsQUtxBXCB9xIhV2po2/LT4tDjc7/xHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 14:21:11 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:21:10 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: RE: [PATCH v3 1/2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Topic: [PATCH v3 1/2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Index: AQHclRYPEPhqzpeHXEKFNWL8dKTo27VxBhVA
Date: Tue, 3 Feb 2026 14:21:10 +0000
Message-ID: <CY5PR11MB63668CBDCA5A8451F7BED887ED9BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260203140639.2048912-3-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260203140639.2048912-3-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB7422:EE_
x-ms-office365-filtering-correlation-id: a16dfb83-1b84-4fb8-8844-08de632f7acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VzdrT20yOHR2QzNpNHIwWXF6RHR6L3pWSkpHOW1JbDBvTGFtd2JoTDJpZUwx?=
 =?utf-8?B?SUduZVdXL05Ycm9JMUFod01kRnNFaHBpd0w5Z1ZSa01LYTdwOFBQYk43cnk4?=
 =?utf-8?B?Yis5SDlPNWM2RklpT3ZCdEFkZnVTUVNTcnZ2SEgxelRpRm91S0lXRUVZVFNS?=
 =?utf-8?B?U2s4ZkpPU1hNR2Rvb1lwNHhpdjF0MzlBZjZ5SjFEVEVidlhJWTdrSktIYUpO?=
 =?utf-8?B?Z3NhL0ZsRVI2UlRUL0RvNTRXblFqLzBvZ0NxWjNmdm1xQ3F0ZnQ0V0FOZlBa?=
 =?utf-8?B?VDhRZjQ1YVFjcmxXTk1DaWErOTl0blV1ZkQ2eUJoc2kxeklKWG5wY0dzN2lV?=
 =?utf-8?B?Y2JMaTJ6RzhxaFJkSE1sMThadEloR3hTdWRLeHBzMm1BRnd1K2htQW9UUWpj?=
 =?utf-8?B?TWJCRFM1QlNhMzk0UEhKYmZnSVZyM0NaQm5ZOVJrNGpNeVNqdjBhdWx5cTR5?=
 =?utf-8?B?R1lnT0U2a3gweUd3ZEZTS0FWd3BUN0lKb2ZINTkwNVV3ZndxWC9wYnp4VEha?=
 =?utf-8?B?OW9oL0FKYXFTdXowbzBWMVM2SlQzNlZEd2g3N1VFV2t5MFg2aDZRM0gxOXIr?=
 =?utf-8?B?VncwdVk2dlJIb05mNUxHekxZWlk5SjBEMUZwTlg3Tmo4dEtUZUdtSk9iZmxU?=
 =?utf-8?B?NmkrQVdyb2FYdmJ1aW5HcFJrRjFvVkhpckpXMkViQ252UXlodnd4UGRzZTJi?=
 =?utf-8?B?NlNvV0w4TklmVVQ2OFdMZUlkK2tYS1dZZHRiTlNnemx1b0NnRXhGQTVHYkdX?=
 =?utf-8?B?b0wva2RwTXIvTks1S2s0NGxwY29YQ2x6MXExcGE0TTdVN3dlUkFVanc4Rlo2?=
 =?utf-8?B?bjQwR1pOcGFCb2VqNnF4UStlTG5ML0VSU0tEVFFKZEp4UDZzVTFlaTUwb3JY?=
 =?utf-8?B?d3RBQUZuWitYVHhNeEFhTEFyQTAyc2V2NVZjSzl6UHRVMklNZ1BXdlcwTzRq?=
 =?utf-8?B?MWlnYVc3azVpYjNNa1dYS3BUYkNJOGo0Q2srZXBZdFd4dEhHZGlUV3A0RTlI?=
 =?utf-8?B?b21nMC9NYWhqVHVpV2FrTE9LMHlpcG1heTBQc1N6Sk81MXBvU1hDYnRmd2V0?=
 =?utf-8?B?OG5lWmJyNFIyOSsrcTFQVjM3UzRLd1hndFV6b2VzUlNJc2JrSk9WTVJwVEgz?=
 =?utf-8?B?N1FFZzMzNEgzV1k2MGdZRzBkcGFMUDdoZWpJNUlkOW9HeFozNUE1YkVjNkZ6?=
 =?utf-8?B?NksxU2JTamxzcFNWckFaVDU1TFVOblk4cUUvY3dFby9La1ZvcmlqTGtwa3k3?=
 =?utf-8?B?cVNRbzRpUVo5Wm1ib0VOd1JOby9UZ0p4UDhDWUx6UWdGZ2hnOGt3TDhuTGNj?=
 =?utf-8?B?U1FiOFU3dGY1eUpvOUlScmpXci91aStPWm1RUHhwaVd4Rlg3VVdlT1htZVgv?=
 =?utf-8?B?c3RDNGl3aFBMNnQrS1g4QkJidEU5MEdBRXpZY2VoNkJVaW8rZHp4U3k1OXBF?=
 =?utf-8?B?ZTRiMTVQaUpBdW9LRDBlMXVxQkVETlUvQjhwTW9MSlRzUlNsbmlCQ29pVXl6?=
 =?utf-8?B?QlRGdi84VGl6ampSenZ3QlZGdklTYjFXKzVZYk5RQ0NPSzByWHZkZ1pudjVV?=
 =?utf-8?B?TGVINHh3ZHhpMU9iTUFrZEh6ZzkvT0lpeEgvWWVGbnc1WU5Oa3lPWEI0clBa?=
 =?utf-8?B?b0VsZHExY0RzVXBOaVRiSURvRGJpNzZRVU9IUjJkRGdRTFFwSDdxUFcrV25J?=
 =?utf-8?B?bFNSTXozSVNWQTNsbFBhQjZYUTdnREVUUGRQdkU3d1lSVVlHaC83S2E2THV1?=
 =?utf-8?B?TEJ6QnQ5Mi8wNm1pU2d4cHIyWUx0Q3dnSmZLZGdXRHBRbjJQbGllajlYMHZz?=
 =?utf-8?B?clpENEtOWnM0b0ZtcEl6VU5iMGI0dnFjU1lWUWNWWXJoN2NMbjQvUlQxdkhB?=
 =?utf-8?B?bHo2cG1VQ0d6VWI2ZW5OTkJIcWdNaHhlRXd2NzZ1RlUyR2tEaXYzOE9IVk5w?=
 =?utf-8?B?Vnhxd1ZnYVMwT3VXdklUOGJkckt4R3A0UEZNZHNzRG9scDFHWCt2NmM5SHJE?=
 =?utf-8?B?WHZKMTNHeUNvQkwzODA4R3l5VXFyeVdVeDlaOFYyTnh6OENRY3pHVXd1Vnhv?=
 =?utf-8?B?czFrZVhwM2JxS3BrNGR1VkFxSUhPTHA2enJ6ODVjZTBETlByN3JvVFlLLzNW?=
 =?utf-8?B?Z0gwZ0RjRTJoVk9YTFE5ME9QN3NHWllMWUx6ZFh0NDZNOHllL0E1R3c2cGZG?=
 =?utf-8?Q?gckfbPo8lLtPAzFV/VFgqMA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzlaK1VGYWJSTHRHQVQ2UGgrWjNhdFBnWGRIQ1UwcXpCSUFzL04wZFJIcUlh?=
 =?utf-8?B?L090akMyQTQ0L0JvZnZtalhOU0kwMWZNZWNnQUlRcGg4eVYzMzdPeHFZcU1q?=
 =?utf-8?B?YnhtV0lRL092eXA1ZDhMOEFaODRPOW0rdW5QUWRQMExPVDZaZnNSTzJCNTlw?=
 =?utf-8?B?bGNDL0ZqZkRtY0gzaStMOVM4emRmemhSSllobGRFY3JTeWpLYldCL05EQisv?=
 =?utf-8?B?YlVFd3A3WFc5WHVuSHNKU1NYd05oOHQ4NVIyREovQ3hQS2YyWk14UXNzQnVN?=
 =?utf-8?B?eVhJaWppWHBjTlZva3RyQ2hUS3UwT1FtYkw1OVBMQlZLYk1lS1RrelV6T3VS?=
 =?utf-8?B?eGNNUW9YMlluRHdVWGt5Y1BYVW1RUGNpV1NjZk9CdkNWcTh2WnlEdVZDc1FY?=
 =?utf-8?B?dFVDNlhYNFcrOW40OFpET1lvL2wwbk9JU1o1ZGJOZ2lSUmw2QkxVWEtxb0Q3?=
 =?utf-8?B?Tzd5Y2EvcGFvY0xHdWluK2lySU5sanlXekxxVndhQUJCVWo3WjBQQUdQblZr?=
 =?utf-8?B?STFnVHdKYllKRC9ENVBpSENMeW9UK3o3N3poUGp4UnRKU3JhZ0V3NWh2NTN1?=
 =?utf-8?B?akoxZ3l6VmtMaUtCUk4yY0dHaDdIdC9qUys2dm50ZTR1SFpDSXdscTc5aGd4?=
 =?utf-8?B?UVJHZjYvN0xqa0RlMmtIZS8ySnRVRHRaR00wWnBUTDdNQ3hHREw4S1FmVzJQ?=
 =?utf-8?B?NWNYZkNkQzdnRWY3ajBuZWl0TFppNFFoZm0wQTRpUDM0NjU4MXFqQlE4WVNI?=
 =?utf-8?B?Ly9abGdackJuc1RlRHlRUTJSR1daM2ZPdHQwRlY1M29yL0haS2JOZ21lZFZU?=
 =?utf-8?B?WUZVMHo0QTFVVGpwa2FIWkdTZngzZVRlNjFEaTVaSE5SMXdZNUtzNFdwVWla?=
 =?utf-8?B?QmJVSjdpT2t4N2pRMDN5WUM1YVNJUWJrSDIrMHVQWlRiMEdUV1RsV2lOWjNv?=
 =?utf-8?B?WGM2eERoVGR5NnR5L25qdnAxc0ZKVkR1UVRxWTJYT3JFdWdSck84YzVCZ1RH?=
 =?utf-8?B?a1VkbHIxOXRNSlJjQ3RhWUd6eU9mQWswUmtxb2xNK2ZXRkhjL1V3Um5CUDcv?=
 =?utf-8?B?TVk4eWFFKzQ5WkZkS0QwMzc3SDNhZkQwZTQ3enQ0cWZ0aENHNnZ4bEppTjRj?=
 =?utf-8?B?Rnd6NmZQK29XRjA2LzFtcjl2dmdKbHY5Z3FXUTBBSk4vUTNldlhoVW9icFVv?=
 =?utf-8?B?K1FkOEMwRWV2OWMyMXFRbE9hY1dHNHppd3ZVTG5wUVU4Wi9mL1lyY3VDUXFu?=
 =?utf-8?B?OW9IcXU1Z3JqR2V1bHBvOXMvaU5LUFd4V2FLS2E5cDdsSDFqUGMzTzFRemlx?=
 =?utf-8?B?NjVyUXJGWXJiZkZvMUlVTWFKTVpYQ00xdmU5dVQ1ZUlwK0Y1TXpwN2hJZnph?=
 =?utf-8?B?UUp2Wkl0a0VHbk9rR2dzMytjbS9JYkhGQnV0YmtOTWJvVFo3QnNMajllNWZ1?=
 =?utf-8?B?QnhqQUtZVjJXbnpTeTd0ZWNhU3piVGhpNlYzMVNOUkh1aXlDVE9HT2FOMjZi?=
 =?utf-8?B?aCtSL1UzQjF0UHB1eXd6WUEwL0dxdHc2cjFDVXFKT3pSV21KdDI2eFBzTktH?=
 =?utf-8?B?TUZYN3FmVGZneTFUcDcrdnEyaEExTmxpMXRhbzBkS0dWV2diTVQ2TC9hMGpk?=
 =?utf-8?B?ck8zZDRjN3RlNnJOS2EyOFpBVjlwanFSVDRZUDNhWkg2NzVYTVNoMG8xcEg0?=
 =?utf-8?B?SHFiWU1lU01LRjhsbzZRNGtCWVl1dmFPenRPVm4xck8ySmtiUWVHMGZGbFlV?=
 =?utf-8?B?N2d3NTRLblFaNlpib3B6SVJ6ZWo5elZxSEpocTJXd2EwVVBma0ZnQlNWVVpC?=
 =?utf-8?B?bjZQd2FucHBTN05NanJxUWVFeFYvcHlUc3c3bTUzR3M0bnpzYW41bFpCQnlX?=
 =?utf-8?B?RUhoNmpSMmwwUEFGWW5PUjRyVDVuakFUWVVMaUxaODQ3Yk1ES05wc0wvVTZW?=
 =?utf-8?B?b3NhOFBPM2RLRkdraEdOa21nTmhPaUUrU0JnZHRDT080TUVZMUtqVTBFMTVM?=
 =?utf-8?B?N3VDamx0SU9QOW56MGwyS3dPVVl1ZGE2Q2ZyY0IrN1dzUFMySG9TNTMyVkJo?=
 =?utf-8?B?eUhDQTl5b0VTSWdWa1gydXRkd0IzZ2ZzZEF0a2tuaVlJdFhJdTltTnVZUGV6?=
 =?utf-8?B?SFFYWVl1NVR6RnZxUkxtT0FJVGlZUTA5cm4xalc1K1RpWHpZcDR0SWhzNzlT?=
 =?utf-8?B?ZE5yOEFFZlZRUHBwWVFONkZybXVldFp6U3VBVXd6SGVZei9OWm82WS9hYnBS?=
 =?utf-8?B?SWNTNStoalp2NmloeXVwMnNjRGhSZVBiT0d2SmZqWDB6V2pXakR4ZjJ5cVpD?=
 =?utf-8?B?emtGSmoxVGpZQVNTcklkSnNhbDRTWFJIeGdXSG95RHhOQkYydklJZ1c0eW8z?=
 =?utf-8?Q?AxgFvI5Aty2zeeww=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16dfb83-1b84-4fb8-8844-08de632f7acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 14:21:10.6883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ABE7ok9vzF9GZZ7ZzRLNlAEby7eozLvALHMZEk9ZF+JaLLQ/D29xNfRP1V9V0DvJQCLyy11v2Gbye79T5c+A+VnBpC3EEze21FgHHLngM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMS8yXSBkcm0veGUvY3JpOiBBZGQgY2hlY2sgdG8gdmVyaWZ5
IGlmIENTQyBpcyBhIFBDSWUNCj4gZW5kcG9pbnQNCj4gDQo+IEZyb206IFNvaGFtIFB1cmthaXQg
PHNvaGFtLnB1cmthaXRAaW50ZWwuY29tPg0KPiANCg0KLi4uDQoNCj4gIC8qKg0KPiAgICogc3Ry
dWN0IGhlY2lfZ3NjX2RlZiAtIGdyYXBoaWNzIHNlY3VyaXR5IGNvbnRyb2xsZXIgaGVjaSBpbnRl
cmZhY2UgZGVmaW5pdGlvbnMNCj4gICAqDQo+IEBAIC0xNzksMTQgKzIwMiwyNiBAQCBpbnQgeGVf
aGVjaV9nc2NfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gDQo+ICAJaGVjaV9nc2MtPmly
cSA9IC0xOw0KPiANCj4gLQlpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSkg
ew0KPiArCWlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9DUkVTQ0VOVElTTEFORCkgew0KPiAr
CQlpZiAoaXNfY3NjX3BjaV9lcCh4ZSkpDQo+ICsJCQlyZXR1cm4gMDsNCj4gKwkJeGVfd2Fybih4
ZSwgIkNTQyBub3QgZXhwb3NlZCBhcyBhIFBDSWUgZW5kcG9pbnQuIFVzaW5nDQo+IGZhbGxiYWNr
XG4iKTsNCj4gKwl9DQo+ICsNCj4gKwlzd2l0Y2ggKHhlLT5pbmZvLnBsYXRmb3JtKSB7DQo+ICsJ
Y2FzZSBYRV9DUkVTQ0VOVElTTEFORDoNCj4gKwljYXNlIFhFX0JBVFRMRU1BR0U6DQo+ICsJY2Fz
ZSBYRV9ERzI6DQo+ICAJCWRlZiA9ICZoZWNpX2dzY19kZWZfZGcyOw0KPiAtCX0gZWxzZSBpZiAo
eGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDKSB7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgWEVf
UFZDOg0KPiAgCQlkZWYgPSAmaGVjaV9nc2NfZGVmX3B2YzsNCj4gLQl9IGVsc2UgaWYgKHhlLT5p
bmZvLnBsYXRmb3JtID09IFhFX0RHMikgew0KPiAtCQlkZWYgPSAmaGVjaV9nc2NfZGVmX2RnMjsN
Cj4gLQl9IGVsc2UgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0RHMSkgew0KPiArCQlicmVh
azsNCj4gKwljYXNlIFhFX0RHMToNCj4gIAkJZGVmID0gJmhlY2lfZ3NjX2RlZl9kZzE7DQo+ICsJ
CWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCWRlZiA9IE5VTEw7DQoNCkFscmVhZHkgc2V0IHRv
IE5VTEwgaW4gdmFyaWFibGUgZGVmaW5pdGlvbi4NCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg0K
DQo=
