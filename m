Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6CBC61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097D010F0B2;
	Wed,  2 Sep 2026 08:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cY9xuYmo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556B10E2E9;
 Wed,  2 Sep 2026 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788338999; x=1819874999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3QDsmkDpYa0t4Q7mYYoV5W0ttXInMSFMAG+Jgd6BH1I=;
 b=cY9xuYmotqOhfBB37x8UlxVKOjJzkCrwz7W+pysbz4lgQ7UgmL3rCh0b
 qA896eAXrZinoOyIUhIqemLseBJ8fEIu9fZ/tWxZYES+s0mRN77vpFE7J
 OAx2xuY1HQ6Ia/LSxdwqshSwJZ1PKHVjTWQlLzLANnnCKH2rqXRWTr2k+
 3aW2MHK5j30ZZnmZXywv2QikBljuLgxl3UhQEn6EMYPcQ4Gxt1KRMpMn0
 txR5964FC8EcMA3+gQbyr0J4u1IXqOVE7ZUmVnAEHvFbzYAYF7fZJj/Oc
 /PWz+XaiXLZHLDwNbTMXuhC5Ii1GZqvWzEgC6f7w8GAVRAjxzkVO42WiA A==;
X-CSE-ConnectionGUID: QFU+gBUoQxCLU1vroKLk+Q==
X-CSE-MsgGUID: H5MhqAXDShCm3TO7K+hR9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87927523"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="87927523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:49:58 -0700
X-CSE-ConnectionGUID: /d9rpNmVS16Nk+syOK5wgg==
X-CSE-MsgGUID: 3zW0inPMT5y3U0JMVbphbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="292857064"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:49:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:49:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 01:49:55 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1rmEpuNQZ6Skx34lyq3A/zj3G4TRuZcriDh9sqBnmofZH8PYzpEpCWI7B7Pp8Ts/C70PwIy9jFLqOTy5fcLknHLe4rOKIZVsI4hQHP6Uln/Pfc0lNzFuUtDrq++rmDxpsC8PuFSRAwtvIqRn41kgqRP21JyyThnMq2ouhL7EZ/eTvPWtT5x/LP4EPeyZvbMjZ1vhEAcFmdGziEqLfid7+La6pjOCwbrPeVMKjakHPhwEip06rBC9NiMmEWJ85j4wsRH799eXCTaw5XNdGxsUEV5rZgon0XF1COM5C3lCi0cNNG88uIiYpQAE2vJIXKJyh1/1qiZzhiU+2KYrfhm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QDsmkDpYa0t4Q7mYYoV5W0ttXInMSFMAG+Jgd6BH1I=;
 b=twzIgode6ZECPVn5AgqwNx747k1t2oBA4d5OzQaCn2Ik0CUVTPJ6oWbeEmXInNJXxWoN8gBlULj0ixPpz7hcggkk4YltJRuUUbIQo38YmILy5Tsw0M2hM3DwuqNrKB/1hg7CpUtBhSG1c1jv9tgpJYI0I6XoSHY+vkGReO8FVHdBkoUGMTyGIYrS0kuoYBV3v+v5SScZLIXlrYYSbDa/xn6w9GlsBB/pyDgGI27VtPmama8yLukS74b97miSg3NZN2kFQlei5ykO8aXVhPZWE7ARuWbFuJ63dUnBZqtAm1/FqqUYrsSpAY9i5bYxa4Qw3OrDUHCF2RoNBNL5mB2GkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM3PR11MB8736.namprd11.prod.outlook.com (2603:10b6:0:47::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 08:49:53 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:49:49 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 09/15] drm/i915/alpm: Modify LFPS cycle count for DP
 ALPM
Thread-Topic: [PATCH v5 09/15] drm/i915/alpm: Modify LFPS cycle count for DP
 ALPM
