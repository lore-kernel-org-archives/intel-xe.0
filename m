Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FB6F428DA
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 20:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF4E10E1A5;
	Wed, 15 Apr 2026 20:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkGTANzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19FC10E127
 for <Intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 20:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776284286; x=1807820286;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=u7IfJUz+V+YNOkr2CR2fG7bYs64Rrxr8uoz/SAdtPGQ=;
 b=gkGTANzu1H+7rxnLGUxkLcnMCW/tpEdrTZuwl+kflpLx3L5SqMCNRY4M
 9AqfqMOwldIFeFTP9T91rpxD/S7ZSPbxh+44gIIddtsCHl5wKeMvW3mEc
 z2HtkvqBbdczYYq3yrCehJm5Qy1ydmM+JhyslMUKd+3k/5huPfdQ7ssid
 zymNjrGDiYYlVbEu7IGV25VKOpOQONjCo1zBs21xYFTHggOlrqgNTVDeX
 Um1GtPTRxMXYb3HWC75qbqysPddgLmdepf4L/GlCIjb5aLvQf2q/06rGj
 Lx4GMnJkF7RWgBgfvabGz6wZgnw9cOMJ+QzG3Jn/U3MqkhjEyhmVpZEh6 A==;
X-CSE-ConnectionGUID: YEx1k2g5RDuP0OxMXNF8mA==
X-CSE-MsgGUID: bPNO6baYTZO5xXA6NF4uyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94844109"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="94844109"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 13:18:05 -0700
X-CSE-ConnectionGUID: ECk6EbS4QVaYrAQQsK22Zw==
X-CSE-MsgGUID: fJi6nLs2TGKC5bXFeFdwlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235477818"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 13:18:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:18:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 13:18:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1lK2mbltv9FA/guFv37jPZhxgo2hRNIYc/tP9Ne0oo4IPJc0klDjMuMqvCsOxC76R4pPDQylu/YvUV768QPqduv0gK1iZtDsJB3qC+phF2awWZq7LR6cmIHpLuu/Tux/N9lKksQdXfZmqd7gCrzyvU2NYfFDuZ881HtEoCbbQqZJF3t4NKskoIraB+J808xLzLECRhANulGz0reeWHg8QdVBr9Jetj1uJWT4+iFiwSJ5v9py2flQOjaYKYR/hD+E7ekRA+mo38GYtRmiXnNoOoKLI2gNjotezkdEcic2j+Ugvc/oH1Yqx8+3TLknZCGQ1IQbk942UmuzEUm3yB+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7IfJUz+V+YNOkr2CR2fG7bYs64Rrxr8uoz/SAdtPGQ=;
 b=EZ+N3dtnjAk81rt15vuKqJXYATNtVnW5JYYoiSzkUxHbShKJHByopLlD8yFDcwCkkrpgf1YmQBcmpxp6jervsFM2UXRcaKxnDaF4MPk3RzsL1THd1mmePegwbop+yLDK44F1pSsTAOaaGYq2xfzrBOkpsZLTCO33uD+jxMia/HBiD6KxVqr+Hp2nHtyU/PW2Z4LuArkFFvOZ/Ho5Sw4IbFR30AHV4A3GUkBOFLMPB197FFwxnQcW89ZEFYPX6JGMAw0Gw/dKnhsimNtwIwfmhkV3uMwm1Ef58xEjuP7hm0emYoC7VZFnQaw9bj6kSLVxSStrH87pz8ARzTtTcMGTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 20:18:01 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::9d87:b68b:2924:47fe]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::9d87:b68b:2924:47fe%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 20:18:01 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "Intel-xe@lists.freedesktop.org" <Intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Apply WA_14026810691 to engine
Thread-Topic: [PATCH] drm/xe: Apply WA_14026810691 to engine
Thread-Index: AQHcy4Gs989HyMPjkkuDZcIeN+qPlrXgilsAgAAH5gA=
Date: Wed, 15 Apr 2026 20:18:01 +0000
Message-ID: <8c0db43e18be50bc94b57ca339fdefb27bc0676c.camel@intel.com>
References: <20260413200825.4054940-1-clinton.a.taylor@intel.com>
 <20260415194726.GD755471@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260415194726.GD755471@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|MW3PR11MB4538:EE_
