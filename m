Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E582606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X9UqUHxn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4360811207E;
	Thu, 29 Oct 2026 08:09:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE5611207B;
 Thu, 29 Oct 2026 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261366; x=1824797366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Q3DqHoWdMgspaB8uaVCL1mrJnXYChqrzpo87eK5fio=;
 b=X9UqUHxnwFDPp1h8+LABL85Kky4GgbJvcJDXDnVc7iDl3nj27AXcNzWZ
 +8vicsD7EuW1lbKs381zwhF/thSJx4MF76RxRPf4DeGtiQkJp0Y+CUJdh
 7fcoB0QDVWdTTnvK9aRg1jyUNFWysTQa8qBPYaUENv7T5mH60Bc/uiOaf
 mrUMMitsOXaumjvIjS5O65SOhtqEzUEIPPt06ipcJj9vb+eW3GX3zaf/F
 hCS+ifloTn1kuHvc7Je3zS5pRhlZ4n0uF7AOkHKonjn3kiqyORTgWdsPN
 Wvq6KpaO2sKATu4Wha9RA9UcQndE41+Bkb32VzD82ST9nAE6emhRYxOZE A==;
X-CSE-ConnectionGUID: AEWb4x0GTRWuljP2lJPcEw==
X-CSE-MsgGUID: IK3unONVSOqefcpKDze6kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1990835"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1990835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:09:26 -0700
X-CSE-ConnectionGUID: 9RGMw2JmSi2k/xff2Fi1AQ==
X-CSE-MsgGUID: WRncRtGpQsmshFFcdkgDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5403087"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:09:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:09:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:09:25 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdeNXjUzXYLf1qyP8zF6TykilMqnpBu3iNFgkzc4AYEgCXDFPSJ7Cck0kA8v+jD0ZaoN6o7MXvlQ/gkPvJ+M6XeKK3RofICMG4UpRosTjL0SxXZjJW3T9/EAx42XsA4EBoABfulKlINg+181CN55j24dhI9MkUo0/EyXNE8BLerAv0v9qJ8VqdLdCcGcFxtoSuXdk4SqeHeXzDvhWg6HH2pC0RrmO/TEtcM4RJ40DP/Z5Db0RYB+yMcFohfx3yxtFs2VQaqMXk5teju4Q4vqYjxpn3oyWtJb/eSrDcXMWci/svIxjx3rhd1gZSqJNR4UetYwEPWeG7ur8aG148wxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q3DqHoWdMgspaB8uaVCL1mrJnXYChqrzpo87eK5fio=;
 b=OO/me/3XF4V6jnxzYthBYt9pu6U/pIjTORHlJA7Nmrh5B6+WXv1G/VUU5GRJ+MD03WOXEFBPMY2R+zjuiTRMqh/KDQAyVN985EvS0xp5/NKqpzpQ0ZpejKmDeRUJcLZZxVanviBQusHV8HOJ6f9BD3G4oEf14ezKok1qP/Csj9pliUhlYpT38+ZmOKfGvYOshUNlf8gskHNOyArRqWFowyjXIT6PpIy9nuFh/4zxkxRWsweobd6npYxj+cypyKfXElE6VeZcjFPfkl3vRrk2Wdsncz3lJb7aL8oao+JD3MtFfp988Q6qU5ll9wTrpmymtwIsAABtl+pt38Z7OJPjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH8PR11MB6657.namprd11.prod.outlook.com
 (2603:10b6:510:1c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:09:16 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:09:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v3 2/7] drm/i915/display: Add the DP link layer symbol
 timing generator registers
Thread-Topic: [PATCH v3 2/7] drm/i915/display: Add the DP link layer symbol
 timing generator registers
Thread-Index: AQHdZ3rrE1nRB/QKY0eNDxYEXgbmu7cUKn3Q
Date: Thu, 29 Oct 2026 08:09:16 +0000
Message-ID: <DS4PPFE901A304FD47F6A77A250B36CA30EE36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
 <20261029-vlk-64036-dp-symbol-tg-v3-2-69022424ef17@intel.com>
