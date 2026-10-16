Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D699CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F70910E06C;
	Fri, 16 Oct 2026 18:54:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264F610E06C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792176866; x=1823712866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lpWuLoxlbgt2qHpac3Ij1Vnq17tKbPR4JXrDRj4b8f0=;
 b=QiENeJltlMDc3h6CpqBHSxfosaxDiJgyw4lqj3U62HhacLlUroZCRZVz
 +aqZbharG2i5kSefKdG2StLwZP2zgjkxKAW0KjNN9FLt0ITGC3u7QJ6Kv
 XKXV5i9o1qzz+dPiT7wI4IfRZg8N0CiGVceJkHE57ubl9zUNxLPxBORkD
 xRQqwRxYvQAlGdDuDuoDT23Us72BlfMxfcyiYgT7X3gkpMtFYf8exhHQN
 foQyH61zYjPsQNf6r9WLn8Q8vKPiINg8VI3d/Ab3mT3rsaXqQYnt6MKDs
 cuYPJaxrD9i+lhXTpYDiB8JsRyONOndOXxS265OKRVnzgVg9/sQgWtof4 w==;
X-CSE-ConnectionGUID: 4gu1GFxFTI+wIJU6E1CL9Q==
X-CSE-MsgGUID: 21tuY4pRTte5sn60l05rTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="987068"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="987068"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:54:26 -0700
X-CSE-ConnectionGUID: 2/d8PVnqSL2nsDGeAlXCwg==
X-CSE-MsgGUID: TcTViAwlSJ6fpa4aaQ15Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2375273"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:54:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:54:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:54:25 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBV5/2YrW0CAYLZeEjkbTAehGQg74+g1viy/mE2/5ptowy6w47tNmXKZ84vW2xgAJJXOEy/9kNpCVgjkVzURVa46x1GmbTaxNX+I6H3JPZkHIR9uXf6OLei2XwEDM2h5+gf2v1kYQ7LhcX0zwVvrS9LSZ2mheifLnT2v2wBa6nhocAQF2DYVzmCQLd2NCdAR+92CbJzbhLneJ8whLV4dHPwd8LyAYAWvE7QrkCjBsPw02v0eNtJvqx2toRNzShsXNqvLiGWR/pByj4EeQqHD4IU6CfHsW2ih62SHXwSwsomZgiPnb1k+/OUIPnMaukWSqhlFp2jjrTG+O6DBFzIe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpWuLoxlbgt2qHpac3Ij1Vnq17tKbPR4JXrDRj4b8f0=;
 b=y25JpvV33nRqJBgteZVuTbiw8VU8pGTXpyBpwifbdKKqUlDsU4lWRQc748TNFdNFLiudD0AIsXSwWCxgNoW7ayKCzXI/TPSEhoEqm99svI2KTV9p8zJLb8F2Q5bHuZ8tFYltk6pL2Z3GUofVzP2hjZOmJtEy1CUIS5lcyLiATIZ7pr2K4PjqofAd9Q2iFm5K2XVliyiVTBeNnnSzYGsgBta6YUUTEHREOVYhK6n+7/S2suhcwKbgcE+nJzPtb+jouVXZHNn6Mh6YgDkRTUHkEOZ/sW73RLb9H6f2GcJRJfGjujnhOJIImxWajvjq7fD2Guh9u2TObVms4miW7/mr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 18:54:20 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0522.011; Fri, 16 Oct 2026
 18:54:20 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, lkp <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Thread-Topic: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Thread-Index: AQHdXZPud6jb4qkwv0GgDyUDklyqGbcAhFYA