x-ms-office365-filtering-correlation-id: a0f0ebda-6949-424d-2743-08de9b2c17f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: vBZ+ANH5VAHdFT76eEXruUdaq5pW227YkfcfuyuyRRE0aARpbr1lpeMyCXB3l9ZlhtYbV5pxaw0qa0YllygN+haHQ/lVE+W8LMqGrDDa8hN6QjHoSNzZfpDdrz6xesO9oDZxOzFffyIycpFAhLZNaPAKl7hTQ21ln56+CuU6Z9GDUgUlViSiozDZJgpI8O2JdiFsHfx/kzJxCqISDYfiXZLQyehVb7hr6JQyaudH9cXilNU7ujRHYrBAe1qh8zu7HivQmJjV75lr8iyOsSdOnzwV67MYlMlMrw08fD5i0fqdCTjE4SRxyQIr4/YtG1QhyV/bw8DjcA4orac0Obb/8e0CdkiOwPWMG3Vx7PGpdz68zXdAax321tWSc9UZnKjm6PrFemaTx/haMuNAUcbWJZoizged2FFInUfp7/yC6a9+WH4xlsM9F+sGia0xe7Uz/o9U9Z5abStNWOTteKPk8Iw0m5fGm5x6P4/gICp17gxvCRbrv4yetCIHww3remHeL0gOinJygTKfJZBqN4qgWU7etP/UffwSnz0ygbGT8cbok1JzEpT4AwXvb76Vw1h3vFhce9J0ZBLwUQCdVS909SDBFQdfq+LgaWMiT1fuiQ3LX6cBqxPfWlCDiUceNjEfVk/HlDgi/i84ukBgUiE8ZoGjXxOrcVLwaBTXyPhip12vkAkw9pVNu4urOz/36rqHj4Sis3gNgJdQCCPdv1fExXQoO2+eZ8h7hpGZx8J3B6sU4QBf0HFmj1ZmFdllINmYv2hOf4Up5Rb3QsPzzJOSJGmqTVNRm320teLYXyInGW4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amxqSXZ1eStMWVo3MlY1UWRlc0RubGNsbzBwbTRIY3QyZkpRcHl1OVU4L2d2?=
 =?utf-8?B?UEloUDFVWmpsN3JPcEQzcmVRZlJpTWpOcTRGOUJvdmtZMEhJQWMxUXJhS3lu?=
 =?utf-8?B?d2UrZUtweHVZTkRuTERqRi9DN2pYLzdWZ25nNWp1eUpjcmhHOFFtc0hXd2wz?=
 =?utf-8?B?RHhBVmNkNGRyWmNlTm0xSDlkY2dla1ROQmo0dDhRNGhIdjBjODdJK0xpd2or?=
 =?utf-8?B?cEk4dWQ0NEZOVkhuZThLaXBSV0pkTG1uVkczYTF0SE5kYVJIODl6ejdXaVdB?=
 =?utf-8?B?cTJaU1BFalI2WlpLajBPWWYxU2ZSVkJIOXd4Q29xN05MaWlGaGxVaUw4eDcy?=
 =?utf-8?B?emFMTis2Mlk1V3AvTGNJVDNTVVgvaDYzQjNuLy9CNjdnaEpvczI1TkNmNDJP?=
 =?utf-8?B?ZkJTV0lpV2gxTzhmRHFENDg3N0FhclRuaHlVRndCM25GRFI1a1dmeHYxaTV5?=
 =?utf-8?B?djZncFY1R01tRWxFc3JkMmE1NVd4bW5OaVFLK2E2eWxNVE5kQlU3NitOb25K?=
 =?utf-8?B?cFJTcmk2b1NmWmJBTjVwZkFpWU1ibjhTQ29jS3pJQStPYXJGOENaaG44Umx6?=
 =?utf-8?B?NXFkcnVuVWtzTGY0MnlRZzFnVkdscHdFRTFQV2hGVWJudFRxQlQ1VERvL1lh?=
 =?utf-8?B?anJxSkNvOW5USEg4Nk5ubW9VNCs2NUFrYlJVWnFMdXRNS2lwTXUrQ3MvaFpE?=
 =?utf-8?B?R1FOWVdMVVE2VG1nOTEyTXFKUHdpWWVkU0liTjc3cjdsMHRvYThiMVJobm9I?=
 =?utf-8?B?WnRnOFpURXk1b0NOaEhJcDRXbFdCZVNHZjNnL0NGRm8zcTdLbTNOcEw3a08x?=
 =?utf-8?B?elpXV2w5U2tSMTI5MzV0cnJEZGxXV2hOaytnQ3BDdDFLb2d3Z2RLS2F3d2Iw?=
 =?utf-8?B?MkxjNG5WdHpRTjNsWERQOXlrbTlNcVRPYzZVQXRET3MxT2FtRmtzV2pLWnRF?=
 =?utf-8?B?Zk9SU3l6a1F5Y3NxQVdXeGhoenpvQ3lIUFZWSldGL0hlbWhFQ3FQdTlTNjM4?=
 =?utf-8?B?VHdTaDlYNXE1aUxDcnRsMGs4Yks2Mm9IL3FmMlpvYy80cmVhSmtJa2J6ay81?=
 =?utf-8?B?dXNZMk84c214R051dkdubjUxOXc1cThENElTakY3N21jaWtHZm1wbHlXQ0oy?=
 =?utf-8?B?NE90OGhjVTJCU01Kem16MG1NWitWK2xHN0VtUGVrTnQrRDJxbGxMa3QwdjVK?=
 =?utf-8?B?RmJHNTRUaVN0cFk2QVpzV2RwdVdhZDBITGhWN0NMSGIvUFdPL1V3VE1vSzdo?=
 =?utf-8?B?R3BRMlpzTGRrL0dOTkdvelA0Y3NNaGFRWUh1VnVmTDg3cHQweHk5MmFRTmQ2?=
 =?utf-8?B?SjIrV1UwanFTU3doNUUrdTJLU2Z5YkdYdlVHZ2N5VWIrYkVMem84SU9RdjEy?=
 =?utf-8?B?U0hpNmRVaUJEdjd4SFUrREFydkVxMmRERHRXWmpPbjlMVllSYUhJb2pUL1R1?=
 =?utf-8?B?T1RVTGV3UGcxS08xNXFRS3FJdTR2aUo1c2sxZzlWOUJUZzd0Ri9tbGtsbGdr?=
 =?utf-8?B?ZzFRR1VuN3l5b2d5dmpmSnBGL0hYZTlldTZEckh6SzgwMFN2M0I4b21HOUcx?=
 =?utf-8?B?UjZLNFN5eDQ1TUZvUmN0ZXF2Y0ZDRlNteVJjWHdWNDdWYXQwSzFyM3R6dXJO?=
 =?utf-8?B?YXV0Q1Y5d2ZXcW1iUmRHWHV1S0NOV3lHL0dLelRiSk1KMVJhaTROUFJWL3M0?=
 =?utf-8?B?RWVYUjNGSXlPMXZjc0w2cTdkK3Q2VGk1anp3SzY3cFpSUStodXNXS05UUXcx?=
 =?utf-8?B?cFBPVHZzVTZxYll4SnZDOHR3cFI5U1JsbkVCQ0lWM2tGcnU0OW1rTmt1RS9H?=
 =?utf-8?B?U1dFU3daem5tUlRJNGMxVFppVG43QklHczZLS0lJbDFydGJYdkhoa0F1ZTFE?=
 =?utf-8?B?T1laY1B1L2MvOXZyc1NzdmtqVlI2MW1lUXZTeGxDVHJRK2dYR3hCM1FkMStL?=
 =?utf-8?B?Q2ZPTWEvcEV5SkIwZDJEQUxxamhsbDdZTVc2K3J4MlM5REZIQ2NqSGt4aW1X?=
 =?utf-8?B?Z3pudFlnNWdUM2E2UWlPajlFbDZNMzBPR0FWSEZoR3JWK1VzQlcxZTMrcmpa?=
 =?utf-8?B?dktGSE5VTm83L0gvQkQxN05jQm9Xa2NaUkpPQXcyK1pzbHNGaGh1c1BXTUx1?=
 =?utf-8?B?ckpzbnZBWWRTTHVPdGpDRjRtWStDSk11QUZVUVNkamt3bjZiMThTTStyaTJI?=
 =?utf-8?B?MTNqeURPOVpyWnlxQlBQekdQaGpvODl6d2x6WkRSWUE1YUZVeGJFcTZCZExh?=
 =?utf-8?B?SzgxU3QyMmlCeU9GaE9ZZGxQOGFnUVZqc0hvWUtkdmRMVTNBMEsxRTkxUTFi?=
 =?utf-8?B?eVlXc2tEY0p0T3RWL0FUYWFBZWQyN1hjZ0k5d3laSkJ3azNkQ1N4N0M2UTdQ?=
 =?utf-8?Q?XGJCuZpozkVHSqpc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED0CAC6ABDF89841AF33555C6C951A2A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sWQ6jU2gnKsISQ3TEbvwzZipEmSgt08V0hbtTE1mVjDWIS/ISNETvIeBodKMYboNscPQY96DNlUWx/TgPveAanedo8VaS24O3DSVqRUp2oPU5CfDsnptfvHYDch/heO6aksNFWrDdlJ/LxGcZD3hyy0KaLDlWqeevTlYRccUaY3k/1Qam1aYbyww1k66ZjRgHEUEpOtlK6DhflTyL1MhfvExM1I80c9GfGD9ppO0wxPjbhQfHUXPi7Kb6wIdH1MpdJeYecIOiC8mPzX4k+/DYhRgjLvHP7dV6hE0Q9pMAtdxQQZR/6tMv4BDO54hNUHw2XEF48d9sxlgrKHPXz3/jQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f0ebda-6949-424d-2743-08de9b2c17f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 20:18:01.5131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ph2lgVQtXQcPITHxP+AZHoN3bFtaZa+tX1wZan4ftvt65TIfBGR0Q/m0B9K9kiYcG6QJyKhsh4vZ2PCxapShoOAz6QA/jGW5XgVwQLuh13Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDEyOjQ3IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBNb24sIEFwciAxMywgMjAyNiBhdCAwMTowODoyNVBNIC0wNzAwLCBDbGludCBUYXlsb3Igd3Jv