In-Reply-To: <20261029-vlk-64036-dp-symbol-tg-v3-2-69022424ef17@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH8PR11MB6657:EE_
x-ms-office365-filtering-correlation-id: 4b806c32-6a7f-471b-0342-08df3593ed0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|38070700021|4143699003|56012099006|11063799006|261009223027099003|261026140227099003|261022105027099003|261021121427099003|10067099003|261021123027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Mtmb1UWRAtYVnsp4ELQaB3ZqilM6hyuuiQymVkVI2jwTjJhelIMvBRoO2ZMXwGhYSoA6G4t/+aK1Rpc65xcpevbaJADTl3gyifwDlZhYPH2xw+2ZOwmIajg8fpKZ7y5yCA//qt51eSChDHy+n1PvFabgDJbE1epCvoH7Xzdde51pFaUuWfOJSGTgk7hN/BGFuzfPcTK89Y4NXNIspl+Wa1L7hKd2dvewNYLJ4uhL5bOYsmQlNizvrJBAe5PYvEgrrUt8/+Wlx9g2UYJVuuJfEV11q7O5hUJgxMUPDnYE3XID3rweYiyrduTtDK5sPBMF2OcNPcuv4sL2b8dZh2D/FOjYKDc5rnH2lzAAbAFzAhdkcTpRwbzSTfmbrtOK6J6cRabDg5Cwvb9AQ7qh3hrE8Ld2wVzjgCZvfIlBCts5PFqSIWd1Dx/mCz2zDHpMvrC0LoPmFKGSFWRrZ2UbcK19A60u7cI7P5csaugYGpqx6HT8Z4Kvd7hD2fCqtMvbdFObFRB8x/mg8UXcY4uTTnXNFubZnBfcI8Dd7ZuQrh5oLvhjreHxMK6K6LfjRAK0ABbGVmBBC1wbLn/KvVnJQakwVjmNalDezfB59h+3fcE9nOSUYUdx1lQBmQZ9jys/hvV3qUif6FhwGlgPBJV6lrX9uiS6EMzh/YFGxv9J1aWP5nVobsD4I2qWqNhfVHvGRjOp1mYd9UtqX1ntrnln7YIk5vyUl4xklbogGrqBOOctlf8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(38070700021)(4143699003)(56012099006)(11063799006)(261009223027099003)(261026140227099003)(261022105027099003)(261021121427099003)(10067099003)(261021123027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R28rRzNiTWV2SDBOREpLMlhlZ2svcmk5QlVlakRSb1B0ZkxzNkJEbUo3bXNT?=
 =?utf-8?B?dHN0VWVnSXBlWnZZNjJFVS8zUlJCNWFBWGFobmdvakNEeXFLZHJnblZVWHRE?=
 =?utf-8?B?UGlQUkE1ZEVMc3oxL1lmQ0p5MTlCN2ZhQVAweDJIQm9BU2V3c3pSNmNDeFgv?=
 =?utf-8?B?QkVNR3FVQldhQ3dCYXdQVUVLRWJKK3RtUVU3TWlHL1lybHFPUm9CN3V4Lzl3?=
 =?utf-8?B?a0tRcXlMTkR1Nnhnd29sbFRQNllOY2QrNWVwcUUwWTdVd1lBVDlIWjhOZ0NB?=
 =?utf-8?B?OGRnaFhPeUdQRFRsVUVPb29kMVFjMTk2cEJXYSthbFphVG12TzhGZWFVUTEv?=
 =?utf-8?B?ckVBL0JyVGJhS09Jb01ESGNEQW9ZTkVlZU5pUzRRTU5keVBuekdQTFlmSGpa?=
 =?utf-8?B?S3R6OXFkd2hPNENRZm51eDRsUFIzSDlHQXBHV0h5My9iTUkzN0NEN3lkOG1S?=
 =?utf-8?B?Y0pRN2Z6L2hnYWZRc1NNSDNvUWh1QVNDSkptTmYzWDlzVWZRbWI2aGFLeXJB?=
 =?utf-8?B?dC9kcE5zd3lLTjZ3VW4yUm8yRVEwSlBwSlo4dk41VUpnUlMwNTFHSEV3ODRn?=
 =?utf-8?B?Z1hmdVA3eEFHZVpLNTJSSTNIcGtoM1JSOUp0cFFGY1MxYklSNng3dnRnVVJl?=
 =?utf-8?B?WXpqQTBDRys2M1MweVNvUkNxQW15VnBmQ09VeDFoUVpxUFJQWmpqMWJYVGRG?=
 =?utf-8?B?SlZhRTVrc29SQkoxMFVyTVNXVG5NZzdoR1M4S2tFKzZnZitERm0razI3bTI1?=
 =?utf-8?B?Nlo1RkR0MDBHZjFDMFkyWUZXbUk5MjBDckJldVRQd256RkJqQngxTXJwcjhq?=
 =?utf-8?B?b1VuVi9SVkFTNzVHTCtjREJCNlZxZUFLQlVlY1ZVOVJERy8wVmlhK1RVU3Mx?=
 =?utf-8?B?OThIelh5SmFIQmVaL2dZSlhpTDMvYXBhSkFqTjVweGFMSWg1QWRnaCtYU3ow?=
 =?utf-8?B?Mk1sNTJSTEU1anNvV2d4cjNpSWUvMVRhWXQxMHAzcWIxcHZNOU9xcmx2NWta?=
 =?utf-8?B?WFBXZUVaOUVkV0VhbW5aZFlMbk5pcURNOFNsWndCZEI2TzQxNmdSWGtRN3hF?=
 =?utf-8?B?c1lsQitIWk5tZHk2RlRlbEcwU0NqUjViWUpzM3BGSjB3QnNRbFYrdzFwajIx?=
 =?utf-8?B?Q3d3OXdJOEFDT0tIVWVYVUlvMmtjMUsxWk9CNFRMZ3JBd0ZnZHEwSENXRGIr?=
 =?utf-8?B?TWQyTFEvWmN2eFNqbnF2TnphNlc4WDZjOElSZHBKTTFSZUdEbkJFYXArNzYv?=
 =?utf-8?B?dXdjbVBBQ2ZVcU95WnQ0MFZNSkFFa3MydG1ZVTV1SzNmVUNpT0NXR2tXSjdm?=
 =?utf-8?B?cEhzbzJ6QmRIMVFoZ1JEZW16ZnpsNzRTUFAvbVJYZWVnVi90Z1NzVEJJMWcw?=
 =?utf-8?B?VU90cG9CY1JXbTRXa0VwbitGY0JLbU5KZUNlTWZZc1VxTGtDQzlsb0FWd0Fp?=
 =?utf-8?B?TmtzVmlRL01VUDZRSFczaEo3Qmt4MThPVUFIaEJyNmo2Q0c2eGVBZmtVNm5F?=
 =?utf-8?B?VlROMTV4bC9idmFZZGJhTjJ4eS9sczNXR1Y5S0hqU25MNWR1WmJSMW9tR1Yx?=
 =?utf-8?B?UlYzb2toekQxNk1jZE5yWHlINUtEdlhWWk9Udm9IYW8zOVUxR21wbGtERGJW?=
 =?utf-8?B?MEdrVmhXbHR2eHVTcDZBajRlWTA0d3dNd0QrZ1krR056bld2SlRtakc3M3ZZ?=
 =?utf-8?B?YWM4QVlKck96MEpuWWkvS0NucHU5amdmU0tSWDI1V1NmT2JqTmRnaCtDWi9s?=
 =?utf-8?B?dlhaVDNLaGZwWm1JRFlKZ0NVQ1FWRHJKQ0E2ZCt0SGIvK2VxdDFuODQzaXZo?=
 =?utf-8?B?UWlRRU9OazhtSkt1bS92SW5PZFRxenVtRzFja2Q2RWF5NElLbWh0VWdmMXBS?=
 =?utf-8?B?N0NSOXgyTktmVTBUR0FwZWlDMzNyNE9pcWVyY3FBRGtkNTFFOWtxN1NxSTFs?=
 =?utf-8?B?L0NxZXlJa2piQU1IYU1haVJJUUpUT3Y2V0hxSUVKUDNRZVVrMy9EcTZ3TTgx?=
 =?utf-8?B?VmxUUjhnZzQwSmlHeWh4N2VteEkwRDRReWhQeDlHKzVOS3B0NVgwemtXakZl?=
 =?utf-8?B?MGJtNzZTT0k2UDFmZTlRbFFGSzViMFh3MUx2Z05ScnB4Ty8xWVNWcVJjOGU3?=
 =?utf-8?B?dTQ5N0F3aGRGRXBFRkw0RW5uN0VpUDA4NDdsUmlBa1pCRTJYSXJIVmh1OXVt?=
 =?utf-8?B?Y2JZd0VEOWZtbWo1YlFsR3Ruakc1cEZwbDB0UGYwcmtSZnRuaHl0Rld4c3dn?=
 =?utf-8?B?elpjSnk0Zk5ZQndMZVFmbytaUUc0MGV4V0h0WVJQMjhUT2pzYW1VZU1kMUM4?=
 =?utf-8?B?dlBSaG4rdUpiTk52UTNzTnc4eDBscm5FTDJpZDZXUTZ3TUN3bnptZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bCz0A/6o6wj3RLUq1e2TNZhBOK/3jnN1Wx4rM/eR1n53ghTJ8TQKVV8kbupmr+0Th+49XthYKxxKxuVdGq9I+Mljb/js+jGAUkrsNuMXV2dPZfyFbk6oNS4YyUgAFvYR52fTuYZH96x1v8LyngmzUqCBnw/l1iA+2N0YH5gX1vRCwms+CQ4S6cHxc7UdQWtftkRoFGcdvLqa9i2TqJ5TZHNki0nrfmhmzbTHGJF66JtYxpv7YqThuo0mx4Rju7MTa36BQMkKHrv+PCJ2TKDxLHVj599LXs7/h+wF2B0jxJjr7l+uS6ZL8nuNnALfT4q4r1EDacABz82OJZVEZRpgAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b806c32-6a7f-471b-0342-08df3593ed0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 08:09:16.2693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sr9rlkAWVS4SEE+nPdJajXReSde0kLGxlkGJzOORkWRVVpvsc6abnrvOy0M3QC46SloH04ouYiSJx4T5GfBxOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMi83XSBkcm0vaTkxNS9kaXNwbGF5OiBBZGQgdGhlIERQIGxp
