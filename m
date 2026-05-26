Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F668CD5BDE
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 10:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADDE10E176;
	Tue, 26 May 2026 10:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWcKQle9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEE610E176
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779790983; x=1811326983;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=o3/UykU//Zkvpum6j8q7KC8TAqpK+PBqOg8pMrcveRI=;
 b=PWcKQle9Wl7nuB3ELksudt5JrKw3IbZBGV0SHVoLdaigF8k0+qwNlhla
 s/GyWGbFCPTKj3DRymsO8VCBceHCKkvORpsPEK0959HX9p/nOU842+x9r
 kYTva2Tax6uc3lDsul6wdqJdwaxgb6YvkI+xDq1W9AsbO12nDzEeaprGW
 1FS6J47pPVBFL1uRYqWvywk3WO5eQxfjN4v+XbZk1HosTa13SRjxot/vo
 GYldeqI2C6mZ1tJMKBR6HEe2Mia8ViGDUpF8EgQwPNp5kCZko+BiW1zQK
 Gl98RwUBE7K3Vlhyi9PH7uhWlGqRUYWElSPEB/JA7dZuwnB5V5Qz1AiT+ Q==;
X-CSE-ConnectionGUID: pYhCp1WSSmmjgK7qXrGvfg==
X-CSE-MsgGUID: W23fp5dfTdGtDem2meJZlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="68123504"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="68123504"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:23:03 -0700
X-CSE-ConnectionGUID: 7Om7Xoh/SeaNm0SAJxUGpQ==
X-CSE-MsgGUID: JaLhpeK2RdO23geovJ2fbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246844880"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:23:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:23:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 03:23:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSYFzDVX82wInedX877BVLuecUjQPQgnuH+rP3AGFUnuduwddEBnedtYSdAnxRL7uWREuch6EXeCb+V00m6Sd14/nsDOLaf6q4pv+uL2pBvrcUx24s4YmHCea5QmojVcbOZcu4fLb5FUWjGhLKI/8KuQ3nAOsMkScFHAcHKUY/mLbVkLKUfEABI2lZt5p1/esb7d8EDlC09HULsB6XWGj+W6i+anLWcvFkt1qXGW9A1cjf5h1HMa1JXTR+LtFXQHDg6DSMVVArZOU+FVaCwoP7/o1Tvwx+FbBeXiMQz87dcLKxmq8ulrLAmMACd6zDvjGKCmcubtChpEyAW+QkyDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3/UykU//Zkvpum6j8q7KC8TAqpK+PBqOg8pMrcveRI=;
 b=OPRS23TbXkNdQ6/szbgKV4ojyXQEbxNeTuhF5liDeJHNRHMzOJaWU6ovPnNpC0xM2VjgcF5v2dmJKgL34eeGqO58vufZAl8qkrKeAtyLVJ3/khMxUqT+7HZWbAziD55qQ639vAFBxX7GtOp46FsJRIXg9qlZ0syLRdYyuIjRavlPYu0MViU3epbIl0MkffHL9Z/2zP069Svl2c9kgvShBSX8iAbqsWvRZNIoBe/Dq1yu5VBE86dq8g8JmcAvkfw5ZL3y4vEKaJHmAwzqrDAS7VdbUe4rgkdP7hl29ZHESyLg8ydQ/7E4+1/vffqMR2T0cKCNrax0eC8TMnHQebNGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.11; Tue, 26 May 2026 10:22:57 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 10:22:57 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wang, X" <x.wang@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Clear pending_disable before signaling
 suspend fence
Thread-Topic: [PATCH 2/5] drm/xe: Clear pending_disable before signaling
 suspend fence
Thread-Index: AQHc7OmCfik5lT2I/ES+jR1v4V6DgbYgGWkA
Date: Tue, 26 May 2026 10:22:57 +0000
Message-ID: <042dc4a104cc745d02e3a1ff9321f6593c358f88.camel@intel.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
 <20260526082700.1383831-3-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260526082700.1383831-3-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|MW4PR11MB6570:EE_
