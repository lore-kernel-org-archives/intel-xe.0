Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C5EC04FFE
	for <intel-xe@archiver.kernel.org>; Sat, 18 May 2024 02:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D49410E00B;
	Sat, 18 May 2024 02:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVLIP686";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8C210E00B
 for <intel-xe@lists.freedesktop.org>; Sat, 18 May 2024 02:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716000108; x=1747536108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X0/iRi5cgBdrm80NBpW2F6+qy0VBUSGTDkqPN7IJ78U=;
 b=PVLIP686RyufMAEC+YfFeg0/n0vyXIk09LKoQQrJdKwPzIayF37ECHQj
 nkiYm9Xmh3+ccDn60kA+bOdOS93H9DzgMcyQCvYH0pgMeAKWZH3LCUxJr
 IiSzvEzXopue9dZ9o82dbH4Fd26+xj0bdIPaSbaBhp0Ylb0sGxa9Nbz/e
 mmUlV4npSSeXgVwYGkN9ErV5z+W0j52t2YFbP5p6jYJ/VZ5fw0Cc5BHnN
 AA3cJXhwXN8fkHEOswP02TFq3iRRvQl0Bv1yC5MfSIkOVlTkaRY9obCur
 Vnn3bZJ/MJJ+jVuoMQMR3Wwdx4fND3QnFv58U7hNqxA15BzWP4U2nhJJW A==;
X-CSE-ConnectionGUID: 2fqi8KuWT8+H0GnOu0zd7A==
X-CSE-MsgGUID: AnTUanfITia047n5ooKG4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12047923"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="12047923"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 19:41:47 -0700
X-CSE-ConnectionGUID: hrwCkhGqSHOYoXqkkLt6rw==
X-CSE-MsgGUID: 7QgEUWV2Rz6RjqzOG1V28g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="32096454"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 19:41:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:41:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:41:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 19:41:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 19:41:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gG6yybwa96zKHQU9788PGLmbXY5iAmJ7xzF6uJEgXUC2oxQE8iyIlf7TOx5BgM0MfD0xC987aLCvGX9s+mQ6cxFJkTiHcVwnLSZuEWMAohpHFtOUHlvK1rFAQRTcjPSp/th4P/+4it7HWCtnQOawjeaaEvm/zmxNA+p+7rry8kBBLgQw18oNYqu5QWqtpX64f5r3h2CfDmNia7l1QkoWmMylp9jSIR0z9B3XetC3XnYauCNcTbQlhmK0lcNc/b21533yjWbJazA4uayS9Cf3xA2ObJ2aBdTIbzEX9waIAJF9GeO8klVezFoWcb2OF2Jdj1ueO2n4ZQDsq5taoco27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0/iRi5cgBdrm80NBpW2F6+qy0VBUSGTDkqPN7IJ78U=;
 b=LxSBMW5SaHBjj/hCPiLjIUMAyaRkzbcQXwGaUz3ZfX1P6y+EVeYJgVBheMpG06kPTGb57qr7q3vgE7dSJJIX5fMpn3ihaeNsPiP3cl5YjHxrVh2LZYJGhCm6EZbLXzkSt82V6wnhBTcac0gC3q1rrSDGwbzAOeSlWdNlSX09nTYA3Zb8zekx2g2uzK8P6W14+0OUA1w2rMzuKrEsbPkaLH8SQb8OF63rMhL2oDSVNUJw7SgqKDCE/t3bsdSeX8MmmTWIc5GFb6RyP4s4vrSElxf0FnFBqlUqnj7AnnIkFZTY6XMgVR24j0WHyjIb7hCW4fXQP3F729F4zW7LZDmBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Sat, 18 May
 2024 02:41:43 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Sat, 18 May 2024
 02:41:43 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 0/6] Convert multiple bind ops to 1 job