Date: Fri, 16 Oct 2026 18:54:19 +0000
Message-ID: <9e2da69b4a3dcf61baca5ed9cd7f8f4d206f8cd4.camel@intel.com>
References: <20261016172937.2980310-2-rodrigo.vivi@intel.com>
In-Reply-To: <20261016172937.2980310-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|PH7PR11MB7451:EE_
x-ms-office365-filtering-correlation-id: 020e3f07-071f-4de9-c3fc-08df2bb6e2d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|261009221227099003|261009220027099003|10067099003|261009223327099003|261009223027099003|261009221727099003|38070700021|56012099006|11063799006|5023799004|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: 2UYAaZm6w6M3FICF5W9hct7Ke9h+ZXvnHR2Gg09KT2BqdBqLNiQjV0NOOdIPfDZKFYfF9OsHPlEWgT1dzsRWPQ7is4C35hjPY1u+YsECeaFQu49VebBZcpgdkg+W1YYOEg2EaXNWUGrGknaEkK7sNBB9N0Li/GnI4AldKVG9UncsJLkB6Z2CBd/ys2B85Ez7rAtl/GUi/gxCcGHzcaAcfG+D5NEl4AG5HJF6lfGD9diswQxH+jqq2gQOY0BRH+qwkeuQNQA58Em15rVWUI+SXRWhFC/G92ZyxfpUgwaHCOx8aCCLE3/w945ru4BytWqCQQckWHjg354DZi7o4nGzWBnsKzuWibRxoREpjiMBga3HGSBxImLbuZQGBCsYpDdIsi9B60TjZkzOz3QDgp6oBDSuW8MO/TPobhKEQeJTwia+vdvbiW+iSMYTZX2uKeZFFlugUfIV42EqeplVBvIFL16b/0C9i+h+sliM2ok4/+V7Rcu8y6zpsRgRxjSUZEIMw7jETYsHnP4XGXpq8pysLxFG1ldF5olmPsbGBWJfxbrRIO7DYes6bxCxL+3P/5XEtX4ASTc8hFwBJ8pRuas9YWH+h5hQSDK0aeXfkjkvsTTrOTqFf1XNOy/gVQ3ngDm6cMTAyZM+hNfEzKNg6JCFVaLg++kLwfdqC8R9Z0XX8X52n2E+f8ANCe2X3TUhRPDk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009221227099003)(261009220027099003)(10067099003)(261009223327099003)(261009223027099003)(261009221727099003)(38070700021)(56012099006)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2VmNmJkVkd4aFNpcnEvUXlGaFltdmdTQ0ZnOXNxTXVxVmpYZXY5WTBxc1Qy?=
 =?utf-8?B?OHJwaGhpK3VFUGNGWERMYk1oVkxQcUhUUldHT2RUR2tCbGY4SDB6aDdVK2Vy?=
 =?utf-8?B?ZGJRWXczQ09CS0lWN0ZKMnFzUENVRWxPRU5saG5jSE1rSFFhSmFwNnlyQ1VH?=
 =?utf-8?B?TUFNNXNyL1kweGl5VCtFUDU2QWZXVW8vdU9iMVJWeVM4aU5uRnJiN3hYUE5a?=
 =?utf-8?B?TDJrR1Y2K1dUd3ZmOHRJK1ZDUVdOK1QwZWxKRlpvL2ozYXBGNWw0bU9IeTlR?=
 =?utf-8?B?R2IraHVoR09lL3h1YURWSks5YUhmT09LcEc2cjRndmQ5M3lBNGxTSUE2VUJQ?=
 =?utf-8?B?cHpFYll3MUJDV0hIcGdIa3lOSU1uOXExdEJmOFcwbXdwbjlCeUZ5ZHhkL0lP?=
 =?utf-8?B?cUxaeUErUXpxZjNLZUdqeUxjdHN2WC95dFJ5cEJqRHFkQjNHMEhUUmpwK2ls?=
 =?utf-8?B?NElYU1A3bm1CNXN0aGg1QTluZjkxdE9uZnVlRWd5MTlVbnRDZWxGUXkwWFdm?=
 =?utf-8?B?MFlxUmdxK0c4SG1QSFRSUjNudlMzdEJmM21HMmZNR3h0Qm5CNVRPMHZrdTNL?=
 =?utf-8?B?MEpEbmVhTGFUREpzcUcrOEt4LzJ5QWZELzdZcnptOXpGNVlnM0pqdVk1MjBx?=
 =?utf-8?B?SXN1V1JqekRQbmhIWFpsTGlWU3l1TXlNcm9MbndYamNtTElXYTREeVJQSHJG?=
 =?utf-8?B?eFlNM2htNkVabFlBTFNrQlhKb3FXcjRTTE1BMnJmWitpOFQ5amZLWjVqbWZ3?=
 =?utf-8?B?Y3ExbWlDbmh3cEdwS2dyNDBxL3p1WlhuWXJyM0VnTEZXMXpwWEk1K2ZJQXA5?=
 =?utf-8?B?Nm5saDJPMWN1TXhZZy9xWDJHNnFVYk1Pc2VuanFJMlFoR3F5cFdmNldWakdp?=
 =?utf-8?B?MXVrMDZSMFhPQVRRNXZyY29VR09zVHcySkgxKzhWUHQyUk80S3BVTEd1aDBS?=
 =?utf-8?B?b3ZPT1lFbytsdW1LOXI4bXZzY3NkbW1iQWR4YU81ZnZEWFRBeFYyWTBvbXBM?=
 =?utf-8?B?NG50blVwdkEwb1I2Ymd6YXhiQWNkSDJxWmpCd2ZaYnpRd21scFE3ZCtsQSsz?=
 =?utf-8?B?OFphSWNpUEVFUk1XQ0NSWGYxVHRqYWVMNVFrbllNOFd4ZUdIMEI3NjBGaTIv?=
 =?utf-8?B?aWVhR0NZTnJjY1hyZUVReDJ3cWtaa25ZM2JoU2tiMEU0VDB3SmJTNmlJQ3kx?=
 =?utf-8?B?dEJQOERkVWlIYjVHdnMvbEdkOTJtRlM1aVQ2S1owR3JRekpxaGFlQk80dHFq?=
 =?utf-8?B?d0pkdUo1T0ZCTllHSlVqYUJPc0UzWHJGdUNPc2hzQzdBYVhtT3BSRndtNXRa?=
 =?utf-8?B?T3BxTlpNUlJsNlA0MU5KSXgyNUxvT2p3bG1VdkI1ZXVwK1FLaXc3QTNqdExr?=
 =?utf-8?B?MEthYTM0Q3pMQytVeTV6TG9ZUVZvbVpJRThhRXlMRDVRZ1g5QTBTS2pkS2tW?=
 =?utf-8?B?Zmw0RTlDYituSGN5VjRiWVc0a1ZjdXRQUmpJbXZSRjhJWVFkZmZiU2o1aUFP?=
 =?utf-8?B?YTd4d1ZtOXo1a3l4aDBpUEJsNFRlQTdRV1VrU2haeDJhZm9TQ0tvUXd5UFA3?=
 =?utf-8?B?SFlLUDhsb1gwWmlxbVlBVE5hd05ja0Q3WDczTnRmSk9ydE55bzNkMHoxWGFy?=
 =?utf-8?B?d2V6ODVXbzFlWkZreUVRUjIxL2NKUStOQ1hqbmVSOEtweVM2Vm1vU3JOUldB?=
 =?utf-8?B?VXRTQjIrMks3NzRMTnFPc3dmRzBNK0RjY3ZxRnEzY0F2WE0yN2V5dDlqaFdK?=
 =?utf-8?B?SFF3TmQxdE1iR3RINXN4d1BFQ2JqZjEyckkyQjdPYUtmaFo0dzZyaVZYejYr?=
 =?utf-8?B?Z2pzN3lPS2I2ZkY5SkgwZGd2S2xjQWJTS3FTRjlEQUZseEVCWHhpK1lPM0Y1?=
 =?utf-8?B?cDBMWEwwcWJSSUJ5aVA1RWVxOGJ3bXc0NTJTR2h3REVmeGs0NU5RY1lXUWhs?=
 =?utf-8?B?cy91QU51QzRiV2xJckhkZzlYTlRWWDJEbGFSWlkzb0RaTGlERUNneFFPekN5?=
 =?utf-8?B?Yk1TbWNWbXMraFAwR3VaTjZuZWF1NGhKQzBZL0x2Q1RadktuWlJkSm9QVlBo?=
 =?utf-8?B?VWRva1ZMNXEveXV1OC9hZSsyem45QXo4UjZ2TkRma2hkK3dMSlRUTE9GRlVU?=
 =?utf-8?B?aVEwSUZmYk1tNGtvYkgwM2l3NTdmZkUrTVRmN0tZWm5Dbkp0K2J1Tlc1OUtC?=
 =?utf-8?B?eUdwTmZJbnY5MHJIN0loblE2QlpQR0I2VHdXdkV3djViVU9CQ3lNdnB0S2hL?=
 =?utf-8?B?MkR2b3dqUXhCVEpZQzdxeWJKRXZxdnBJVjJVQkdPNWZkT0p0MHBlNjUzTmJY?=
 =?utf-8?B?b0FkdGhuczg1L1ZMSGdDanoxbmJGK1gzZ0JOOEJSOVFUcUlLWEVJMDVaTkE2?=
 =?utf-8?Q?MInUrWLKelqXCvXY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FB816C839E35144967E10850595DCFB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N7K7ImdIGD3uB1/Lpn7Q4S8lFmsdNQ0wcdTur8gbGMndjEdzUIYJE1F/SXz0MYSGr0J0RBBikyajR/qc8QMHGcN3ZhTRTXakwIZvj4tyo409uqZNF32Z6GdB9uddDkL1kM8orACk4pAt6ynUAmMToxtfkLb36wsMU8kdthMhgRuTvErbRLrNQ3Ac6ApRGq/t+NEe/Qhm1Or6FQYGdvQnR3F4vXN3k4zybbcQCxfMKlOA8i+Or8t+YSTEOAQmrYHOvvqtdcWykgE8/TjAuHC4XMfE3j5eESx/lAWLD/N0+O9OodoaKlkN21kohCCetadwOShcljweFNTTRONRJTCXjQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020e3f07-071f-4de9-c3fc-08df2bb6e2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 18:54:19.9429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COozVKWMbnyt7P4WYvGEoLK/na7pGi6xlJ32ai9QJ8NMu77IErqplzH239eWXeIFUNtMEw4GdrFHL2Ug0fW6kNfLfecoeTUtzq2BXZUFNxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
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