x-ms-office365-filtering-correlation-id: 9b70ac1e-67a0-40be-855c-08debb10c17f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|921020|11063799006|4143699003|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: c+H907Wa85eTl8gntfTdoK7igUBY1DZIaKaR5Y3kG/2BMiWXR2tpdYyL4a8JWngAUyasOm2UbL6HtAptbGWDEoUfZlTDzUFqMSBClz7/hrTHAvcXied+WT6WBwWxVuzEVSJ5Lvt9J2Knb3f9CTiXBcmG0myt1sWcmk0xuDzY8OjBgChhQPFq49Y6vvHdVnu8rgTVaWkcdQBJx45aG9MR/gHBNYAL9DYFrh7u4r2jj3dHBA2T0bJpeCG/uvcHGTOHtDhE4UjOfmVrP6hw9VuMoWpqIU27A68FCOrtaoFVYlHM2vpbd6o2W9jSEvVcH+FnAwT7IfKBm+rPcrWlVeflj/Cg7P3g2tFr8XNPcS65aRP+84XEmNNB10/tSkCQMLSeAy5w0BniISIVeF5MeX0gJh2hD5rJi7v7t2QhrYCUPLnMu0w7GxxTn9fsgcq40JrTEFx1ByGaykVUPDBIEI8uJ1/g/SMVmgLOPmBo2J7kX8knfZHUorLlYXwmbWVs/Be2ycM8gGSyejILDGeh1yAiOZaJbxPJyCFypztAlw4fsst3ydmpc8Ec9Co28cfNkzO5w2S6EZiQqmU2CP0axLU7PZw5o8kBG9mk1r0LM3rCIR6ZAdEFVDheE+Piy3kmrbaae9bsOLTvc1oSFnzkPk0EgCajATFRVhJ171/ScKQH5H9lpTvpkSI7Rk4Dn52M8PFF+G5rX77KdzFfYJAAMuzq2k0BgPU6tamLGCTrHh59VLy/+c2qSEfXk6klwAG1t88tl91fL8h9Ni73x+PXhsJjZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(921020)(11063799006)(4143699003)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjlaYTY4YVhyYXYyeFh6WWo4OU9TUWF5UHdxNEhNRUViZUM5WUVyeWxUOW8r?=
 =?utf-8?B?SHVNNWJjS0t0VnRhTnVJTmFyTldYZlVFMHp0dXZXZmpxcGlWMUZaRjk1K1pq?=
 =?utf-8?B?R214aUc0ZmFWblNia3Q1L2lFS0FiZ0FLK3BoM2cvd3RoSkZaWlVHbTRkVU9s?=
 =?utf-8?B?ZndNUU1vaFEzVkNrTjNscHc5cjRpK0QrWEJUcWZaRkhieHBVVGIxVnRDSndn?=
 =?utf-8?B?NGRtdlJOa1RWZlJCN0o0V2dMeHorQktTeHc2UnJ1dUdXaUlQTTVUUGR6ekZo?=
 =?utf-8?B?emRTN1VpK3QraVBMejFjMm9YY1FuWUpJdEt1SzVRSndIRGxDNTVvMHJZODU3?=
 =?utf-8?B?Y2hlb3I2ZmttQkxvNWtKZHZ5Y255RWdxbUExd2t2SkFtSTJCNE5pdjVZRnhl?=
 =?utf-8?B?bTBobkxyMVdLVmV0ZTY0NGIrd2I1VDdqUlJpdENnYU1HWmE3eGREcEloQ0h4?=
 =?utf-8?B?UFRrSExReWZSQWZ5TlNKQ1R0TzF2YlRpcGZhcnVqU1BjL0tFbi9UQ2wwdDVz?=
 =?utf-8?B?bTNRUFZ1RHRjUE5TVWpRa2x1ZG9yMCtnK3ZrNTRoVnhMUHBVcmpQSWJpOXNG?=
 =?utf-8?B?K2F3Rld3ZzVjSlJ2ZVRIZXNWR0JyOG9tblZUT3FVTGYvcGg0YjJsZHlVK2NH?=
 =?utf-8?B?ZnlDZlhnUUlTdEJUVWUxR0xMQ1lMQ2g3SWpWU1hHVkdiM0N6V1czZEtEaUFF?=
 =?utf-8?B?QTVYcHZJQVl4RVo2R1dQV3YyY0d5V29LVHA0a1d0ZUppckk5UFU0OFQ3dDEw?=
 =?utf-8?B?TjJqNUVTeXNBVENDN01KNzE5MW5nbHVwcVROd3RIQkVDaW11RWdKdXFVMDd4?=
 =?utf-8?B?TFlOelJXdmVmNXJIN2ZpNHVNMzc5bTNXd2xvaHk0UUlVZ0dSdllFL2w5WXl2?=
 =?utf-8?B?ZFJGRVZNdmRhOG11WGNpVWN3bVFHTlJzTlQ5MGtNRE1IL2tQRGtmZFhjZC9v?=
 =?utf-8?B?Rjd6dkhsaUlhSHBKcGhBT3A1UmJQZjlMU0Z4UFV4U2pMTWx2RWlCcG5rME5a?=
 =?utf-8?B?MVNxQXJkOHZQRDR1aUFDZGpqdXV0SnhvSUovRkNEQ216SzF5SzBWMDRuZzB0?=
 =?utf-8?B?N1RRV2VYQ1E1VzVpL1hUU1FwY0J1dy9UMllkMHQ5enhNZUk5T1UycVUyNFQ3?=
 =?utf-8?B?Tno0QmorRmZSTGluWmEzRUE0b0hyVmt4eVZERGZBN0kxT0xQbjROd0xBeS9q?=
 =?utf-8?B?MnFITUNwYzlEeTRDVGNyK2w5b1lJcnA4dWd6T3liY1B3M2JjMTUyZ2tzRHhs?=
 =?utf-8?B?L3VFM2pFNlQvVFZTNnlRSkk2YUZuaVA0bWxCVEplQmZnaStvcmFTYWJmRElW?=
 =?utf-8?B?Y2NxclNVQSszK1V4YzZKMWVmQjhXb1NYVUFBTlg1WGp2Q1pXbDlTRURsajh3?=
 =?utf-8?B?dEVwckgzM3IwaFVpb0hYWGt3aGFkWXB0OEc4bmJabkgvdzN6QXpOcEZmeWVv?=
 =?utf-8?B?aFVOMjNEVXhBSGhORmx4QU1yaFBSdkVrQVE3S01RWEdqRGhycDVOU2xjeVE0?=
 =?utf-8?B?cDZia0ovZ2tvYTZTZUJaa1psSzZkMkFqMUJCLzhnaGVZcHdVbkNiSUQ0Z00r?=
 =?utf-8?B?VW9wa0s3dk5tZTBkajNtNk1aRnBQM2g0dnJDSHdDbXNmVXg0SE9QM3JBS3NK?=
 =?utf-8?B?RmtOVkZmb3JHWHVGSG00Zm1UY2hnNXRJMkJWQ0hycVgzcUFVRzZ0YWlwS1li?=
 =?utf-8?B?OXF4cVprekI2UmFYcFF4YTJkdm9EUW1kWGs2QXF2S0cyT0NQRGhKMXBkVGxk?=
 =?utf-8?B?eVFXQ1NFT0dIMGZzSkZ6UkF4Rzg3a1ZJZVRxdXhRRXpyMnpGM3NCcG1CWm52?=
 =?utf-8?B?TFowM1E1N010MStWL3FBNGlXL281RjNIa0tCbVNiaXIyN3U2YzR4aFdEUFJV?=
 =?utf-8?B?QWhrbE5NK1RDOEJQblVZWkIvYUcrOFo4UHFmV2tCdTFxb3c0Y2ZES1l2UlU5?=
 =?utf-8?B?RVI4d2hnZU5CWGNhUGpYUU5mTXh6ejBoaTB3ZjdpejlUc1UzSS92aVBXRlN5?=
 =?utf-8?B?bzE1c0ZueHh3aVBZSGR1aTk1dUNKamlMZWh2cHZYbW1UUFhQUVpZRXlDTnEv?=
 =?utf-8?B?TUYxalNNOVB6YmwzOGdWdEhUT0E4elFnV2Y4TW5GbUlsR3dUL1FIMGlzMGQz?=
 =?utf-8?B?aWVFK1YzczVzU0FiN1BPdFUwbHhPMTlkVVp5bXN4dXJBUno4NEMwdEMwbDYr?=
 =?utf-8?B?ZDhidm83M2dlcER2bHBrcnFjS2RwdmVVRklZb2tqTHpZRUZLRzlzcUd6OGhu?=
 =?utf-8?B?azljM0Q5VmJ6R1RpTHZ4UmR5OTYxd2g4NzZyUXZOZEhRbzRRc0F0cE9GbGtI?=
 =?utf-8?B?TFF1Tnowbm5waHc2NFA3U0o5ci9hVzI0c01VbFREM3V4MTd0MjNSTFlWUDkv?=
 =?utf-8?Q?e9odjB7TZ3dNac5Ia0UHMthz0MMzBP50+w8s1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36E38C842DF8BD4E8CD46B19CF601D89@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bTP+jk1/xWbTZkirmO+qD5ql0OH9VwIh8KVAdAAHMjPaaL3e5579NxkqZNb6YoQgufj/+Ybpsr9Rvg02lwXzvamFpwulG6sBwZ7bt0ATel2/LgITCe7q/BuPVh0OxBR7ByjMdUC1CbplugBB2CvT3LcwyC5DQSFeJIJXg7Hs/nf7gbQTkbyoKTsKBIdmU6vQA4fGWmxNpmn72PSZPMsrubtSIKUht7+/PFW8Zfs3zb1w8FXejQ/eM5Kc6SHGgygBvO5RnADoWuuesImOEiXzS9xsW9tE2jWAWdQt5jD0jrvArKh35HOJ/IJ2PVlOZ5/V9Z/tLUriQzPAwmXWBco+Gg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b70ac1e-67a0-40be-855c-08debb10c17f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 10:22:57.3172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8n9Tx4UzmNnpgsz9RRVGOkmsjozRn7dizWsKY/2Ft0wh66GOpNkcNXFs9UKHsDSiYOjsZVbPJJedzjT+zjLC+VptT0EZTpdxxLDglZLepIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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

