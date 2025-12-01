Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FEFD116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 16:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0457710E0B0;
	Mon,  1 Dec 2025 16:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOj7D2j0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266610E0B0
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764605879; x=1796141879;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+91T8NdS9LKqx6D05SW8FWVaR7R8FEqPtQlkDNDe1p0=;
 b=dOj7D2j0H6tGOzrfQrmJX2l13EBVJFGJnMhvhysOONcjxIKl+z0pksbL
 gSulxD/Lf5yB7VI1DD3BokWgkwjF9nk05tQrdRYLjwtdwqYltqn/J3HLR
 +Af9gwB6qnBQDuuwNH/Vns6vU67rdNeL59j+sHW3VMfhANBWvo5NLe81A
 GLAmAgDDxOJVRT/KFldCrxHTc3AcaS+k64DRZGG/tZJQATc8C0AGQUMxR
 CYPZD+YXg5k0mxvUbpCNg2gbcGdQleb3SpfVccCiZCPWZDxlzxej8cHMG
 uImLfwaJJ5IytI+OTDRC6qwhY67Qg4i8SAfk8Iq8phrwlyDTnHSpMzhSb g==;
X-CSE-ConnectionGUID: tIOjBQ3+R9+EWGj/DeV2EQ==
X-CSE-MsgGUID: dq9+GVLLT6+gGVMy/ietNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66586823"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66586823"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:17:59 -0800
X-CSE-ConnectionGUID: SP6GMsiaSXeNmSdErFsWyg==
X-CSE-MsgGUID: kkPZUWJzTei0O5d+oOfpdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="224807685"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:17:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:17:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 08:17:58 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:17:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7loVZitu17wyT6WQNipCk55Y48ngk+ulRDAOS9w7BUA2CdVMKfy8rTgRlyB8RM3aILanftqOe1YX5zbG8B2u7M6JCMMCRym2099cvCcDSDJ3NHvN2yXgzEYOO4sgMfGIrXZSgB4ijW4f+yuCFquo+9+Hpv76dtMetdmvIxB0cMGJws1MplYmg6XNp/T7tpIRtqlm1H9VfQyos7bzsq9a1agU90HnwV5uzks+LAMg2DrxkvOD/rCs2KWlkn2tN1DNRIEBL6hOIGJXVVHPgF1kNLZklCnbQCgaVny7HN/0PGRQMX0WzHIn9XuepBhZBBu9VB8IsK5Cvi5JLALiQFzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+91T8NdS9LKqx6D05SW8FWVaR7R8FEqPtQlkDNDe1p0=;
 b=joeukSlby7AyydcoF4xQoWUZdAQ5dgNAQQspmxv/MoI44/XwrXYXszZOpsmelf28KWBLExI0/xvT3zKX01cqdvgGB3SgzkRngBzrIy7q+SsB6XZukJJPHJddwc3Dx6HGMLFIq4nBOQTzbZItFTrnQmUJoMcXPw3TqsrnQCcqvS65CgclJkprEXIzCuDjLYoQi8vWfYWrZKWDe96CjvNbG+kFCH7W21m7UkVQBl5GUkTUiqXQbUkGox2l4AjWn54a1icJTlQWrhzQeBHNTsseK4aEmTsixWME4asJTfJ0PHn4sCrQ1keUpA0aoUEK0k+zjxMih+nf8Y9pZMDfYM+viQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:17:55 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:17:55 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 0/2] Silence allocation warnings for sync arrays
Thread-Topic: [PATCH 0/2] Silence allocation warnings for sync arrays
Thread-Index: AQHcWnfDdw2+wWxISkeTIaQPn3S2TLUBs2QAgACl1RCACq1e0A==
Date: Mon, 1 Dec 2025 16:17:55 +0000
Message-ID: <DM4PR11MB5456105DEB5B643F50B044ADEADBA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251120234254.427452-4-shuicheng.lin@intel.com>
 <f3a9603475e70d85368e5083046365eb507da502.camel@linux.intel.com>
 <DM4PR11MB5456DF2918866D971FAF35FBEAD0A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456DF2918866D971FAF35FBEAD0A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB6945:EE_