Thread-Index: AQHdNFm1Htoq3LEWC0WcGYmuBNUuYLa7B1EA
Date: Wed, 2 Sep 2026 08:49:49 +0000
Message-ID: <60d7c6741216f3f0686826a5a24cbb8abe479776.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-10-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-10-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM3PR11MB8736:EE_
x-ms-office365-filtering-correlation-id: 628896f2-6253-492b-1b1d-08df08cf25be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: /pYVa+dduIf1coGiVcHedYQlcl1AYG7FhKTkOHmZLg2D3QwALXistyA/hTdcUHBYxe8bw1FUiY3phU1ZOse7klFJRBEz2n9br3tsAIRf56qvU3nSh4Hoys0l6uDNV1AAMklsaMC2Zy7A9CsVnnnpkyTjmQ8cxhptz/xG42cvMNTbI1cBHoc24Sp5LWa1ITQlaG6S+Ll7zJ+VLDgqpBth3d8IB4IlLCw1VtkajEAjDOqts/yuxWKEQ+eapAfZaFrSZfMwrii99yE1KYF225fruNN2XnYN9qoi+YYr5KtUb1V2uGNSz7U9WyVwlFM4tZjGdGnc+jPZm6AX04RXuBZTgmaBXU2tj9vFY25bw2RHLidOqxlnLdbtEyBQ/HI9uvpzMkuJiTP9FLOG7MrJMHLcOqqNHGR08J8/xLziM63jZF3CJV9jgw/9oq3X85mgNsjuSZh0V1FhyHKQPIvTRLtkSC34RoavfVz4tOlwgHzcnXdjyPpSLvyYjLjWJ4VBfVWBUOphzNgW2q1ZK3F3a32uNHzERH2aSa4FVN5pQx1ZH35zZUVq2L8Zu5hF7SF1V23CpSLpMwha2LpRGCjN+kivGMEJe3JYUMM/EHxJDH6QZHD/tZC7yPO2SThYcyww8tSD7olrON5TOevV1/k5DZyK8frWpVBq2U//c0WXv0LmXJ/2/wsLyieCRYR86eDK7qs1rNHDpTTcTKx7bJFLS5HbWYyKteqfUQR87YwE8XU2J7I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmZyZ25ZT1QzZmtVVlg1Ynh3TytmbDU0cnUzN0loMlVoVzZyK0VWaVk1SFhH?=
 =?utf-8?B?L1NqVjlGdDRhWHkwTkM3OEhrNlp0aS9kUklNRmduNlNRY21GakpLU0ZTb0hC?=
 =?utf-8?B?VDJPQ3FoTWhpaDZYaDlJTXFRT0NhbkJBQlB6ZGZZTUFCTlhpdUFaRmVDUWli?=
 =?utf-8?B?M3cxZUQ4bmw0MEFnYUxRM0ZCZXRUd3Q5dURMc0hLN2JmV04yQlRicFJna2Uz?=
 =?utf-8?B?NXlsc0lJSVBJcXR4TDlxMXllZ1ppTUNPZmRod1BBN0RPVlRVeWVLSnl0ZEFs?=
 =?utf-8?B?Q2IyZHB6b1pNbjhHc0VpaUc1L0FVOThwTGhQcGJIZ01KeE0xc2tsRWxtU0d3?=
 =?utf-8?B?Vno2eWtNTHRzNFRUaThrbFU2WVRPS2h2eFBRT1BhaktSQjBLcCt6NWJCbzY4?=
 =?utf-8?B?Y1NwNmNqNDc2aXpQZEZucnBQMkwxOW5UN21LbmI2Uk9meWhHY2pqUXd1aUxt?=
 =?utf-8?B?SmFqaFkybFJaL0FicExBUk52RWlXazUyb0cyUjlpL3MrdGh6dnE3eFEwdGtY?=
 =?utf-8?B?UjZoRTRyUTNzMDBZc3pmRDhMcEt4SVZWZ1VHOURoZ3o1cWc4b3FTSEhGOVJW?=
 =?utf-8?B?NjAwbFlCdHRyc3FaQjJBc2J3aWJsbEF3UkdPcWh4cTMyaEpOOEJlMThTRnhx?=
 =?utf-8?B?NnhmNW92SXBvM3NrRXJjMUM2a21FL3M0aGpMdk9TTFBpa3V5STJyYTlraTk5?=
 =?utf-8?B?YVVRbjl6dWtPOTZ2K3FESWJwT3dxYU1ZSUErc3ZqRFlVbVF4ekxkcDBaUjNL?=
 =?utf-8?B?aGlnVStnd05WVk1hR0lqdU01QUsvSXhqazhSMGRxckRNVnBYQU5KeEFTdlo0?=
 =?utf-8?B?bXk2eXRNV0lTTWgrbEpNR0FydVhoZlVKZFJLQ0hHQnM4dDA4YkUwLzlqVkps?=
 =?utf-8?B?QXJEcHpLM2s3SFVjb0t4QTUyT0tVNjgzcjlHVUF3NEwwbXNxaGNNYk5sdEJi?=
 =?utf-8?B?UEdvVHVGM2JHVC9nT0w0cUkyTUFvRVZqSktkUkxaRTBxMkJmSnNOVy94aXNz?=
 =?utf-8?B?UFN6N1g5eXI2ZXRRQldGTElBY25EYU1GMUdYRm5wQmRvOU5TS3k4SkhGanNB?=
 =?utf-8?B?aWk1aUFkZkdJTGZWL1hqZE1pRWg4NSt2QkhIN2tZRFRSL1Z4b0toKytxbWND?=
 =?utf-8?B?ZmpkaXJ2V1IydXhiYldqWTBtdUtPaEltQVFMTHBRZTlhVGloa0MrSGs0NVR3?=
 =?utf-8?B?cTZ1bjI1L3luQndOS1U5ZVNJeENVcnlxQlBoOTEwdFVsdHJQY1loOUtGa3lQ?=
 =?utf-8?B?WnpkcHBzU2xrNUtXb0Mxc0xxeFBSK2VIK1JvUFpFU2FmOEpPZ21FOWFOMzVJ?=
 =?utf-8?B?QVQyRTE1R2xTM1RvUTBLVUZDMTdYcWpwYkFwd3FMc0xVdG5pMU03MGQ1cU90?=
 =?utf-8?B?REtLWlBkWk41NmlIV0kzdlZ1cURZODAxZ3VvUDJqNVcxZkcrYThvR1NYUHlY?=
 =?utf-8?B?T0ZraW0xdXJ5RVA1MW44OC9LcFlUV2hGeWtYcFRJb01yUHZJdDc4N2txUWZG?=
 =?utf-8?B?RzBPRlhCSFFocGxFMkZQM202ZmFoWXlLTXhlRS9YQW9KaXFjOWRqTTlKSXR4?=
 =?utf-8?B?ejY4NDgrczR3aDFxYy90MVhQTUgrZ2x3SUt4NDA2SnY2R2pWYVF4dWE1Z1NU?=
 =?utf-8?B?UUJwdm9obWVRc21WdW9XdWZzMTJDQVlDL3JEOEhsS25GTm5FZitxNmZmaGZn?=
 =?utf-8?B?UDMzMUs2V1RFRjh1Z0tkVXZZTU5PLzRpeU1CS3czTWQ3clJwVi9objhDS2lF?=
 =?utf-8?B?NTlPaWRZWm9CSGhlcnN4czBOM0Y2R1ZsdThHMVZ6RGhicThCQUxvdHlXSElC?=
 =?utf-8?B?aUpqdUE1RktRUkNaSFhmaW9hRU8wTS9teC9BSDQ3dTFVd212ZjVIdXlkV2s3?=
 =?utf-8?B?MStuelh0ckpNS2lRNnNxZDVyQjhPMitmMTJEY29vRmF3WEpBRUNHaDU5S09W?=
 =?utf-8?B?d3FhL0hoRXJBRGZxTnRiOUhreWgybTZKSitZaVFjcy9oT0E5UGZnSXd6OG9M?=
 =?utf-8?B?dHdxb1h3U3c4RGZ1S3FlSm5uTmRuQnpQTks5bG41Sjdoell4SVdPY0JCT29B?=
 =?utf-8?B?QXppUGJtZk4rMWZ2VTV4T0xDRDQwN3lYUWthaWpkbFhuWUhCRmVmNy9DN2VS?=
 =?utf-8?B?SFpZRHdYWUErYnZ0MEJxVnU3d1pLOXpiSjBrRVkyU0VXV2xXRmFnSlBBZnZa?=
 =?utf-8?B?aTJBL2xBeUVpTDA3NnZnWW1WZld6MmVpNzVGVElnNmEvSFJSL253RlozVnlB?=
 =?utf-8?B?L0ZlU2xYZHhQeEwwUGRtUTdmWDR5ZlZ3M2hkOXo3SEFwNWdrYWxGbVZaRDR2?=
 =?utf-8?B?U3o2UGNvakNtbkNud3ZCV3NBRGpIdDhPeXhzeHlLeWc3eTE4SFVLc0UvYllO?=
 =?utf-8?Q?TG9VxhX8aLZmLfRk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D3550DEE9969C4D94DE9AC8E46A8FA9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tO/iFxZfJeLZm/ouiV97GkvMtiStiZrgMS+E59zrjSV3CUuz05Bm8O2eLjyNVn7OVCSaJRHu+UTNvpJDB9InwpqKrs7xwF3QN9QxxCHyy+IxGej+T/9DsSpfZ3QJ9iKnn2y3Cu74WOJpkl6bvABHIf6siW6glbnZFZzw20K4JOSomilqWy27R0rpO7XeFpElMVpIegVPdM723ws/BYymsJ7G5oDjCNjDWssMEx6hugKZ+A7H3oZNzf2qo2aICGsBbeB8Ncu8O1zHt9KuJFSU9KBEt3eeSu3gc9gkBx8k7sAc0Aa9lsOEdto+yHykPcTCxotU1wguwm8eZQfkwbIRvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628896f2-6253-492b-1b1d-08df08cf25be
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:49:49.3958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTF0U4qywS/Smklu6rFl5xeRBQRaudcW3ax/yVuNkRt41jK/sWYCF7NhbxsFZZellHN2Akr+e4sUNVohpHQzM5H5GrRnNFJXSJBPBCGZWgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8736
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBGb3IgRFAgbWluaW11bSBMRlBTIGNvdW50IGlzIHNldCB0byBtaW5pbXVtIDE2Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKg
wqAgfCAyOA0KPiArKysrKysrKysrKysrKysrKy0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3JfcmVncy5oIHzCoCAyICsrDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gaW5kZXggOThhYTQxOGE2ZmY3Li44OTBiZjI0
ODg1NTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YWxwbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5j
DQo+IEBAIC0yNCw3ICsyNCw4IEBADQo+IMKgCQkJCShTSUxFTkNFX1BFUklPRF9NQVhfVElNRSAt
CVwNCj4gwqAJCQkJIFNJTEVOQ0VfUEVSSU9EX01JTl9USU1FKSAvIDIpDQo+IMKgDQo+IC0jZGVm
aW5lIExGUFNfQ1lDTEVfQ09VTlQgMTANCj4gKyNkZWZpbmUgTEZQU19DWUNMRV9DT1VOVAkxMA0K
PiArI2RlZmluZSBMRlBTX0NZQ0xFX0NPVU5UX0RQCTE2DQo+IMKgDQo+IMKgYm9vbCBpbnRlbF9h
bHBtX2F1eF93YWtlX3N1cHBvcnRlZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiDCoHsN
Cj4gQEAgLTEwNSwxMCArMTA2LDIyIEBAIHN0YXRpYyBpbnQgZ2V0X2xmcHNfY3ljbGVfdGltZShj
b25zdCBzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkNCj4gwqAJcmV0dXJu
IHRsZnBzX2N5Y2xlX21pbiArwqAgKHRsZnBzX2N5Y2xlX21heCAtDQo+IHRsZnBzX2N5Y2xlX21p
bikgLyAyOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyBpbnQgZ2V0X2xmcHNfY3ljbGVfY291bnQo
Y29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+ICt7DQo+ICsJ
c3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiB0b19pbnRlbF9kaXNwbGF5KGNydGNf
c3RhdGUpOw0KPiArDQo+ICsJLyogRXh0ZXJuYWwgRFAgb24gWGUzbHBkKyB1c2VzIGEgbWluaW11
bSBvZiAxNiBMRlBTIGN5Y2xlcy4NCj4gKi8NCj4gKwlpZiAoIWludGVsX2NydGNfaGFzX3R5cGUo
Y3J0Y19zdGF0ZSwgSU5URUxfT1VUUFVUX0VEUCkgJiYNCj4gKwnCoMKgwqAgRElTUExBWV9WRVIo
ZGlzcGxheSkgPj0gMzUpDQo+ICsJCXJldHVybiBMRlBTX0NZQ0xFX0NPVU5UX0RQOw0KDQpJIHRo
aW5rIGl0IGlzIGVub3VnaCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gZURQIGFuZCBEUC4gTm8g
bmVlZCB0bw0KY2hlY2sgZGlzcGxheSB2ZXJzaW9uLg0KDQo+ICsNCj4gKwlyZXR1cm4gTEZQU19D
WUNMRV9DT1VOVDsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyBpbnQgZ2V0X2xmcHNfaGFsZl9jeWNs
ZV9jbG9ja3MoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+
IMKgew0KPiDCoAlyZXR1cm4gZ2V0X2xmcHNfY3ljbGVfdGltZShjcnRjX3N0YXRlKSAqIGNydGNf
c3RhdGUtDQo+ID5wb3J0X2Nsb2NrIC8gMTAwMCAvDQo+IC0JCTEwMDAgLyAoMiAqIExGUFNfQ1lD
TEVfQ09VTlQpOw0KPiArCQkxMDAwIC8gKDIgKiBnZXRfbGZwc19jeWNsZV9jb3VudChjcnRjX3N0
YXRlKSk7DQo+IMKgfQ0KPiDCoA0KPiDCoCNkZWZpbmUgTUxfUEhZX0xPQ0tfTEVOCQkyNTINCj4g
QEAgLTYyMiwxMiArNjM1LDIxIEBAIHZvaWQgaW50ZWxfYWxwbV9wb3J0X2NvbmZpZ3VyZShzdHJ1
Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLA0KPiDCoAkJcmV0dXJuOw0KPiDCoA0KPiDCoAlpZiAo
aW50ZWxfYWxwbV9pc19hbHBtX2F1eF9sZXNzKGludGVsX2RwLCBjcnRjX3N0YXRlKSkgew0KPiAr
CQlpbnQgbGZwc19jeWNsZSA9IGdldF9sZnBzX2N5Y2xlX2NvdW50KGNydGNfc3RhdGUpOw0KPiAr
CQl1MzIgbGZwc19jeWNsZV92YWw7DQo+ICsNCj4gKwkJaWYgKGludGVsX2NydGNfaGFzX3R5cGUo
Y3J0Y19zdGF0ZSwNCj4gSU5URUxfT1VUUFVUX0VEUCkpDQoNCkhlcmUgdGhlIGRpZmZlcmVuY2Ug
aXMgZGVwZW5kZW50IG9uIGRpc3BsYXkgdmVyc2lvbi4gQWxzbyBzcGxpdCB0aGlzIGFzDQphIHNl
cGFyYXRlIHBhdGNoLg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+ICsJCQlsZnBzX2N5Y2xl
X3ZhbCA9DQo+IFBPUlRfQUxQTV9MRlBTX0NUTF9MRlBTX0NZQ0xFX0NPVU5UKGxmcHNfY3ljbGUp
Ow0KPiArCQllbHNlDQo+ICsJCQlsZnBzX2N5Y2xlX3ZhbCA9DQo+IFBPUlRfQUxQTV9MRlBTX0NU
TF9MRlBTX0NZQ0xFX0NPVU5UX1hFM0xQRChsZnBzX2N5Y2xlKTsNCj4gKw0KPiDCoAkJYWxwbV9j
dGxfdmFsID0gUE9SVF9BTFBNX0NUTF9BTFBNX0FVWF9MRVNTX0VOQUJMRSB8DQo+IMKgCQkJUE9S
VF9BTFBNX0NUTF9NQVhfUEhZX1NXSU5HX1NFVFVQKDE1KSB8DQo+IMKgCQkJUE9SVF9BTFBNX0NU
TF9NQVhfUEhZX1NXSU5HX0hPTEQoMCkgfA0KPiDCoAkJCVBPUlRfQUxQTV9DVExfU0lMRU5DRV9Q
RVJJT0QoDQo+IMKgCQkJCWNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLnNpbGVuY2VfcGVyaW9k
X3N5bV9jbG9ja3MpOw0KPiAtCQlsZnBzX2N0bF92YWwgPQ0KPiBQT1JUX0FMUE1fTEZQU19DVExf
TEZQU19DWUNMRV9DT1VOVChMRlBTX0NZQ0xFX0NPVU5UKSB8DQo+ICsNCj4gKwkJbGZwc19jdGxf
dmFsID0gbGZwc19jeWNsZV92YWwgfA0KPiDCoAkJCVBPUlRfQUxQTV9MRlBTX0NUTF9MRlBTX0hB
TEZfQ1lDTEVfRFVSQVRJT04oDQo+IMKgCQkJCWNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmxm
cHNfaGFsZl9jeWNsZV9udW1fb2Zfc3ltcykgfA0KPiDCoAkJCVBPUlRfQUxQTV9MRlBTX0NUTF9G
SVJTVF9MRlBTX0hBTEZfQ1lDTEVfRFVSDQo+IEFUSU9OKA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3JfcmVncy5oDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3JfcmVncy5oDQo+IGluZGV4IDhlYzk5YmJkODRiNi4u
ZDMzZTliMGE4MWQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Bzcl9yZWdzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3JfcmVncy5oDQo+IEBAIC0zMzMsOCArMzMzLDEwIEBADQo+IMKgI2RlZmluZQ0KPiBQ
T1JUX0FMUE1fTEZQU19DVEwocG9ydCkJCQkJX01NSU9fUE9SVChwb3J0LCBfUE9SVF9BTFBNX0xG
UFNfQ1RMX0EsIF9QT1JUX0FMUE1fTEZQU19DVExfQikNCj4gwqAjZGVmaW5lwqANCj4gUE9SVF9B
TFBNX0xGUFNfQ1RMX0xGUFNfU1RBUlRfUE9MQVJJVFkJCQlSRUdfQklUKDMxKQ0KPiDCoCNkZWZp
bmXCoA0KPiBQT1JUX0FMUE1fTEZQU19DVExfTEZQU19DWUNMRV9DT1VOVF9NQVNLCQlSRUdfR0VO
TUFTSygyNywgMjQpDQo+ICsjZGVmaW5lwqANCj4gUE9SVF9BTFBNX0xGUFNfQ1RMX0xGUFNfQ1lD
TEVfQ09VTlRfTUFTS19YRTNMUEQJUkVHX0dFTk1BU0soMzAsIDI0KQ0KPiDCoCNkZWZpbmXCoCBQ
T1JUX0FMUE1fTEZQU19DVExfTEZQU19DWUNMRV9DT1VOVF9NSU4JCTcNCj4gwqAjZGVmaW5lwqAN
Cj4gUE9SVF9BTFBNX0xGUFNfQ1RMX0xGUFNfQ1lDTEVfQ09VTlQodmFsKQkJUkVHX0ZJRUxEX1BS
RVAoUE9SVF9BTFBNX0xGUFNfQ1RMX0xGUFNfQ1lDTEVfQ09VTlRfTUFTSywodmFsKS1QT1JUX0FM
UE1fTEZQU19DVExfTEZQU19DWUNMRV9DT1VOVF9NSU4pDQo+ICsjZGVmaW5lwqANCj4gUE9SVF9B
TFBNX0xGUFNfQ1RMX0xGUFNfQ1lDTEVfQ09VTlRfWEUzTFBEKHZhbCkJUkVHX0ZJRUxEX1BSRVAo
UE9SVF9BTFBNX0xGUFNfQ1RMX0xGUFNfQ1lDTEVfQ09VTlRfTUFTS19YRTNMUEQsKHZhbCktUE9S
VF9BTFBNX0xGUFNfQ1RMX0xGUFNfQ1lDTEVfQ09VTlRfTUlOKQ0KPiDCoCNkZWZpbmXCoA0KPiBQ
T1JUX0FMUE1fTEZQU19DVExfTEZQU19IQUxGX0NZQ0xFX0RVUkFUSU9OX01BU0sJUkVHX0dFTk1B
U0soMjAsIDE2KQ0KPiDCoCNkZWZpbmXCoA0KPiBQT1JUX0FMUE1fTEZQU19DVExfTEZQU19IQUxG
X0NZQ0xFX0RVUkFUSU9OKHZhbCkJUkVHX0ZJRUxEX1BSRVAoUE9SVF9BTFBNX0xGUFNfQ1RMX0xG
UFNfSEFMRl9DWUNMRV9EVVJBVElPTl9NQVNLLHZhbCkNCj4gwqAjZGVmaW5lwqANCj4gUE9SVF9B
TFBNX0xGUFNfQ1RMX0ZJUlNUX0xGUFNfSEFMRl9DWUNMRV9EVVJBVElPTl9NQVNLCVJFR19HRU5N
QVNLKDEyDQo+ICwgOCkNCg0K