T24gRnJpLCAyMDI2LTEwLTE2IGF0IDEzOjI5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IFdoZW4geGUgaXMgYnVpbHQtaW4gYnV0IGNvbmZpZ2ZzIGlzIGEgbW9kdWxlLCB4ZV9jb25maWdm
cy5vIGVuZHMgdXANCj4gaW4NCj4geGUtbSBhbmQgaXMgbmV2ZXIgbGlua2VkLCB3aGlsZSB4ZV9j
b25maWdmcy5oIHN0aWxsIGRlY2xhcmVzIHRoZSByZWFsDQo+IGZ1bmN0aW9ucyBiZWNhdXNlIElT
X0VOQUJMRUQoQ09ORklHX0NPTkZJR0ZTX0ZTKSBpcyB0cnVlLiBUaGlzDQo+IHJlc3VsdHMNCj4g
aW4gdW5kZWZpbmVkIHJlZmVyZW5jZXMgdG8gYWxsIHhlX2NvbmZpZ2ZzXyogc3ltYm9scyBhdCBs
aW5rIHRpbWUuDQo+IA0KPiBBZGRpbmcgYSAiZGVwZW5kcyBvbiBDT05GSUdGU19GUyB8fCAhQ09O
RklHRlNfRlMiIHRvIERSTV9YRSBpcyBub3QgYW4NCj4gb3B0aW9uLCBhcyBpdCBjcmVhdGVzIGEg
cmVjdXJzaXZlIEtjb25maWcgZGVwZW5kZW5jeSB0aHJvdWdoIElOUFVUDQo+IGFuZA0KPiBVU0Jf
R0FER0VULiBJbnN0ZWFkLCBhZGQgYSBoaWRkZW4gRFJNX1hFX0NPTkZJR0ZTIHN5bWJvbCB0aGF0
IGlzIG9ubHkNCj4gZW5hYmxlZCB3aGVuIGNvbmZpZ2ZzIGlzIHJlYWNoYWJsZSBmcm9tIHhlLCBh
bmQgdXNlIGl0IGJvdGggdG8gYnVpbGQNCj4geGVfY29uZmlnZnMubyBhbmQgdG8gc2VsZWN0IHRo
ZSByZWFsIG9yIHN0dWIgaW50ZXJmYWNlIGluIHRoZSBoZWFkZXIuDQo+IA0KPiBDYzogUmlhbmEg
VGF1cm8gPHJpYW5hLnRhdXJvQGludGVsLmNvbT4NCj4gQ2M6IFN0dWFydCBTdW1tZXJzIDxzdHVh
cnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IEZpeGVzOiAxNjI4MGRlZDQ1ZmIgKCJkcm0veGU6IEFk
ZCBjb25maWdmcyB0byBlbmFibGUgc3Vydml2YWJpbGl0eQ0KPiBtb2RlIikNCj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBDbG9zZXM6DQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjEwMTYwOTM1LlFrNFp4QnhZLWxr
cEBpbnRlbC5jb20vDQo+IEFzc2lzdGVkLWJ5OiBMTE0NCj4gU2lnbmVkLW9mZi1ieTogUm9kcmln
byBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KDQpZZWFoIHRoZSB3cmFwcGVyIG1ha2Vz
IHNlbnNlIHRvIG1lLiBJIHJlYWxseSB3aXNoIHdlIGNhbiBqdXN0IGFsd2F5cw0Kc2VsZWN0IHRo
aXMgYW5kIGdldCByaWQgb2YgdGhlIGRpZmZlcmVudCBlbmFibGVkL2Rpc2FibGVkIGZ1bmN0aW9u
cy4uLg0KYnV0IEkgYWdyZWUgd2l0aCB0aGUgcG9pbnQgTWF0dCBoYWQgbWFkZSBpbiB0aGUgb3Ro
ZXIgcmV2aWV3Lg0KDQpXZSBwcm9iYWJseSBoYXZlbid0IGhpdCB0aGlzIGJlY2F1c2UgYWxtb3N0
IGV2ZXJ5b25lIHdpbGwgZWl0aGVyIGhhdmUNCmNvbmZpZ2ZzIG9yIG5vdCBoYXZlIGl0IHJhdGhl
ciB0aGFuIGJ1aWxkaW5nIGFzIGEgbW9kdWxlLi4uIEJ1dCB0aGUgZml4DQptYWtlcyBzZW5zZSB0
byBtZS4NCg0KQnVpbGQgdGVzdGVkIHRoZSBwb3NpdGl2ZSBjYXNlcyBhdCBsZWFzdC4uLiBGb3Ig
dGhlIG5lZ2F0aXZlIGNhc2VzLCBJJ20NCm5vdCBzdXJlIGhvdyByZWFsaXN0aWMgaXQgaXMgdG8g
YWN0dWFsbHkgaGF2ZSBDT05GSUdGU19GUyBzZXQgdG8gJ24nDQpzaW5jZSBhIGxvdCBvZiB0aGUg
ZGV2aWNlcyBvbiBhIHR5cGljYWwgZGlzdHJpYnV0aW9uIGFyZSBnb2luZyB0bw0Kc2VsZWN0IHRo
aXMgYnkgZGVmYXVsdC4gRm9yIGV4YW1wbGUsIHRoaXMgaXMgd2hhdCBJIHNlZSBvbiBhIHF1aWNr
DQpncmVwOg0KZHJpdmVycy9paW8vS2NvbmZpZzoJc2VsZWN0IENPTkZJR0ZTX0ZTDQpkcml2ZXJz
L2Jsb2NrL251bGxfYmxrL0tjb25maWc6CXNlbGVjdCBDT05GSUdGU19GUw0KZHJpdmVycy9ncGlv
L0tjb25maWc6CXNlbGVjdCBDT05GSUdGU19GUw0KZHJpdmVycy9ncGlvL0tjb25maWc6CXNlbGVj
dCBDT05GSUdGU19GUw0KZHJpdmVycy9ncGlvL0tjb25maWc6CXNlbGVjdCBDT05GSUdGU19GUw0K
ZHJpdmVycy91c2IvZ2FkZ2V0L0tjb25maWc6CXNlbGVjdCBDT05GSUdGU19GUw0KZHJpdmVycy9u
dm1lL3RhcmdldC9LY29uZmlnOglzZWxlY3QgQ09ORklHRlNfRlMNCmRyaXZlcnMvYWNwaS9LY29u
ZmlnOglzZWxlY3QgQ09ORklHRlNfRlMNCmRyaXZlcnMvZ3B1L2RybS92a21zL0tjb25maWc6CXNl
bGVjdCBDT05GSUdGU19GUw0KZHJpdmVycy9od3RyYWNpbmcvc3RtL0tjb25maWc6CXNlbGVjdCBD
T05GSUdGU19GUw0KZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L0tjb25maWc6CXNlbGVjdCBD
T05GSUdGU19GUw0KZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL0tjb25maWc6CXNlbGVj
dCBDT05GSUdGU19GUw0KZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL0tjb25maWc6CXNl
bGVjdCBDT05GSUdGU19GUw0KZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL0tjb25maWc6
CXNlbGVjdCBDT05GSUdGU19GUw0KZHJpdmVycy9wY2kvZW5kcG9pbnQvS2NvbmZpZzoJc2VsZWN0
IENPTkZJR0ZTX0ZTDQpkcml2ZXJzL3ZpcnQvY29jby9ndWVzdC9LY29uZmlnOglzZWxlY3QgQ09O
RklHRlNfRlMNCmRyaXZlcnMvdGFyZ2V0L0tjb25maWc6CXNlbGVjdCBDT05GSUdGU19GUw0Ka2Vy
bmVsL0tjb25maWcua2V4ZWM6CXNlbGVjdCBDT05GSUdGU19GUw0Ka2VybmVsL0tjb25maWcua2V4
ZWM6CSAgQ1JBU0hfRE1fQ1JZUFQgY2Fubm90IGRpcmVjdGx5IHNlbGVjdA0KQ09ORklHRlNfRlMs
IGJlY2F1c2UgdGhhdA0KbGliL0tjb25maWcuZGVidWc6CXNlbGVjdCBDT05GSUdGU19GUw0KbmV0
LzlwL0tjb25maWc6CXNlbGVjdCBDT05GSUdGU19GUw0KDQpTbyB3aGlsZSBJIGFncmVlIHRoaXMg
aXMgbmVlZGVkIGluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCBJJ2QNCnN0aWxsIGFyZ3Vl
IHdlIHNob3VsZCBqdXN0IHNlbGVjdCBDT05GSUdGU19GUyBhbmQgbm90IGRlYWwgd2l0aCB0aGUN
CmV4dHJhIGNvbXBsZXhpdHkuIEFsdGhvdWdoIG1heWJlIHdlIGRvIGhhdmUgc29tZSB1c2UgY2Fz
ZSB3aGVyZSBzb21lb25lDQp3YW50cyB0byBicmluZyB1cCBzb21lIGJhc2ljIGRpc3BsYXkgYW5k
IGdyYXBoaWNzIG9yIHB1cmUgY29tcHV0ZSBpbiBhbg0KZXh0cmVtZWx5IG1pbmltYWwgc2V0dXAg
b3RoZXJ3aXNlLg0KDQpBbnl3YXkgZm9yIHRoaXMgb25lOg0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0
IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoN
Cj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL0tjb25maWfCoMKgwqDCoMKgwqAgfCA2ICsr
KysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZcKgwqDCoMKgwqAgfCAyICstDQo+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmggfCAyICstDQo+IMKgMyBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0veGUvS2NvbmZp
Zw0KPiBpbmRleCAwZDg3MjUxYzVkN2MuLjk0NzkzNDBiNTgwOCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL0tjb25m
aWcNCj4gQEAgLTExNiw2ICsxMTYsMTIgQEAgY29uZmlnIERSTV9YRV9DT01QUkVTU19EVU1QDQo+
IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqDCoCBJZiBpbiBkb3VidCBzYXkgIlkiLg0KPiDCoA0KPiAr
Y29uZmlnIERSTV9YRV9DT05GSUdGUw0KPiArwqDCoMKgwqDCoMKgwqBib29sDQo+ICvCoMKgwqDC
oMKgwqDCoGRlcGVuZHMgb24gRFJNX1hFDQo+ICvCoMKgwqDCoMKgwqDCoCMgY29uZmlnZnMgbmVl
ZHMgdG8gYmUgcmVhY2hhYmxlIGZyb20geGU6IGJ1aWx0LWluLCBvciBib3RoDQo+IG1vZHVsZXMN
Cj4gK8KgwqDCoMKgwqDCoMKgZGVmYXVsdCB5IGlmIENPTkZJR0ZTX0ZTID0geSB8fCAoQ09ORklH
RlNfRlMgPSBtICYmIERSTV9YRSA9DQo+IG0pDQo+ICsNCj4gwqBjb25maWcgRFJNX1hFX0ZPUkNF
X1BST0JFDQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJpbmcgIkZvcmNlIHByb2JlIHhlIGZvciBzZWxl
Y3RlZCBJbnRlbCBoYXJkd2FyZSBJRHMiDQo+IMKgwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9uIERS
TV9YRQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+IGluZGV4IDEwOTMwYzkyNDA3MC4uNTg4MDkxYzUy
OWU4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+IEBAIC0xNjYsNyArMTY2LDcgQEAgeGUtJChD
T05GSUdfRFJNX0dQVVNWTSkgKz0geGVfdXNlcnB0ci5vDQo+IMKgeGUtJChDT05GSUdfSFdNT04p
ICs9IHhlX2h3bW9uLm8NCj4gwqANCj4gwqB4ZS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0geGVf
cG11Lm8NCj4gLXhlLSQoQ09ORklHX0NPTkZJR0ZTX0ZTKSArPSB4ZV9jb25maWdmcy5vDQo+ICt4
ZS0kKENPTkZJR19EUk1fWEVfQ09ORklHRlMpICs9IHhlX2NvbmZpZ2ZzLm8NCj4gwqANCj4gwqAj
IGdyYXBoaWNzIHZpcnR1YWxpemF0aW9uIChTUi1JT1YpIHN1cHBvcnQNCj4gwqB4ZS15ICs9IFwN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5oDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmgNCj4gaW5kZXggMTBhMDBkNmJiZjhmLi4wNjNl
NzNmZTAxZDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5oDQo+IEBAIC0xNCw3ICsx
NCw3IEBADQo+IMKgDQo+IMKgc3RydWN0IHBjaV9kZXY7DQo+IMKgDQo+IC0jaWYgSVNfRU5BQkxF
RChDT05GSUdfQ09ORklHRlNfRlMpDQo+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0NP
TkZJR0ZTKQ0KPiDCoGludCB4ZV9jb25maWdmc19pbml0KHZvaWQpOw0KPiDCoHZvaWQgeGVfY29u
ZmlnZnNfZXhpdCh2b2lkKTsNCj4gwqB2b2lkIHhlX2NvbmZpZ2ZzX2NoZWNrX2RldmljZShzdHJ1
Y3QgcGNpX2RldiAqcGRldik7DQoNCg==