x-ms-office365-filtering-correlation-id: 1a1f0b2c-935d-4e2c-5a94-08de30f52fb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SHhDSG5TTGdYZjAvcjRZUGR1akJrRWJ0YjUzMC8rUC9ZR1dQN2hqaXhoM0My?=
 =?utf-8?B?QWNOQWZIOHhYaEtTeVArdFNpanhwcGhHUS9UNTF6ZnRBZFp2eUgwcXJ6d3hN?=
 =?utf-8?B?dVh4ZmIyVTg5dDhaaDNtQ2hQckJHTWRZeVE4bGEwK0xzZ29qR0pXeWRDcG9C?=
 =?utf-8?B?V3oxUVFDeHE5MjRyZzZMWHBvRHZPaXBSVnhpTXJRVFVnTEZWSE5IVFdhazFE?=
 =?utf-8?B?STk5STJWc2hjbjlWL0NtT2ovOFQ1NFdFOXp2WFVmbHRwNkNzVGE3ZmMyM1R5?=
 =?utf-8?B?d3ZjcGR0RkgwSEdKSE80RHpXODhEdHZlTUMzRkMxQ2RNM3UycnkvRlQ4YnJU?=
 =?utf-8?B?QUlqaXBlbFpQd0Rzci9QYjJ6U21QSlRuQ2JNL2Z3NHhVUWVOVkpFdEs2cUZx?=
 =?utf-8?B?UlpVbUN6emc1bWtFUFl0L1hqcDhlb3FGVEd1NmJZWDlBdWFrN3ZwSTk2ZVdV?=
 =?utf-8?B?Wmw3MEt1c25kZEdHdnpKVUZRc2JJRm1Td2szT0lXVmdpUDY3MnBtSlBEWjlH?=
 =?utf-8?B?VjVldzdOQXVPRFk2ZjIvVW1DTkdFcUZJZEhnVzBjL3B2ejIwL3dVMzJoWEYx?=
 =?utf-8?B?b3ErM3lYWU4rLytPMzJ3OXpvSUg4Y1RDN2lCcUlkNDNGbnl3Vm5iQ0tIb0p1?=
 =?utf-8?B?dStWMnUzUUppWllsTGJ2WDhqTHdwWEhXTEdWYi9TSEk3M0dvdXo2aVRKZi83?=
 =?utf-8?B?OXdXNU4rRFg1V3NDUW00TVk5N2gvV0ZDdWdHZ05lcHdHL2pGeFlnNldvWERp?=
 =?utf-8?B?WXVVNUdiNEpuSG80Z2kxdXhkUTZLVnVkNmlaTndSNlRvcDBkU0VuQ2pOVEc5?=
 =?utf-8?B?MTR2V2YzODNSb1pPempNVGp5aUlPQmRidWdLZzNVcmtrVWpUNElnNXRPUmZq?=
 =?utf-8?B?V2JxNmpWU3NWaEtWNllQY0tneDRNZ2pxbWRkNFAzdlJmL21JdFFMZEJQSkI1?=
 =?utf-8?B?cHVKU3U3bnpkVCtoS3pYWjR6NkszK3pMUEJzenVCTFRPaFJEbXpnTERUOC82?=
 =?utf-8?B?dThSU0wwUXV3aC9PRXJyL2Qxb0RLb1JwV0Uyc2lvd0o1dERLSmRPdDY4MDRj?=
 =?utf-8?B?OXVUMzhwa0dqT3c2bWdaeDdpZkdEZS9UTUJlMlZqL3JxMzN1TFFZREMvVlZI?=
 =?utf-8?B?eTdIN1ZvV3h0OVAwR01MaXB6NjlwYUx2bHNveWFSaC9LaUJ1R20wUGJvSWdt?=
 =?utf-8?B?T0JSeGhmMWtMSXhxeWlBWDRpc1FpdDFuN3lFOExXREE1NktLTG9HaCtzeC9Y?=
 =?utf-8?B?MFBrL01yYlIrdjZieTd1Ynl0MjlyTEQ1b3pyMU5aWlVBYlNhdWhiT0dTNVVN?=
 =?utf-8?B?azdJRlhhTEp3MEd2bDlSeUJVcTdUaXBFMThVVW55TVZjWkFIVVZjYjZHOGo3?=
 =?utf-8?B?RWd1Q29ZRDgyZEpJVm1FdUpsL1ZPZktMQnVkdmVpZU54MXU5TXIzeDFNanly?=
 =?utf-8?B?WlVISlg4c3RwUmVqSzVGSmp5V2p6bHpoTTVPTFFOWDlYc2VvL0pwQmoxL0E4?=
 =?utf-8?B?NzhaRndhSmhpdTJiek1UMHhpZTdBaVJ6enFBMG8vVm5nRGVSNmd5R0pLaSsx?=
 =?utf-8?B?UmE2SVJ3aXhYMXBOUklObXNYVDFjWCszWGFZQWw4c3RDR0NUUTBZMlhkZ1Jw?=
 =?utf-8?B?emY4Wk9iUEVpZ0dWblhlSFVVcmJvWFlkZlFXS1YyNkdYaEdpTFVLMEJxMEpa?=
 =?utf-8?B?R1hBT0t1dUdYeHNoOGZxRE91YzliaEk2MkZST2VXMVB6THVzdERIZ3dOR2hD?=
 =?utf-8?B?SE5NRVNnUjAvOHFzM0E4ODRwSndNR0ozMkhYK1drYlBYdzZWQ1FFek9yY2lT?=
 =?utf-8?B?Yjg4YmI3SEV0WXFOd3orT29xd3RITmlQS1N1dzVsMU40aHE1Skg4MWthWEZm?=
 =?utf-8?B?MXd4Q2IyaHFHWWtXcGRkTFE0ejA2anRwaUJNU2d4WXZtbUdQb25KYUNVQ2dr?=
 =?utf-8?B?QlF5R0NLNmZmVHhndUxhcEh0ZWQ0R3E5UncwY3YvTUJVbTd3N09EZmJad3Y2?=
 =?utf-8?B?Um9pZGd1QmRRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlFCMTZzTXJpenQ3cExmV0pieTRhVXFXQ0hEU3gyR2YxSGhvQkFnaCtJSkow?=
 =?utf-8?B?SzlJV2UvODVhdkVBMmhHM05IalY1R0hwYnk4MXNLQ25uWDdYVEZWUG5paWUw?=
 =?utf-8?B?YXlOQ3pCMDBJd2xMcDZZY0lPOUMwdUk5QnRIVTJTR1dzYlNlRFJndlh3dWda?=
 =?utf-8?B?RVdvQy9ock1VU2g0bldNOWhhd3FDcEJRSU0xK25CUlRtQ1RaUkExRVRpYjVr?=
 =?utf-8?B?UUcyU1U2WXR3R242czkrRXJUV2kxeXFmNzk3elprdXJzUXZXRkpOZTE2bU51?=
 =?utf-8?B?RVdmZFh1aG92SElFNlNFQ3AwVmM1Sm41VmNtbEpleWpYRnpxNjg3NGdybGtI?=
 =?utf-8?B?K09rb1d0bmQzSUhJU2t2S1R6bVBmMHRxeDJ2UXZsQkFBVCtuOTAwd0lZLy9F?=
 =?utf-8?B?cFpmZ1I2Uit5RHAzV1VJZDZBL1pEZmU5V1hVYkZ4Z2ZZNkh0eURDOVluK1BE?=
 =?utf-8?B?UFFuc0JabkFaVlI1cmpKMkE3OStJbWJTY2MySnJlSm8xT0dRY2Z5MHBZcS92?=
 =?utf-8?B?RURaWkQ3V1BEc1ZGWG80YTZrQ045UnlLTWNBTUErNmVGMDlNZDltYlRURTZZ?=
 =?utf-8?B?RGhJbTRqSUZHVzdCdFI1RnIvTjB0bFA5aHhoUWpENFM2Y08wY2xmRnF0SzFi?=
 =?utf-8?B?VDNMVlRsNjQ0OVlicUVLUDZwd2hvNVd6RHIvUDFwV3ZEWW9ORjNWd2tDM2VH?=
 =?utf-8?B?Z3JwZEVNRTZoUzRMcWxmY1F2VUp4VTJXVkJqNFNzYzgvSzlBSnRpVEE5S3RR?=
 =?utf-8?B?ZVJhaXJlVkdJcks4NE9oaTl0b3hucUlnd3d4WVJHdmU4WXNOTTJOKzF1TGRm?=
 =?utf-8?B?UlJSTk1XV1cyOTNBYkdvODYwNFhNTXVkUnFQNXprV3BNVHFUaVlGQzByRmlS?=
 =?utf-8?B?TklYODFLbzViRmhjS1E0N3loWlU2anovMnBHTEhiQ1k3N0g1ckIxTHdZSGtO?=
 =?utf-8?B?clJjVXJOdnNUZENxYmN5WEJ2S29UWVJ3VVNXY0dEZlE2OC9GVXd5L1A0TGI4?=
 =?utf-8?B?bmlESk0xdmJSRVo5azVvV2ovenlyRUMrY0thbFFUR2Q3SUFPeWpWUDBDY3I4?=
 =?utf-8?B?dVRVNjhWa2U4SXkxcW1iRHd0R3kxeVJDdFBzWkcxYW1DMi8yb2tzSzIyUk9q?=
 =?utf-8?B?NXVpTEVhM2RnWTdxUjdWRnN3MHZJUDY5VW5sV2pQU25UYjNib0NCOGh3VlZI?=
 =?utf-8?B?T1VkOE9tckg2cnBWR2k4SUdvUnFJU2tyWkVtRTJ0cTJYS1hjcUdocGhkNG5K?=
 =?utf-8?B?MXF6UlFVWGRtQnZGbk5ieWNLdmU1UkV5Y2RFNmltUDB0TXZJMFVYWUg4TmM0?=
 =?utf-8?B?SW1pcWZ6OEhNU0poSzdVd1VRN1MvYUhHNmI4ZnRxTjgzR1NLR0FISGFrSUNW?=
 =?utf-8?B?ZjFxSTAzUDRtUmcvZ3ZxYUlBak40ZUp6Y1BjVUNxNzZzNDRKYytmSC9pa3ho?=
 =?utf-8?B?SWVtV1I3cU15bGc4MjViMHI1SzhWakRwVXNGVHlPRnJqb2JMU2dyOE9yRmpj?=
 =?utf-8?B?VkdvK3Z5UXJ1dkNqQ2ZuUG9ORXBManVaakRuaUU4S0k0RURJOHJ0Z1hrYkVO?=
 =?utf-8?B?dXdKWjdCaE0yNW9iVGtacmdDbU4zWXNWK1hSakpQOGNaTEhrb0w3RmlIY21h?=
 =?utf-8?B?NzNlUzVDWkpSdktSMzZHMzRucjNpVlFLMisxTWRNcGZhTDRMSUtoSFF0V05Z?=
 =?utf-8?B?K2hTNmZaQ1A0d2NDell0NWQrRU1mQlB6UFpuRHlJbmZHck9KTFZTekh0MG1a?=
 =?utf-8?B?Q2d5d0RiTjR4d2RZNTVmUXZmY3N4enBnUUVvb1BZNkd0Q1QxeHVEK2pta3BT?=
 =?utf-8?B?Q21SRFZQV1JjNVB2T0l6UURZeTJzaFhQcENyeU5XQnA5SmFESWwyanpuYjM3?=
 =?utf-8?B?MzF1TnVKaE9TTnU2ZUhQaUIxS1JLT2FvRVdSM2lGblVIRUw5RUxWeGpmcTdW?=
 =?utf-8?B?c1Ewbjc0eHpQa3pGRG43NllJaDMxZDhhb1J4azlqTFZoc0dZbk5HV3NSZGxy?=
 =?utf-8?B?NXFnejFpaDhtNlJ1bW1qK0RqWXFCTS8yd0tBeWUyOCtVeFpiZldZM3hHNklq?=
 =?utf-8?B?OVlkWUhwSjNrVDVCWTZpUDVXNXN6QjdPVUhpVjdUdWV5bVNseE5CempmUER3?=
 =?utf-8?Q?f9VBCn2jwDuL78VC9mGS2RSdM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1f0b2c-935d-4e2c-5a94-08de30f52fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 16:17:55.8153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9c1U4NwUcXuGj7u77/C+5eC0606ogEw0SiyeIDnZyN4dLZecBgg89IHQ+/C4y/6teESDfzq8X5a/MaUdp9msQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
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