dGU6DQo+ID4gQXBwbHkgZW5naW5lIHR1bmluZyBXQV8xNDAyNjgxMDY5MSBzdGFydGluZyB3aXRo
IElQOiBYZTNwX0xQRw0KPiANCj4gVGhlIGNvZGUgY2hhbmdlcyBsb29rIGdvb2QsIGJ1dCBJIGRv
bid0IHRoaW5rIHdlIHNob3VsZCByZWZlciB0bw0KPiAiV0FfMTQwMjY4MTA2OTEiIGluIHRoZSBz
dWJqZWN0IGFuZCBjb21taXQgbWVzc2FnZSBmb3Igc29tZXRoaW5nIHRoYXQNCj4gaXNuJ3QgYWN0
dWFsbHkgYSB3b3JrYXJvdW5kIGFuZCBkb2Vzbid0IGhhdmUgYW4gZW50cnkgaW4gdGhlIHdvcmth
cm91bmQNCj4gZGF0YWJhc2UgYnkgdGhhdCBuYW1lLiAgSWYgeW91IHN1Z2dlc3QgYW4gYWx0ZXJu
YXRlIHdvcmRpbmcsIEkgY2FuIGp1c3QNCj4gbWFrZSB0aGUgY2hhbmdlcyB3aGlsZSBhcHBseWlu
ZyB0aGUgcGF0Y2g7IG5vIG5lZWQgdG8gcmUtc3VibWl0IGFuZA0KPiB0cmlnZ2VyIGFub3RoZXIg
Q0kgY3ljbGUuDQo+IA0KTmV3IFRpdGxlOg0KZHJtL3hlL3hlM3A6IGFkZCBndCB0dW5pbmcgVGls
ZVkgMngyIHdhbGsgcGF0dGVybg0KDQotQ2xpbnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiB2Mjog
bW92ZSB0byB4ZSB0dW5pbmdzIChNYXR0UikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBDbGludCBUYXls
b3IgPGNsaW50b24uYS50YXlsb3JAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggfCAzICsrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdHVuaW5nLmMgICAgICAgfCA1ICsrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9y
ZWdzL3hlX2d0X3JlZ3MuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVn
cy5oDQo+ID4gaW5kZXggYWEyNjdjMmY2MTYyLi42YTE2YWMxYWNhOTYgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oDQo+ID4gQEAgLTUzNiw2ICs1MzYsOSBAQA0K
PiA+ICAjZGVmaW5lICAgU0xNX1dNVFBfUkVTVE9SRQkJCVJFR19CSVQoMTEpDQo+ID4gICNkZWZp
bmUgICBSRVNfQ0hLX1NQUl9ESVMJCQlSRUdfQklUKDYpDQo+ID4gIA0KPiA+ICsjZGVmaW5lIFRE
TF9UU0xfQ0hJQ0tFTjIJCQlYRV9SRUdfTUNSKDB4ZTRjYywgWEVfUkVHX09QVElPTl9NQVNLRUQp
DQo+ID4gKyNkZWZpbmUgICBUSUxFWV9MT0NBTElECQkJCVJFR19CSVQoMikNCj4gPiArDQo+ID4g
ICNkZWZpbmUgUk9XX0NISUNLRU4JCQkJWEVfUkVHX01DUigweGU0ZjAsDQo+ID4gWEVfUkVHX09Q
VElPTl9NQVNLRUQpDQo+ID4gICNkZWZpbmUgICBVR01fQkFDS1VQX01PREUJCQlSRUdfQklUKDEz
KQ0KPiA+ICAjZGVmaW5lICAgTURRX0FSQklUUkFUSU9OX01PREUJCQlSRUdfQklUKDEyKQ0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHVuaW5nLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdHVuaW5nLmMNCj4gPiBpbmRleCBmOGRlNmE0YmYxODkuLjM5NDIzZDVmYWJj
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHVuaW5nLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHVuaW5nLmMNCj4gPiBAQCAtMTI0LDYgKzEyNCwx
MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBlbmdpbmVfdHVuaW5nc1td
ID0gew0KPiA+ICAJCQkgICAgIEdIV1NQX0NTQl9SRVBPUlRfRElTLA0KPiA+ICAJCQkgICAgIFhF
X1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiA+ICAJfSwNCj4gPiArCXsgWEVfUlRQ
X05BTUUoIlR1bmluZzogVGlsZVkgMngyIFdhbGsiKSwNCj4gPiArCSAgWEVfUlRQX1JVTEVTKEdS
QVBISUNTX1ZFUlNJT05fUkFOR0UoMzUxMCwgWEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRCks
DQo+ID4gKwkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRlcl9vcl9jb21wdXRl
KSksDQo+ID4gKwkgIFhFX1JUUF9BQ1RJT05TKFNFVChURExfVFNMX0NISUNLRU4yLCBUSUxFWV9M
T0NBTElEKSkNCj4gPiArCX0sDQo+ID4gIH07DQo+ID4gIA0KPiA+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHhlX3J0cF9lbnRyeV9zciBscmNfdHVuaW5nc1tdID0gew0KPiA+IC0tIA0KPiA+IDIuMjUu
MQ0KPiA+IA0K