T24gVHVlLCAyMDI2LTA1LTI2IGF0IDEzOjU2ICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0
aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gSW4gdGhlIHNjaGVkdWxl
LWRpc2FibGUgZG9uZSBwYXRoIGZvciBzdXNwZW5kLCB3ZQ0KPiBzaWduYWwgdGhlIHN1c3BlbmQg
ZmVuY2UgYmVmb3JlIGNsZWFyaW5nIHBlbmRpbmdfZGlzYWJsZS4NCj4gDQo+IFRoYXQgd2FrZXVw
IGNhbiBsZXQgc3VzcGVuZF93YWl0IGNvbXBsZXRlIGFuZCByZXN1bWUgYmUgcXVldWVkDQo+IGlt
bWVkaWF0ZWx5LiBUaGUgcmVzdW1lIHBhdGggbWF5IHRoZW4gcmVhY2ggZW5hYmxlX3NjaGVkdWxp
bmcoKQ0KPiB3aGlsZSBwZW5kaW5nX2Rpc2FibGUgaXMgc3RpbGwgc2V0IGFuZCBoaXQgdGhlDQo+
ICFleGVjX3F1ZXVlX3BlbmRpbmdfZGlzYWJsZShxKSBhc3NlcnRpb24uDQo+IA0KPiBGaXggdGhp
cyBieSBjbGVhcmluZyBwZW5kaW5nX2Rpc2FibGUgYmVmb3JlIHNpZ25hbGluZw0KPiB0aGUgc3Vz
cGVuZCBmZW5jZSwgc28gYW55IHJlc3VtZWQgdHJhbnNpdGlvbiBvYnNlcnZlcyBhDQo+IGNvbnNp
c3RlbnQgc3RhdGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxl
c2gNCj4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5
OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQoN
Cj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyB8IDIgKy0NCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiBpbmRleCBmNzIwMGQ3MjBiNzAuLjc4N2Ew
MmM0NjY1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IEBAIC0yNzgz
LDggKzI3ODMsOCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfc2NoZWRfZG9uZShzdHJ1Y3QgeGVfZ3Vj
DQo+ICpndWMsIHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxLA0KPiDCoAkJeGVfZ3RfYXNzZXJ0KGd1
Y190b19ndChndWMpLA0KPiBleGVjX3F1ZXVlX3BlbmRpbmdfZGlzYWJsZShxKSk7DQo+IMKgDQo+
IMKgCQlpZiAocS0+Z3VjLT5zdXNwZW5kX3BlbmRpbmcpIHsNCj4gLQkJCXN1c3BlbmRfZmVuY2Vf
c2lnbmFsKHEpOw0KPiDCoAkJCWNsZWFyX2V4ZWNfcXVldWVfcGVuZGluZ19kaXNhYmxlKHEpOw0K
PiArCQkJc3VzcGVuZF9mZW5jZV9zaWduYWwocSk7DQo+IMKgCQl9IGVsc2Ugew0KPiDCoAkJCWlm
IChleGVjX3F1ZXVlX2Jhbm5lZChxKSkgew0KPiDCoAkJCQlzbXBfd21iKCk7DQo=