SGkgYWxsLA0KQ291bGQgeW91IHBsZWFzZSBoZWxwIG1lIHJldmlldyBpdCBhbmQgc2hhcmUgeW91
ciB0aG91Z2h0cyBhYm91dCBpdD8NClRoYW5rcyBpbiBhZHZhbmNlIGZvciB5b3VyIGhlbHAuDQoN
CkJlc3QgUmVnYXJkcw0KU2h1aWNoZW5nDQoNCk9uIE1vbiwgTm92IDI0LCAyMDI1IDE6MjQgUE0g
U2h1aWNoZW5nIExpbiB3cm90ZToNCj4gT24gTW9uLCBOb3YgMjQsIDIwMjUgMzoxOSBBTSBUaG9t
YXMgSGVsbHN0csO2bSB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjUtMTEtMjAgYXQgMjM6NDIgKzAw
MDAsIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gPiBTdXBwcmVzcyBhbGxvY2F0aW9uIHdhcm5p
bmcgYXMgZHJpdmVyIGFscmVhZHkgcmV0dXJuIC1FTk9NRU0gc2FmZWx5Lg0KPiA+DQo+ID4gRXZl
biBpZiB0aGUgZHJpdmVyIHJldHVybnMgLUVOT01FTSwgaW4gcHJhY3RpY2UgYSBtYWxpY2lvdXMg
dXNlciBjb3VsZA0KPiA+IGFsbG9jYXRlIG1vc3Qgb3IgYWxsIG9mIHN5c3RlbSBtZW1vcnkuDQo+
ID4NCj4gPiBTbyBJTU8gd2UgbmVlZCB0byByZXN0cmljdCBudW1fc3luY3MgdG8gc29tZSByZWFz
b25hYmxlIG51bWJlciwgYW5kIGlmDQo+ID4gdGhlIGFsbG9jYXRpb24gaXMgcGVyc2lzdGVudCB3
ZSBzaG91bGQgYWRkIF9fR0ZQX0FDQ09VTlQuDQo+IA0KPiBUaGVyZSBpcyBhbm90aGVyIHNlcmll
cyB0byByZXN0cmljdCB0aGUgbnVtX3N5bmNzIFswXS4NCj4gQm90aCBzZXJpZXMgY291bGQgZml4
IHRoZSBpc3N1ZS4gQW5kIEkgdGhpbmsgd2UgY291bGQgaGF2ZSBib3RoIHNlcmllcy4NCj4gV2hh
dCBpcyB5b3VyIGlkZWEgYWJvdXQgaXQ/DQo+IEZvciBbMF0sIHRoZXJlIGlzIGNvbmNlcm4gYWJv
dXQgdGhlIG1heCB2YWx1ZSBvZiBudW1fc3luY3MsIGFuZCBtYXkgbGVhZCB0bw0KPiBmYWlsdXJl
IGluIFVNRC4gSSBhbHNvIHByZWZlciB0byBoYXZlIHRoZSByZXN0cmljdGlvbi4gTGV0IG1lIGNv
bnRpbnVlIHRvIGRyaXZlDQo+IFswXS4NCj4gVGhhbmtzLg0KPiANCj4gWzBdOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1Nzc1Ny8NCj4gDQo+IFNodWljaGVuZw0K
PiANCj4gPg0KPiA+IC9UaG9tYXMNCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4gU2h1aWNoZW5nIExp
biAoMik6DQo+ID4gPiDCoCBkcm0veGU6IFNpbGVuY2UgYWxsb2NhdGlvbiB3YXJuaW5ncyBmb3Ig
c3luYyBhcnJheXMNCj4gPiA+IMKgIGRybS94ZS9vYTogU2lsZW5jZSBhbGxvY2F0aW9uIHdhcm5p
bmdzIGZvciBzeW5jIGFycmF5cw0KPiA+ID4NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2V4ZWMuYyB8IDMgKystDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jwqDCoCB8
IDMgKystDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jwqDCoCB8IDMgKystDQo+
ID4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiA+ID4NCg0K
