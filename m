Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC48C79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EF910E9D8;
	Tue,  8 Sep 2026 06:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMp3snD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6308E10E9D7;
 Tue,  8 Sep 2026 06:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788848397; x=1820384397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bJzy8PBM/xGPXxQMoQpQOLAhZwcmiWwXNkQUQnlCpxc=;
 b=eMp3snD4CdXDaqWhknMD5CfZF2oxwBZqJaBWcIbXg8NxduLD4xs18TZf
 133X+UdvqgJdEitp13/gcubKCKKsVI6A6xJTza7f/iHosynbOWMJxp2t7
 Kdl7BnOpQSrqVDlUyYvZ2HCF5FL8LtH5l3w1VMG9aUCDLHkbwaAt6CDHb
 yaUTzfeSTcsJ23nptkxcllgHKmlH0CVArdbGlY9wLEYnuwfrqdr7NtwB+
 Fzlny/4SObrT0WKIOlWVBCR0H9qISb/wmYGIBRRVtLvfrmkFrabCGHzl3
 kxbuugS0WvLjQkGPX6CblFyFpQ8ZH/K2i2Q1Go6mImXjj74Nj/jKh42ST g==;
X-CSE-ConnectionGUID: R5jQ21rbTIuxapv9aA5GqQ==
X-CSE-MsgGUID: MGWDkp/cRFCk0B5hwQFtSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100399534"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="100399534"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:19:57 -0700
X-CSE-ConnectionGUID: xmLUuTEQTDm6RA0LDEApLw==
X-CSE-MsgGUID: sxmfl1WcRTKiPxXmn4g66Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269573806"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:19:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:19:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:19:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5t/kCiImOXK4LybEpunBa0+g4McRI6R0jj9Y4K4uaXNNk5A83zkw68EDUPX3i96zPtNlMIZGh/6suhPszoruaGYvne91+iK3WuAGj3//ls7AYk4JjkHZDDQyAb9xHhrMrRAaRRbt84GybonjCiONk+lZzZ/VTKJRaWPJ5DVvjHrIy4HjdU9sANMr8I9MqsEcxYnnN79K+I3PfUs5hXAH7dkhKegnDrSHkQQuRkalJjUAmAT0rjGyOIUrfLaaDk8o1i3OHqsSWCM/z84Shd+YjyGBhoMEIeREVKJUCRvQrL4dmAPL8ah/+SOZQjfxNxR4J+wifYB1zHj4gSNh7uWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJzy8PBM/xGPXxQMoQpQOLAhZwcmiWwXNkQUQnlCpxc=;
 b=BiAauA3hTSoE0l+5byQaTpyJtFEBWx5gFRnyPcUvK/pjZKaWhhXMm3e7JwNWCChkwWO/ddMW/y6Ms88AnWGNtSLCfF9eJFS7QcuxS1N2MoGc+0vJ859KuscglIdX9MbACOZpkKOWBfKzhcAa8/Wa0qT0S9UT3YqZsJL+gLgHu79NhDhRS6KSOj9vSfHrE1nqsFSe2iUnt1uXmstfY9nFHnL4Uw6meDXbSDdr1GnDh1sOQikru2Ugf30TmqVREfUlo0cPXk+BecCrIodVU+ZHqt/CzoS7sd/sfdKnlRLMZlDb55RBvdDbvkSD19nlrTmLyEpndW8QQalYwsGFk83Ubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 LV4PR11MB9467.namprd11.prod.outlook.com (2603:10b6:408:2d8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Tue, 8 Sep 2026 06:19:54 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:19:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Govindapillai,
 Vinod" <vinod.govindapillai@intel.com>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime
 pm routines
Thread-Topic: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime
 pm routines
Thread-Index: AQHdO3sIa9bSrtxLukitY7PYPZ/wwLa+MkmAgAYK3gA=
Date: Tue, 8 Sep 2026 06:19:53 +0000
Message-ID: <83e32e6c3fafdc6a5da34593718a8a403ccd3695.camel@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-6-vinod.govindapillai@intel.com>
 <f5e074540e36b2c9fee11a9bfd14beabcc8cf016@intel.com>
In-Reply-To: <f5e074540e36b2c9fee11a9bfd14beabcc8cf016@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|LV4PR11MB9467:EE_
x-ms-office365-filtering-correlation-id: e0ee016f-fa97-43e3-adab-08df0d713273
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|38070700021|6133799003|5023799004|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 4WCPEIE0wy8pUvqAAfRWyx1zEIMX2hD/kUZZyHA6bZEVY+ow4pr8NeC09vSnNJtyBD0a/Hqqc+f07ePz/qjqI41arVtaP0RSWOBwALNYU7pwBMTBYlDCXt8nAVpB7c7vwvIq1kaY/qOVami8zufDrJupNsWyhee434Wn2lpjcJ3N5aWwl4ThX2m2/Mwg0FtKEwFJok5QwZMxMTz8BFlg0mVMukbVN6e/vCiriWQ6+JsMedUDIl9jMjaxbpOlTnvSy1bevCK7GrBEN9KoTqeCjjRQSl+v3ZE8JYWqKIkaHdMMceOuWHEC8xP5U2eapIGSQVPPR4npKHYzo0sUDV/cPrktIImTDonK1Lb7EwMqMJN1v5vy3Hi7FIJDHhGQlxyXhJ77XfwQPVLdjCEJTCVrk2f7RuKuQTguExZmFmbWogBHS6yz/nawh+xvRS8/p6/b/WKE1zkVQMJdQaAreCZ47nZnKbfbr7ALZQl1E9fOADqyXej1j1yrIo/61j2xrn88spNpk+3oOBKdauy5V245eU3MmTtdjJH7HDLJBwIjQdoTGpEvCGhjvTYPNOivmqiHG7qpq9/mF3gFvSjEZqBQTzTBjcfPwEy/fab6HbrHmduhmKTe78fPND3pEmBRqa/79wG8M2ZdWSDAtz862cxjZBucF/36cauj2mg5bBdHJYoFGoOUJgOpFDpRMoBHunuPNnhklvyQLbDTaO/G+fKhj/3+3OejVQEC1eOV0KZ2TQA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(5023799004)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDh3OE1KTUV4TEgycXcyUzRWUC8xc2xub3k0YnhWR2E1eVRTd3BaR1NBK3la?=
 =?utf-8?B?RC9KcW9KcFZqMTh1eUIxWFQ5WFJVaW5qcXgxS3lLZnN0RkFZRlo1YmZmaS80?=
 =?utf-8?B?SDRqTkl2Q1VBSUhxWVl0cjh6Nmg1TFpCS0pMb3BrR3Z6bVluaEJSc0J1RW5N?=
 =?utf-8?B?UmdKRUxpWHlJb29sZDlXNGxuL1loYjUvcXFzRlcreU81NnI4UDV0NW9YcUUy?=
 =?utf-8?B?VC90b2tNNDZUZ0trbmltbGp4OG9Kek5ZOWxzdTg1aXpsTkRUdkFSWWJEa2xQ?=
 =?utf-8?B?aUdUV2RQcisyZVJ4RlZybGYxTGJaeXVsNElPZnUxQ21Lbm94RVhQODZZRk1G?=
 =?utf-8?B?dTVmaFJzRkFUNWJCSTRycjlobmJRQm50dTdwQ1cyYkE5SEtYK0p2SG53TnAy?=
 =?utf-8?B?KzJHYnpvR1hnNjlTNitpbGlvTENCRUhiUXR1d1dMQk80RExCT0ZpUk9PWEFi?=
 =?utf-8?B?RGVEMFFSOTVKYmdTRHVCNXdhZTRMeU5RVk52U0pSS24vZmJpNWlPcU9vRzQ4?=
 =?utf-8?B?WDNsMkR5OURJc0pRVWsrc3lhRlVOS3dlbHBwS0h5UEt0clpUUS9VYmVEM0sz?=
 =?utf-8?B?RnczQWtnemFQaTdDREhUUHRkZFFEazlCU3V5enRHd2l6ODJMdTdHbjh6bnFV?=
 =?utf-8?B?K2gyT3FQcGQzeGdBMS9tV2JXdHJkTzdQUFUvOEJyZG5UOUVha2dJenR0eG9K?=
 =?utf-8?B?MkZua1duaFMyOUZBNkNkeEZEd0R6Uld3eUNsWGNqSExScEQ2WVNNUUZjeFM0?=
 =?utf-8?B?ZUJmdm1xSTZ6bGRlOTBybFh5bWxMUEZEcTVZdG9mK0FWcHRDaDI0Rk05YUR0?=
 =?utf-8?B?L3MxL0FtKzhId216NjFsbzNCU0kwTXNTSFAvYjlLQW5KQmNXNGg3QVJ2Vm9F?=
 =?utf-8?B?U25HV1laT0hnVklYRkJoUXRQY255NTBZeVBLdUZLdEIvYlk2bWNpTXUybDhh?=
 =?utf-8?B?YjIxL2VEOFFHVzNLWko1Y2tabnRWUERRcFExMDQyOUZjWDNIQ25hZURtU2N5?=
 =?utf-8?B?QTFSc3pKak1DbXU2MFJ6SXZwL0xYamlRT3E1NWIyU2cxdFNKN09MZmJZZGlW?=
 =?utf-8?B?YUdiZ0VGZnRHMVZqL2tha3R4WjlCUjRWMzYxeFp3NnVQN1FNRHRWN3hrRk9S?=
 =?utf-8?B?OEhKWXc5a0loN245REgzeGVHMzJxNmQxZmRBeStjQzdqMjJNeDFOUFFnZDNC?=
 =?utf-8?B?aWVDSndoVENRMDc0anpQT0RDQUVDQ1ZTQm1sdlBFMHl4ZXJuSHkwSjZ2OWZ2?=
 =?utf-8?B?ejlxMU5hK2tWZUFnRXhMeXdoaFE0RnFoMm1ycW0xN0dvUjA0c3ZkM3pMSEFz?=
 =?utf-8?B?RGJIbG9TeWlLOFA5NnJaRldRNHVZOG91cHJaZG5zT0NzNXNVS08yQzRjTXR5?=
 =?utf-8?B?U2ZvaUh3RHBLL2REL3pjUEQ5bTNnS0twMW9iektzMGtSVGJBTllSSmlwYUoz?=
 =?utf-8?B?cml3bkZNU0l2U2pUUnV1MFg3allORXVUQjlYTk9wZVlMNC8xb3g5dFVKRm1m?=
 =?utf-8?B?Mng2K3dkRDN0WDdMbDJVYm92NzJZN2FrNlkvSElNY21rOWd1YmFXZHdpcm5B?=
 =?utf-8?B?SDdCTFdVK2NaUzkrTjRncU00Q0gxbDlGRzVNYituSFNZaURTUzR4VTlEQlNi?=
 =?utf-8?B?cjZlZUdiUlZES3NURmRTTjZMSjM0MXhZc1huVW03M2pRMHgwQUhLYy9lVHBs?=
 =?utf-8?B?ck1CQ1d5clJ2ajJXTzgwanhGTlJFZDdlakFGMnV3OGZhQzkwR2hTYmpOL0lD?=
 =?utf-8?B?TW5IYUpiQXAycSttaDJPNnVObkNDTGEzb0dMa2Z4akoxZnBwdHZJVmk1ekVH?=
 =?utf-8?B?R2VMVDg4aFJSajlWZ291aElXLzhVS3JGR3B0WjRRM2xLSitKTVVVL2QwWDA1?=
 =?utf-8?B?SUlTcFNRRG0rL0lmZkx5TVVGT3NIMmdyY2JnWXd4eEhnOXZWK1J2eWk5bHcw?=
 =?utf-8?B?dllyczBsdXR5TWJvRnEwZ0YwRkUwY1FjRU1xK1lMRnIyQkFtNWFsaHVhK2l2?=
 =?utf-8?B?TER6QTVMc0FMV2pnMXBtM2M2TXFPY1NLdTZoR0lxWXdmb1pna0dPZkUycXp2?=
 =?utf-8?B?SmduTjU2ZnZMQlhzY3pnclJVdnFPWkROYWFEdjlIOHhjUk8ycGIwYVFhV0lG?=
 =?utf-8?B?YURwOUx0eDRzbWFnaDE5WEs0ZmV4Mm1CaVVIR2d3dWZsNlpRYmYvNW41YmJt?=
 =?utf-8?B?TmZaMnJuTHA1YWhKanlrbXRDTVRRUXd5dGdVSXc2TG9kcXVEb3k1b0dod0pV?=
 =?utf-8?B?UG5CQldHZ0dHLzY5STZqaWxMQ3d1U0s0RjRkUnhMR1ZCSm8yK2FZY3JHQVVM?=
 =?utf-8?B?VDJWRDBDNkttaWRWSHltZE1ia2kxNDZQY1NWNUVLOXVpK0pQM0Z0cXJNZC9s?=
 =?utf-8?Q?5huwTQtSDjaBlHrc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E6EA86B4D98FA49985BA29C470198DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: otVx/FUZ2Um8guT+lomkPNm86NaztAeVlEqC+nzVC6qsE27utZkVYGekMrffr39nQDt/Y8lUFslCTLeS2+BhemTevrTR4FjyBI73Flep62F2z6yJJbyNnz7FvZzTnMSWMVlSmMXR725F0pQ+gWAIPPgyvPh5UsBZoX0qga7wH/mDYrl1aHGfQg2FefyQicxeLoGSD+gIuHUyb7s1XbesjTKiy+++dkE67h/y/egue5p1nvIIZT46ispE3Ytgbyz5u1GV3Y+0k67fOqLTq8HFJVWCKukpk4rfKSW8vWGp1qzIG/ZVELM0lZuvJLJq2/7r8HmN6vhXiETLoenonAvRmA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ee016f-fa97-43e3-adab-08df0d713273
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 06:19:53.8235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ju9TnaRxIXNvqywIjMSy44ixenFpX4aSMWl1g9klcPdFbbvFGpBi5KySN/beKhjPgY+0dkGZl3nj18yyiKVTXbKk0nd+plMMBUQo/K9MsA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9467
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

T24gRnJpLCAyMDI2LTA5LTA0IGF0IDEzOjAzICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVGh1LCAwMyBTZXAgMjAyNiwgVmlub2QgR292aW5kYXBpbGxhaQ0KPiA8dmlub2QuZ292aW5k
YXBpbGxhaUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IER1cmluZyB0aGUgcnVudGltZSBzdXNwZW5k
LCBjaGVjayBpZiBkZXZpY2UgaXMgY2FwYWJsZSBvZiB3YWtldXANCj4gPiBmcm9tIFBNRS4gSWYg
eWVzIHVwZGF0ZSB0aGUgaGVscGVyIHNvIHRoYXQgSVJRIHJlc2V0IGFuZCBIUEQNCj4gPiBwb2xs
aW5nIGNhbiBiZSBoYW5kbGVkIGFjY29yZGluZ2x5LiBGb3IgUE1FIGNhcGFibGUgZGV2aWNlcywN
Cj4gPiBIUEQgcmVsYXRlZCBJUlFzIGFyZSBub3QgcmVzZXQgZHVyaW5nIHJ1bnRpbWUgc3VzcGVu
ZCBhbmQNCj4gPiBkbyBub3Qgc3RhcnQgcG9sbGluZyBmb3IgSFBEcyBldmVyeSAxMHMuIEluc3Rl
YWQgUE1FIGNhbiBiZQ0KPiA+IGdlbmVyYXRlZCBmcm9tIEhQRHMgYW5kIGNvcnJlc3BvbmRpbmcg
cnVudGltZSByZXN1bWUgY2FsbHMNCj4gPiBjYW4gYmUgaW52b2tlZCBieSBQTUUuDQo+ID4gDQo+
ID4gQnNwZWM6IDUyOTc5LCA1Mjk4MCwgNjg4NTcsIDY4ODY3LCA2ODk3MA0KPiA+IEFzc2lzdGVk
LWJ5OiBHaXRIdWJfQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+ID4gU2lnbmVkLW9mZi1ieTogVmlu
b2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMgfCAxMCArKysr
KysrKysrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmggfMKg
IDQgKysrKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTYgKysrKysrKysrKysrKysrLQ0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAy
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gaW5kZXggN2IyNWMwODE0Njc0Li5mZjRh
NzRjNWM3NjMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZGlzcGxheS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxh
eS5jDQo+ID4gQEAgLTIzNiw2ICsyMzYsMTYgQEAgdm9pZCB4ZV9kaXNwbGF5X2lycV9wb3N0aW5z
dGFsbChzdHJ1Y3QNCj4gPiB4ZV9kZXZpY2UgKnhlKQ0KPiA+IMKgCWludGVsX2Rpc3BsYXlfaXJx
X3Bvc3RpbnN0YWxsKGRpc3BsYXkpOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gK3ZvaWQgeGVfZGlz
cGxheV9zZXRfcG1lX2NhcGFibGUoc3RydWN0IHhlX2RldmljZSAqeGUsIGJvb2wNCj4gPiBwbWVf
ZnJvbV9ocGQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0g
eGUtPmRpc3BsYXk7DQo+ID4gKw0KPiA+ICsJaWYgKCF4ZS0+aW5mby5wcm9iZV9kaXNwbGF5KQ0K
PiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwlpbnRlbF9ocGRfc2V0X3BtZV9jYXBhYmxlKGRp
c3BsYXksIHBtZV9mcm9tX2hwZCk7DQo+IA0KPiBUaGUgZG93bnNpZGUgd2l0aCB0aGlzIGlzIHRo
YXQgSSd2ZSBiZWVuIHRyeWluZyBoYXJkIHRvICpyZWR1Y2UqIHRoZQ0KPiBudW1iZXIgb2YgZGly
ZWN0IGxvdy1sZXZlbCBjYWxscyBmcm9tIGk5MTUgYW5kIHhlIGNvcmUgdG8gZGlzcGxheS4NCj4g
DQo+IFRoZXJlIGFyZSAxMDArIGNhbGxzIGFscmVhZHkuIElNTyB3ZSBuZWVkIHRvIGRyb3AgdGhl
bSB0byB0aGUNCj4gYmFsbHBhcmsNCj4gb2YgbGVzcyB0aGFuIGhhbGYuDQo+IA0KPiBUaGlzIHdv
dWxkIGdvIGRpcmVjdGx5IHRvIGEgVE9ETyBsaXN0IG9mIHRoaW5ncyB0byByZWZhY3RvciBhbmQg
Y2xlYW4NCj4gdXAuDQo+IA0KPiBGZWVscyBsaWtlIGl0IHdvdWxkIGJlIG1vcmUgY2xlYW4gd2l0
aCBhIHBhcmVudCBpbnRlcmZhY2UgZm9yIHRoZQ0KPiBkaXNwbGF5IHRvIGFzayBpZiBwbWUgaXMg
YXZhaWxhYmxlLCB3aGVuIG5lZWRlZCwgZXZlbiB0aG91Z2ggdGhlDQo+IHBhcmVudA0KPiBpbnRl
cmZhY2UgaXMgYWxzbyB0b28gYmlnLi4uDQoNCldvdWxkIGl0IGJlIG9rIHRvIHNvbHZlIHRoaXMg
YnkgZG9pbmcgYWxsIHRoaXMgaW4gZGlzcGxheSBydW50aW1lDQpjYWxsYmFja3M/DQoNClBvc3Np
YmxlIGQzY29sZCBlbnRyeSBjb3VsZCBiZSBmb3VuZCBvdXQgYnkgdXNpbmcgcGNpX3RhcmdldF9z
dGF0ZS4NCg0KSXMgaXQgb2sgdG8gYWNjZXMgcGNpIGRldmljZSAocGNpX2VuYWJsZV93YWtlIGFu
ZCBwY2lfdGFyZ2V0X3N0YXRlKSBpbg0KZGlzcGxheSBwbSBydW50aW1lIGNhbGxiYWNrcy4NCg0K
QlIsDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gQlIsDQo+IEphbmkuDQo+IA0KPiANCj4gDQo+
ID4gK30NCj4gPiArDQo+ID4gwqBzdGF0aWMgYm9vbCBzdXNwZW5kX3RvX2lkbGUodm9pZCkNCj4g
PiDCoHsNCj4gPiDCoCNpZiBJU19FTkFCTEVEKENPTkZJR19BQ1BJX1NMRUVQKQ0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmgNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuaA0KPiA+IGluZGV4IDBiYWJiNTBi
ZmM3Ny4uYTc3YThmYTFkODAyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9k
aXNwbGF5L3hlX2Rpc3BsYXkuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5
L3hlX2Rpc3BsYXkuaA0KPiA+IEBAIC0zNyw2ICszNyw4IEBAIHZvaWQgeGVfZGlzcGxheV9pcnFf
ZW5hYmxlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+IHUzMiBndV9taXNjX2lpcik7DQo+ID4g
wqB2b2lkIHhlX2Rpc3BsYXlfaXJxX3Jlc2V0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiDC
oHZvaWQgeGVfZGlzcGxheV9pcnFfcG9zdGluc3RhbGwoc3RydWN0IHhlX2RldmljZSAqeGUpOw0K
PiA+IMKgDQo+ID4gK3ZvaWQgeGVfZGlzcGxheV9zZXRfcG1lX2NhcGFibGUoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIGJvb2wNCj4gPiBwbWVfZnJvbV9ocGQpOw0KPiA+ICsNCj4gPiDCoHZvaWQgeGVf
ZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiDCoHZvaWQgeGVf
ZGlzcGxheV9wbV9zdXNwZW5kX2xhdGUoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IMKgdm9p
ZCB4ZV9kaXNwbGF5X3BtX3Jlc3VtZV9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4g
QEAgLTc1LDYgKzc3LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfaXJxX2VuYWJs
ZShzdHJ1Y3QNCj4gPiB4ZV9kZXZpY2UgKnhlLCB1MzIgZ3VfbWlzY19paXIpDQo+ID4gwqBzdGF0
aWMgaW5saW5lIHZvaWQgeGVfZGlzcGxheV9pcnFfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUp
IHt9DQo+ID4gwqBzdGF0aWMgaW5saW5lIHZvaWQgeGVfZGlzcGxheV9pcnFfcG9zdGluc3RhbGwo
c3RydWN0IHhlX2RldmljZQ0KPiA+ICp4ZSkge30NCj4gPiDCoA0KPiA+ICtzdGF0aWMgaW5saW5l
IHZvaWQgeGVfZGlzcGxheV9zZXRfcG1lX2NhcGFibGUoc3RydWN0IHhlX2RldmljZQ0KPiA+ICp4
ZSwgYm9vbCBwbWVfZnJvbV9ocGQpIHt9DQo+ID4gKw0KPiA+IMKgc3RhdGljIGlubGluZSB2b2lk
IHhlX2Rpc3BsYXlfcG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkge30NCj4gPiDCoHN0
YXRpYyBpbmxpbmUgdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmRfbGF0ZShzdHJ1Y3QgeGVfZGV2
aWNlDQo+ID4gKnhlKSB7fQ0KPiA+IMKgc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfcG1f
cmVzdW1lX2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UNCj4gPiAqeGUpIHt9DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BjaS5jDQo+ID4gaW5kZXggZjhlMTZhZWZkMmY4Li40NmEzMzk1NmM1YjQgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4gQEAgLTEzODUsNiArMTM4NSw4IEBAIHN0YXRpYyBpbnQg
eGVfcGNpX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QNCj4gPiBkZXZpY2UgKmRldikNCj4gPiDCoHsN
Cj4gPiDCoAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsNCj4gPiDCoAlz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpOw0KPiA+ICsJcGNp
X3Bvd2VyX3Qgc3RhdGUgPSB4ZS0+ZDNjb2xkLmFsbG93ZWQgPyBQQ0lfRDNjb2xkIDoNCj4gPiBQ
Q0lfRDNob3Q7DQo+ID4gKwlib29sIHBtZV9jYXBhYmxlID0gcGNpX2VuYWJsZV93YWtlKHBkZXYs
IHN0YXRlLCB0cnVlKSA9PQ0KPiA+IDA7DQo+ID4gwqAJaW50IGVycjsNCj4gPiDCoA0KPiA+IMKg
CS8qDQo+ID4gQEAgLTEzOTYsOSArMTM5OCwxNyBAQCBzdGF0aWMgaW50IHhlX3BjaV9ydW50aW1l
X3N1c3BlbmQoc3RydWN0DQo+ID4gZGV2aWNlICpkZXYpDQo+ID4gwqAJeGVfYXNzZXJ0KHhlLCAh
SVNfU1JJT1ZfVkYoeGUpKTsNCj4gPiDCoAl4ZV9hc3NlcnQoeGUsICFwY2lfbnVtX3ZmKHBkZXYp
KTsNCj4gPiDCoA0KPiA+ICsJeGVfZGlzcGxheV9zZXRfcG1lX2NhcGFibGUoeGUsIHBtZV9jYXBh
YmxlKTsNCj4gPiArDQo+ID4gwqAJZXJyID0geGVfcG1fcnVudGltZV9zdXNwZW5kKHhlKTsNCj4g
PiAtCWlmIChlcnIpDQo+ID4gKwlpZiAoZXJyKSB7DQo+ID4gKwkJaWYgKHBtZV9jYXBhYmxlKSB7
DQo+ID4gKwkJCXBjaV9lbmFibGVfd2FrZShwZGV2LCBzdGF0ZSwgZmFsc2UpOw0KPiA+ICsJCQl4
ZV9kaXNwbGF5X3NldF9wbWVfY2FwYWJsZSh4ZSwgZmFsc2UpOw0KPiA+ICsJCX0NCj4gPiArDQo+
ID4gwqAJCXJldHVybiBlcnI7DQo+ID4gKwl9DQo+ID4gwqANCj4gPiDCoAlwY2lfc2F2ZV9zdGF0
ZShwZGV2KTsNCj4gPiDCoA0KPiA+IEBAIC0xNDE5LDEyICsxNDI5LDE2IEBAIHN0YXRpYyBpbnQg
eGVfcGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdA0KPiA+IGRldmljZSAqZGV2KQ0KPiA+IMKgew0K
PiA+IMKgCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KPiA+IMKgCXN0
cnVjdCB4ZV9kZXZpY2UgKnhlID0gcGRldl90b194ZV9kZXZpY2UocGRldik7DQo+ID4gKwlwY2lf
cG93ZXJfdCBzdGF0ZSA9IHhlLT5kM2NvbGQuYWxsb3dlZCA/IFBDSV9EM2NvbGQgOg0KPiA+IFBD
SV9EM2hvdDsNCj4gPiDCoAlpbnQgZXJyOw0KPiA+IMKgDQo+ID4gwqAJZXJyID0gcGNpX3NldF9w
b3dlcl9zdGF0ZShwZGV2LCBQQ0lfRDApOw0KPiA+IMKgCWlmIChlcnIpDQo+ID4gwqAJCXJldHVy
biBlcnI7DQo+ID4gwqANCj4gPiArCXBjaV9lbmFibGVfd2FrZShwZGV2LCBzdGF0ZSwgZmFsc2Up
Ow0KPiA+ICsJeGVfZGlzcGxheV9zZXRfcG1lX2NhcGFibGUoeGUsIGZhbHNlKTsNCj4gPiArDQo+
ID4gwqAJcGNpX3Jlc3RvcmVfc3RhdGUocGRldik7DQo+ID4gwqANCj4gPiDCoAlpZiAoeGUtPmQz
Y29sZC5hbGxvd2VkKSB7DQo+IA0KDQo=