Thread-Topic: [PATCH v2 0/6] Convert multiple bind ops to 1 job
Thread-Index: AQHapmBt9ZqMzEAmMkOBuCwqFsrX0bGcTMSQ
Date: Sat, 18 May 2024 02:41:43 +0000
Message-ID: <SA1PR11MB69915E51A74546D7F517A07A92EF2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
In-Reply-To: <20240515004010.100091-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB6614:EE_
x-ms-office365-filtering-correlation-id: b1422160-a696-4088-d6b9-08dc76e40def
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?K1JXNUt2M083NmxGWHUyT1poOXBZNlg1ME5YN2YxRW4yWldUdWVsZVdCWmQ2?=
 =?utf-8?B?QytkYXFQSm4ybi9QRjBQcWJIdnhWaUVKVmZ4RXllWmVJNkN1dWJWWWpPMHNk?=
 =?utf-8?B?U3R3YXBnbTNqamwvazB5K0ZXWW40azgxN0JiNEkzZkZoUGVybVJteE0yY1pI?=
 =?utf-8?B?YlR0Wm5IN3Z0UHdJdzRTb3c4ZnNxZ3ZWUy9ERUEyNmpTcXRaVmtqckxDUlEy?=
 =?utf-8?B?WGlETDV4MXZBeU84aFVQeXoyeklWNkg0WDQzOWdMTmxFRk8zZ3lCbDE2OXpy?=
 =?utf-8?B?TjYraG5nNFdJdDY3dFNMS1A1MnowYS9wRm5iS0kxcXV1RUlKcUNER21wL2RE?=
 =?utf-8?B?R1d0MUk4U3FwdHN0MksyS0JIU2Vudi9ob05RVjc4Tis2MW1JMGhHZys2dnND?=
 =?utf-8?B?SlJTVXNLQy93YW9BdG9WNVRTUDVPUHB2aTJKdW9mNWVvaFFBZE9SUTRNOFVD?=
 =?utf-8?B?MFV3TjRtS0VXS2ZadlZHeEI0TzI0MFcvZVlCL1VFRUFQY3NhNU5wQlVKRUFU?=
 =?utf-8?B?WllSNEtrMjVzd2R0YkRObjJSNm52TDNMcGlnRkRoOU1qVU1mbHU1MHF5N2Iy?=
 =?utf-8?B?emRFMnVaMkZpbmJsbzJoaEhyZG9vaFFCU1Vkd2xOS2ptYmRkTTRDMVg3MGR4?=
 =?utf-8?B?UGY2c0RqbWJTLzdTUWdEdEsvL09vL2l1K3dLK2ZFMWcyeklka0FWUU1xR2hY?=
 =?utf-8?B?NzJxY1ZWU0NnblRJYUszY0hFRVFBSUtLNTdmUTdtdkxON2dIand2Q3ppNzF6?=
 =?utf-8?B?RzNPRmpZZHNrQWxBRDMvMmZKbEcrWGtQMSs2Qm5JNGh5eUZCTzRjanN1cnhW?=
 =?utf-8?B?SlNmdEc3Qk5MS0dFNFN3Y0ZLNVFsYjhXbWhzVUM1dTZEampYYll2OUhVMm1s?=
 =?utf-8?B?K1hYVVJRY3NuS0NFN1RLa2d3aVYzUURHSzVXWTR1UzdMaUxhcnFWeFlyU1Rt?=
 =?utf-8?B?L0YxbThGQm9KeGJNREVpbHpWMWZub1pNMUl4ZWdIdXU5aERmeUpkQm04TDZk?=
 =?utf-8?B?MVFzR3JkdVdyVlRPdzhZcmUzaXlmSzlqZ3lEVE5RZmZLUVJySklvWFFmSllD?=
 =?utf-8?B?d3plSmlaOTV3WnRSSXRIYkdkNTZ4cGxhcGxJUE8wdlFGZWY1bGoyclRZamxr?=
 =?utf-8?B?R1VXM0NDZ3RxelRpbFc3bVU3VjdHeS9WOE4xbkRxNWpIVXZMNTFGUWt0Nnpp?=
 =?utf-8?B?WG0veitEMkQvTmtaSWtpdTRUTUEyRTZVbVYzQThUaDVpeHVydFRUN2cyNHdX?=
 =?utf-8?B?ZWpTQ1F3Z20yV2U0ZmFXQ0Z5Q3BYL2NUNEZYNm5sVXFyZTBmRUYzWm83b3VI?=
 =?utf-8?B?NERRM05kN3R2VFNFdVkvYjdXUVVLdUZZd1BFZ0NpVU0wbUc1Sk1pM1R6NEMw?=
 =?utf-8?B?cmdlbHRCMC9HaW9jellSb2Z6dDhNR3NmZkpEMjBFdFJPZjhYK3hmOExGUG5I?=
 =?utf-8?B?M2x1RWVSeitsQWswR2dIWVcydDBsaTAyVkl2Z1kyNUtwamVRb2Z1UlpHNlVE?=
 =?utf-8?B?N2dJVUZ3K0RZeVoxb0g4UGhkREMyeURqMkZtRGx3bUF2Z0tYYmhFWU5vM2JC?=
 =?utf-8?B?UytjN2tvSk9FUUZZdDR6KzgvMjQ2M1NPSGt3d3lxMFVtdHI4ZEtPc0VIR1Q2?=
 =?utf-8?B?SE4zNDdjNXc4OVBVcUV4MUVHYzNZZFplU3ZzWXVMeCs0SjRJWnhGeEJGUDJj?=
 =?utf-8?B?akRIbUlqMFlHZnBTZUxLcnpMZzFFZGNRUTFKdzlUeVpUdW5wVzNPc2xDTDJG?=
 =?utf-8?Q?SAIi+7EtwK2pm7afTI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0ZiVkNpemd3M0JxVzBkRGhFTG55eEdnbGdxZVhnNUpvNThMa2Ruc2VxeWlD?=
 =?utf-8?B?bjJhTGQwMTU3VnlrVG5hMnN4UG55dzk3SVlrYllzRGZGZ01OdjcrSVlGRlU0?=
 =?utf-8?B?dm52OTgvRjJsa1l5NzhWZkN0cDIwUW1Ja0hrWXZHNmtubzB0Mm1QNXFwbWZX?=
 =?utf-8?B?V0lsZXlDR2oyV3k5TVU3Wm5hb3QxeTg3cXMyeFF5MU54cnZJRWErdDdyNkdm?=
 =?utf-8?B?OVYyZGprbUE3WkdDbWVpV0NOaTExUFk2Ykl3V00yVVJ2d2RTVHBacll3TW9t?=
 =?utf-8?B?Q2lXeUxCbGNTeEp2dFZyY0FreTNHZ3RFMmorNmxmc09tOFFHaHd6QVoxWDhY?=
 =?utf-8?B?VUM3QVF1c21IZmhWbmFSNGpnSTY2NmlSWXIzUzBMUHhRNHh5ajF5RS92K1JP?=
 =?utf-8?B?bGJqNFFSei80ZDFCQ3FqNWNBV3F6czF5TXFOTzlsQnlnK0R6TmQ3T2ZGcmpS?=
 =?utf-8?B?WkV6b0FnN0FlRHRqdWswYXQ2SWkzTXBkM3FDR3cyWVJmTTg0UjEraFRQV2lo?=
 =?utf-8?B?bURRWXdCNXVwWGMrM29QVFhnMW9qTnNtZkZYdkw2a3FCemMrcXV0Vm9LMWtn?=
 =?utf-8?B?L3lYYjlMYVIxWkdzc2U3aW5WM1pIUWI1TGdmTHNFRjB2aVFGTzFlVU1GOStU?=
 =?utf-8?B?WGlhOStoa2h0Ylc3RlBlUTVXcGlTM0hpVlVkZzJ6djRQcnhwQ3BySUZReUFi?=
 =?utf-8?B?ejJKWmVhNFBKZlk2UnZhMU9ocUQ4SWxCekZTTllIUmw2aUYrNGRHcXp2U0VX?=
 =?utf-8?B?S2RpR29nV0R4bUJaTmY2UUc1by9MQlRTWTFxWkJsUk9xZFRBQ21Sc2dZK25k?=
 =?utf-8?B?RUk1TEpwdUZOQmtCejh6N01EWTRoWjdudE1ORnc3QjFkeWVNUW1BbUhVQVR1?=
 =?utf-8?B?MndtOFh2emplYkhwKzNuanpnMVptblRrRlBDUUtxZkhBdmdsRC9jZk1BZUV0?=
 =?utf-8?B?NHZLYkZvWEp2Y1BVKy9hbkhaT1JBUHZUald3NVd4ZWM3Y0lrOXN2djVQN0Jv?=
 =?utf-8?B?OWhIdUJIc0M1YkFKSE5pdFRpcHBpNjlnZUdGT1FpZnYwbXpOakpIbnFwdG14?=
 =?utf-8?B?Z254T2lZSjdRVTFZUThuekxsU0tHa1RQem1HUTI0N0VRN3VUOW02SGd4RVIr?=
 =?utf-8?B?YTNidElYeWtCTWRla3FoUElSclFNcUhWaXk5eWZyWnlGbkF3SlRDckNmWWtQ?=
 =?utf-8?B?Z0x1cnRlSlVDelF5bjNPSHFkQ2ZGTEJma0diOUhwS29zdFR5d3JVdjd2TGR4?=
 =?utf-8?B?NGhOdkloNyt0dndJcEVQTnhFUnJ0WTRuMnFoVk12ZGllRkFrU2pzUmROZUIz?=
 =?utf-8?B?SnhmenBKSlcwdVR5SzFCMVhLdnQ2YmNjbjNZbHZTYkZFY1lEazhNMWRRWWhS?=
 =?utf-8?B?NldqT0pyYUNCY05QdzN6dy9tZjRzVHRrSDViRTNHUzIrcXBzWTFLOC8zTkNG?=
 =?utf-8?B?bmN6YWV0ZzBHUDhveUJiWFlnNVBsTThCZ1l2Q2NpT3NXMi9POUdOUFpTR3Vr?=
 =?utf-8?B?ck8wTEVCSTE2TzRCMFdBMndzRUp2cGIzL2xhWVBSVzZqLzgzMEpCZHBleE5D?=
 =?utf-8?B?WklxTGUxbU9KaEcwS3NNemJ6QlFsbHhKeWFwb09Sc2V6Y1N0WmlmV3Y0R1lF?=
 =?utf-8?B?TXN1ZzFMUWhEUFNDM0RuU1VHMkdCZkJWMEs5WVZiSTRpTmhWcVV1c2RSZklu?=
 =?utf-8?B?RVdCUGlDVys5Y2ZXOGs1dVZyME5ETWRHdUhSRldmZHdPS1FnQnpYYzdBOHIr?=
 =?utf-8?B?VTdGL0wzV1grYVlxZWJHMjF1VzU3Z2I3eU45dHkwVm1kSEFGaUo2L0IxZ3Nk?=
 =?utf-8?B?SThWVUFQSlhWNEdMN0ZoZHdiM1krNTR3VllPWmtKWEFNbERSOEpCRUtsZzRI?=
 =?utf-8?B?Y2V3ZjZhSUdZN1pQTWZWSy9aWEdqMHN3MC9IWU5UaGVQQytqaUZUWVFmaGo2?=
 =?utf-8?B?RkRPZFZGWlQrY0NibWN4SW0yVWlSaWlYeDFsM3I1R0RDeUxPcDVObWZEdzhD?=
 =?utf-8?B?OXdSei9NemNJOXBFcEZHSHVvaEdldTgvT0ZydTNsWWt4alpyS1ljcDVGQW5W?=
 =?utf-8?B?Q3ExRnM0VzNPWXZuSkllOHkwNXJTRityWVcvb1ExOXhwRXNpTHFKbGo4NzRu?=
 =?utf-8?Q?jomXNJNs4Da4uprhQvsMrSTl1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1422160-a696-4088-d6b9-08dc76e40def
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 02:41:43.7769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dFAD0J91ccommaP4DG12FPeQBfNujbMj2tklIG3rwGS1tv53f6ZR/zn+aDW+fQ8hQUrROBETAUJmy1N8BQhLkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6614
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWF0dGhldw0K
PiBCcm9zdA0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTQsIDIwMjQgODo0MCBQTQ0KPiBUbzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAwLzZdIENvbnZlcnQgbXVs
dGlwbGUgYmluZCBvcHMgdG8gMSBqb2INCj4gDQo+IENvbnRpbnVhdGlvbiBvZiBtZXJnaW5nIHBh
cnRzIG9mIFsxXS4gUGF0Y2ggIzIgaW4gdGhpcyBzZXJpZXMgaXMgcXVpdGUNCj4gbGFyZ2UgYnV0
IHVuc3VyZSBob3cgdG8gc3BsaXQgdGhlIHBhdGNoIHdpdGhvdXQgYnJlYWtpbmcgZnVuY3Rpb25h
bGl0eS4NCg0KQ2FuIHlvdSBhZGQgYSBkZXNjcmlwdGlvbiBvZiB0aGlzIHNlcmllcywgc28gcGVv
cGxlIGtub3cgdGhlIHB1cnBvc2U/DQoNCk9haw0KDQoNCj4gDQo+IFRlc3RlZCB3aXRoIFsyXS4N
Cj4gDQo+IHYyOg0KPiAgLSBSZWJhc2UNCj4gIC0gQWRkIGVycm9yIGluamVjdGlvbiBwYXRjaA0K
PiAgLSBGaXggZG1hLWZlbmNlIHJlc2VydmF0aW9uIGZvciBiaW5kcw0KPiANCj4gTWF0dA0KPiAN
Cj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI1NjA4Lw0K
PiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjk2MDYvDQo+
IA0KPiBNYXR0aGV3IEJyb3N0ICg2KToNCj4gICBkcm0veGU6IHMveGVfdGlsZV9taWdyYXRlX2Vu
Z2luZS94ZV90aWxlX21pZ3JhdGVfZXhlY19xdWV1ZQ0KPiAgIGRybS94ZTogQWRkIHhlX3ZtX3Bn
dGFibGVfdXBkYXRlX29wIHRvIHhlX3ZtYV9vcHMNCj4gICBkcm0veGU6IENvbnZlcnQgbXVsdGlw
bGUgYmluZCBvcHMgaW50byBzaW5nbGUgam9iDQo+ICAgZHJtL3hlOiBVcGRhdGUgVk0gdHJhY2Ug
ZXZlbnRzDQo+ICAgZHJtL3hlOiBVcGRhdGUgUFQgbGF5ZXIgd2l0aCBiZXR0ZXIgZXJyb3IgaGFu
ZGxpbmcNCj4gICBkcm0veGU6IEFkZCBWTSBiaW5kIElPQ1RMIGVycm9yIGluamVjdGlvbg0KPiAN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ib190eXBlcy5oICAgICB8ICAgIDIgKw0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgICAxMiArDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jICAgICAgfCAgMzA3ICsrKy0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21pZ3JhdGUuaCAgICAgIHwgICAzNCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3B0LmMgICAgICAgICAgIHwgMTI4NiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmggICAgICAgICAgIHwgICAxNCArLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3B0X3R5cGVzLmggICAgIHwgICA0OCArDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfdHJhY2UuaCAgICAgICAgfCAgIDEwICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYyAgICAgICAgICAgfCAgNjQ3ICsrKysrLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5oICAgICAgICAgICB8ICAgIDIgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtX3R5cGVzLmggICAgIHwgICA1MyArLQ0KPiAgMTEgZmlsZXMgY2hhbmdlZCwgMTM2MCBpbnNl
cnRpb25zKCspLCAxMDU1IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi4zNC4xDQoNCg==