bmsgbGF5ZXIgc3ltYm9sIHRpbWluZw0KPiBnZW5lcmF0b3IgcmVnaXN0ZXJzDQo+IA0KPiBBZGQg
dGhlIGRlZmluaXRpb25zIG9mIHRoZSByZWdpc3RlcnMgb2YgdGhlIERQIGxpbmsgbGF5ZXIgKExM
KSBzeW1ib2wgYmFzZWQgdGltaW5nDQo+IGdlbmVyYXRvci4NCj4gDQo+IHYzOiBjaGFuZ2UgTU1J
TyAtPiBNTUlPX1RSQU5TMiAoU3VyYWopDQo+IA0KPiBCc3BlYzogNjg4NDksIDY4OTIyLCA2OTk2
MQ0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGlu
dGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV9yZWdzLmggfCAzOA0KPiArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcmVncy5oDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JlZ3MuaA0KPiBpbmRleA0KPiBiYmRiYzI3
NjI5ZDcxMDRjMWY4MGJhYWQ0NGU3MTA4NzIyMTRkNDJiLi4xYTdiYWRlYjMyNzk3NzkxNmM4NWNl
DQo+IDg4MzI3ZWM0OTY2MjNkNzg3YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JlZ3MuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcmVncy5oDQo+IEBAIC04NzksNiArODc5LDcgQEAN
Cj4gICNkZWZpbmUgICBUUkFOU0NPTkZfRFNJX1BMTF9MT0NLRUQJCVJFR19CSVQoMjkpIC8qIHZs
diAmIHBpcGUgQQ0KPiBvbmx5ICovDQo+ICAjZGVmaW5lICAgVFJBTlNDT05GX0ZSQU1FX1NUQVJU
X0RFTEFZX01BU0sJUkVHX0dFTk1BU0soMjgsDQo+IDI3KSAvKiBwcmUtaHN3ICovDQo+ICAjZGVm
aW5lICAgVFJBTlNDT05GX0ZSQU1FX1NUQVJUX0RFTEFZKHgpDQo+IAlSRUdfRklFTERfUFJFUChU
UkFOU0NPTkZfRlJBTUVfU1RBUlRfREVMQVlfTUFTSywgKHgpKSAvKg0KPiBwcmUtaHN3OiAwLTMg
Ki8NCj4gKyNkZWZpbmUgICBUUkFOU0NPTkZfRFBfU1lNQk9MX1RHX0VOQUJMRQkJUkVHX0JJVCgy
OCkgLyogeGUzcCsNCj4gKi8NCj4gICNkZWZpbmUgICBUUkFOU0NPTkZfUElQRV9MT0NLRUQJCQlS
RUdfQklUKDI1KQ0KPiAgI2RlZmluZSAgIFRSQU5TQ09ORl9GT1JDRV9CT1JERVIJCQlSRUdfQklU
KDI1KQ0KPiAgI2RlZmluZSAgIFRSQU5TQ09ORl9HQU1NQV9NT0RFX01BU0tfSTlYWAkJUkVHX0JJ
VCgyNCkNCj4gLyogZ21jaCAqLw0KPiBAQCAtOTMwLDYgKzkzMSw3IEBADQo+ICAjZGVmaW5lICAg
VFJBTlNDT05GX0RJVEhFUl9UWVBFX1RFTVANCj4gCVJFR19GSUVMRF9QUkVQKFRSQU5TQ09ORl9E
SVRIRVJfVFlQRV9NQVNLLCAzKQ0KPiAgI2RlZmluZSAgIFRSQU5TQ09ORl9QSVhFTF9DT1VOVF9T
Q0FMSU5HX01BU0sJUkVHX0dFTk1BU0soMSwgMCkNCj4gICNkZWZpbmUgICBUUkFOU0NPTkZfUElY
RUxfQ09VTlRfU0NBTElOR19YNAkxDQo+ICsjZGVmaW5lICAgVFJBTlNDT05GX1BJWEVMX0NPVU5U
X1NDQUxJTkdfWDEJMyAvKiB4ZTNwKyAqLw0KPiANCj4gICNkZWZpbmUgX1BJUEVBU1RBVAkJMHg3
MDAyNA0KPiAgI2RlZmluZSBQSVBFU1RBVChkZXZfcHJpdiwgcGlwZSkJCV9NTUlPX1BJUEUyKGRl
dl9wcml2LCBwaXBlLA0KPiBfUElQRUFTVEFUKQ0KPiBAQCAtMjMzMiw2ICsyMzM0LDQyIEBADQo+
ICAjZGVmaW5lIF9EUF9NSU5fSEJMQU5LX0NUTF9CCQkJMHg2MTBhYw0KPiAgI2RlZmluZSBEUF9N
SU5fSEJMQU5LX0NUTCh0cmFucykJCV9NTUlPX1RSQU5TKHRyYW5zLA0KPiBfRFBfTUlOX0hCTEFO
S19DVExfQSwgX0RQX01JTl9IQkxBTktfQ1RMX0IpDQo+IA0KPiArLyogRFAgbGluayBsYXllciAo
TEwpIHN5bWJvbCBiYXNlZCB0aW1pbmcgZ2VuZXJhdG9yLCBkaXNwbGF5IHZlcnNpb24gMzUrICov
DQo+ICsjZGVmaW5lIF9UUkFOU19MTFNZTV9IQUNUX0EJCQkweDYwMGRjDQo+ICsjZGVmaW5lIFRS
QU5TX0xMU1lNX0hBQ1QoZGlzcGxheSwgdHJhbnMpIFwNCj4gKwlfTU1JT19UUkFOUzIoZGlzcGxh
eSwgdHJhbnMsIF9UUkFOU19MTFNZTV9IQUNUX0EpDQo+ICsjZGVmaW5lICAgVFJBTlNfTExTWU1f
SEFDVF9NQVNLCQkJUkVHX0dFTk1BU0soMTQsIDApDQo+ICsjZGVmaW5lICAgVFJBTlNfTExTWU1f
SEFDVF9WQUwoeCkNCj4gCVJFR19GSUVMRF9QUkVQKFRSQU5TX0xMU1lNX0hBQ1RfTUFTSywgKHgp
KQ0KPiArDQo+ICsjZGVmaW5lIF9UUkFOU19MTFNZTV9IVE9UQUxfQQkJCTB4NjAwZTANCj4gKyNk
ZWZpbmUgVFJBTlNfTExTWU1fSFRPVEFMKGRpc3BsYXksIHRyYW5zKSBcDQo+ICsJX01NSU9fVFJB
TlMyKGRpc3BsYXksIHRyYW5zLCBfVFJBTlNfTExTWU1fSFRPVEFMX0EpDQo+ICsjZGVmaW5lICAg
VFJBTlNfTExTWU1fSFRPVEFMX01BU0sJCVJFR19HRU5NQVNLKDE0LCAwKQ0KPiArI2RlZmluZSAg
IFRSQU5TX0xMU1lNX0hUT1RBTF9WQUwoeCkNCj4gCVJFR19GSUVMRF9QUkVQKFRSQU5TX0xMU1lN
X0hUT1RBTF9NQVNLLCAoeCkpDQo+ICsNCj4gKyNkZWZpbmUgX1RSQU5TX0xMU1lNX0NIVU5LX1NJ
WkVfQQkJMHg2MDBlNA0KPiArI2RlZmluZSBUUkFOU19MTFNZTV9DSFVOS19TSVpFKGRpc3BsYXks
IHRyYW5zKSBcDQo+ICsJX01NSU9fVFJBTlMyKGRpc3BsYXksIHRyYW5zLCBfVFJBTlNfTExTWU1f
Q0hVTktfU0laRV9BKQ0KPiArI2RlZmluZSAgIFRSQU5TX0xMU1lNX0NIVU5LX1NJWkVfTUFTSwkJ
UkVHX0dFTk1BU0soMTEsIDApDQo+ICsjZGVmaW5lICAgVFJBTlNfTExTWU1fQ0hVTktfU0laRV9W
QUwoeCkNCj4gCVJFR19GSUVMRF9QUkVQKFRSQU5TX0xMU1lNX0NIVU5LX1NJWkVfTUFTSywgKHgp
KQ0KPiArDQo+ICsvKiBEYXRhIE0vTiB2YWx1ZSBEVzAvRFcxIGF0IHRoZSBiYXNlIG9mZnNldCwg
RFcyL0RXMyBpbiB0aGUgX0VYVA0KPiByZWdpc3RlciAqLw0KPiArI2RlZmluZSBfRFBfTExTWU1f
REFUQU1fQQkJCTB4NjAwMjQNCj4gKyNkZWZpbmUgRFBfTExTWU1fREFUQU0oZGlzcGxheSwgdHJh
bnMsIGR3KSBcDQo+ICsJX01NSU9fVFJBTlMyKGRpc3BsYXksIHRyYW5zLCBfRFBfTExTWU1fREFU
QU1fQSArIChkdykgKiA0KQ0KPiArDQo+ICsjZGVmaW5lIF9EUF9MTFNZTV9EQVRBTl9BCQkJMHg2
MDAzOA0KPiArI2RlZmluZSBEUF9MTFNZTV9EQVRBTihkaXNwbGF5LCB0cmFucywgZHcpIFwNCj4g
KwlfTU1JT19UUkFOUzIoZGlzcGxheSwgdHJhbnMsIF9EUF9MTFNZTV9EQVRBTl9BICsgKGR3KSAq
IDQpDQo+ICsNCj4gKyNkZWZpbmUgX0RQX0xMU1lNX0RBVEFNX0VYVF9BCQkJMHg2MDQ3MA0KPiAr
I2RlZmluZSBEUF9MTFNZTV9EQVRBTV9FWFQoZGlzcGxheSwgdHJhbnMsIGR3KSBcDQo+ICsJX01N
SU9fVFJBTlMyKGRpc3BsYXksIHRyYW5zLCBfRFBfTExTWU1fREFUQU1fRVhUX0EgKyAoZHcpICog
NCkNCj4gKw0KPiArI2RlZmluZSBfRFBfTExTWU1fREFUQU5fRVhUX0EJCQkweDYwNDc4DQo+ICsj
ZGVmaW5lIERQX0xMU1lNX0RBVEFOX0VYVChkaXNwbGF5LCB0cmFucywgZHcpIFwNCj4gKwlfTU1J
T19UUkFOUzIoZGlzcGxheSwgdHJhbnMsIF9EUF9MTFNZTV9EQVRBTl9FWFRfQSArIChkdykgKiA0
KQ0KPiArDQo+ICAvKiBTTkIgZURQIHRyYWluaW5nIHBhcmFtcyAqLw0KPiAgLyogU05CIEEtc3Rl
cHBpbmcgKi8NCj4gICNkZWZpbmUgIEVEUF9MSU5LX1RSQUlOXzQwME1WXzBEQl9TTkJfQQkJKDB4
MzggPDwgMjIpDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
