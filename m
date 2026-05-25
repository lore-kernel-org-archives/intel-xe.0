Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6253BCD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 17:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2199610E223;
	Mon, 25 May 2026 17:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQuQIqhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D738910E162
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 17:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779731938; x=1811267938;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fPEx61vC6V+CayFWJKdz92LdgOvpAxZ/iyCkIoqvsuA=;
 b=SQuQIqhNQknld8m6foMFQr5PNDhwiO+T0kY4WiWujr2CoaSbBB/QodvJ
 ZNzv3Pr5F+qtndGjQ6w/xniI3Y9rSWM9uQ+OqeBerCeQbzc94J0XfQvzs
 7FzUT8TozQY7O55GQ3Mwegzr+gmlfOjox4q+6rAwT8C24lQs/5qNVEzyO
 2jqhcUjkBv1HsLpBgzI018BLNMUn9FDwm6ovgimOJPhSbJ9S+B6PAZqPn
 qcK+1Gr0o3yE1nZltcj3RNGVXOK/vFvD1hfsHkvlKa6XO409Fj+S5Clp4
 4DVPGyJuAe7wWcaDzhvnv2iEv0Kw/kM5jg9rZ0Hdxskjw5TCRAyoTFxwU Q==;
X-CSE-ConnectionGUID: gATN4oD5QdeLlw96Qs7OYA==
X-CSE-MsgGUID: fmhZeyD8Rre3NOii1eZ+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80586167"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80586167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:58:57 -0700
X-CSE-ConnectionGUID: RyZncjXMSRiNH7jPmMrDkA==
X-CSE-MsgGUID: /mUrIyG5SauZjZBYRhv7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="241729320"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:58:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:58:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 10:58:55 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQdilsyclN1vHkKlIIGI9pWo/eKnpqqKQyEYnKrsgS34+ij1qYPbBaFsdwTWWuMn6mKWP9sLmpC2Ad4H2dmdekt96ogNhN2s4CD89F/fS/V58BdFet+jVcnjBHYIN7uQnNudbHytX32k/aa6zMJwiEN0GTt/prX9AN9cXXnyHCiiouf8U2wn2Q+vx8n/q3qxX1WilOB10xcXkvvLq/P5ob2VBltjf192Hws+b1MknXhh9c7W0mBcBNBmR37Ou7ZARlXMc4JHZG7t1ZHNhlbNG00gc8tJCPPnwxaWh+lkdjnB9tizVTT8nMwFxd49DMQXY8mhuTZlNMDnz376OMBohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPEx61vC6V+CayFWJKdz92LdgOvpAxZ/iyCkIoqvsuA=;
 b=FlDE4bkLsudAAi1rli+ECzlsGG0FRiIeaVjzdxmU/NQjsREevLY7pL9chU+iFrVbzJnxLg2gvB3XSrwq/PRe68DExGem3cnf1EEB7KOzsUDarQkFVAcOEo/Xyk8j76ekcmq7JdE5YtasiEU0U1/VQVsH2Yz1q3mBIWUJ00KXkvXVtn1MLn+tguAkovA+pb9we32WPUfaFBWN+w2+CMC06GXAI4jvpojX0irB6kt62V4sT3KDPJkPAFhzw0k+xprusPXto4RrWtOsHWlMDTsASff7O+POgWe4FWMHzauRxAucZePgszgkdYP2lIcmhZckm/YRFq1lof5UBklIFtZpTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 17:58:52 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 17:58:52 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Levi, 
 Ilia" <ilia.levi@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Elbaz, Koby"
 <koby.elbaz@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 0/4] drm/xe/mmio_gem: fix fault handler and destroy path
Thread-Topic: [PATCH 0/4] drm/xe/mmio_gem: fix fault handler and destroy path
Thread-Index: AQHc7EYtxwQe3F59Q0edqwq3kjVPKLYeyFeAgAASQwCAAC0hAA==
Date: Mon, 25 May 2026 17:58:51 +0000
Message-ID: <b1b2b979ad65c70987d180758c57459edebc7c67.camel@intel.com>
References: <20260525125801.975038-6-ilia.levi@intel.com>
 <77634462951f6f3a615a3032e0c69f83b5842f66.camel@intel.com>
 <29b9eb69-98a5-4fc0-9c89-9cab377b670c@intel.com>
In-Reply-To: <29b9eb69-98a5-4fc0-9c89-9cab377b670c@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|MN6PR11MB8148:EE_
x-ms-office365-filtering-correlation-id: 4259a2f4-d98a-451d-9004-08deba8747b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|22082099003|56012099003|18002099003|6133799003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: 0xQLY7/abV9svvkIwTinchrm/1seJqaAnewjpwqTFn/2CMZzBMap8o50wivlOK9sAmvfgAuoGRkv1Jv7zdrzec/O+9XjvzLancd6cHm5+XHpA9uKqahOpSf5xv7EO9mZ1YGtXB0WsdK91TM+jBs51b9XJf6weqvKuJqjuiX63JL9uQoaD4xJKHWJHNoM+AuKpa+6AV7YJ9n6708kSdBZWhv/IQIsyJ4LsZdUhC1NZvNU23ygg5tIwFvVB1EtVrE1rQWDp01wZdnGTwflnev6sMuUwzwyH8SQhHJ8cdneOovFKkbzDANwHhBsoOj3htTXR1KVDOlRxKIUFJNUjhv6k6vQxWXmi8CJeIGvswydrVkB7TmP+z9WYEcUIdCKL6NM1HInGf3DPm6RkK+46oNgcA9pEeNnVBS/J/rcMMtUGK9k+gFSoRaXmHn3wUONarKHGuzwM9/7CeBPs4EznzI/XKQED408GS5ahvHNTGXmnWhzyJPexDEA8ql8IfOknnCYGRV7pN5rdU+IHOkVAItM5fmGlTDUIE3VeOtoDLYWbLAPUPxy/J2m9qSZc7SnE6bGDIiRZ6zjc+zcIBumADaGab/pHsm0WsWqvLD9n5wOZUdUoNVYyC+Bi5JNGNrt143wdxtL/kGVFKKlWfBOwNzfDx+30Me+Mb0Nika+TgUzhJ8JtWtZrGSNlyjYx9O0ukOrD8Wn0Cp/2N4N006G4KslzvSFFcMv8a6mLNofMgF8xGicZDApvBkZsIegThN/0DvM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(22082099003)(56012099003)(18002099003)(6133799003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkY0TTNvaUxoMDdEd1A2QVBkVkJmUXRjalk5aytEMkZHSmhsdEFKVnVmMlND?=
 =?utf-8?B?RHRYV3piNC9FZTV2T2VScUJWZ1dKU0JNaFVEdUl1RVNrTnNBSEM3VDJUZEZQ?=
 =?utf-8?B?VzR6VE9WRTQrOW1jbGl5Z2UrV0NoSFBseWFlWWJkMlFtajBUREpodTFNaGJl?=
 =?utf-8?B?dzNUb3VxWWdqRkVCODRTSnAwRWk1Y2dOZGJ4d1FLbFA2ai9OK3Q5WWpKVXBw?=
 =?utf-8?B?cVdkRk5PNjB2T0xuRWx0YXA2ZzJrUWhMU3U2QXRtMytRODRMRWZpaDk5N0lO?=
 =?utf-8?B?RXpaSklEdGl5MjRsV0ZoTjg4azhhQU9wMmRKV3o3V3Q4WFVsY2dicWVLVFVG?=
 =?utf-8?B?d1V1YlVTUG9qTkg4akYzK1d1WXljUENjZ05Qejl0NHUwQWtRMXFqK0VONTEv?=
 =?utf-8?B?SVgvdjJiYWxLVmpzSTB4NkV4V3AvTkpwTTlvekptcHZ1UVRPVzlSdUhhTHN6?=
 =?utf-8?B?dFNjQ2xtMkZxT0dGdmhwdk45TjJFVis3UlBuRWFaV2hTVFg1M3BlYyt6aXVh?=
 =?utf-8?B?ek9BaGRzaXM2azlDRm5zZWVjMWpKTHo0V2hHWW1kVVAzSEVkSWdPNTNsMTh0?=
 =?utf-8?B?WlRFRlhMVnZkUTgyVHJ3QlNrcXJlczFFM0tBSnlTNkhuR3ptNmRkdUZnWE5r?=
 =?utf-8?B?RXp3Vis2WHVGZkhTYkwydy85SFBLUG1laEwyOEZ5UE5PRXVnTmo1eTN5Z0o4?=
 =?utf-8?B?eXh3YzcyVGtNUHBqYWtCNkVnMUlLMVRKYUw3R0JvL1ZFM2RBWlBNRndqWW5G?=
 =?utf-8?B?KytxSDJTaGQ1V1BPNE1tQkEwUDlEdmNBSy9JK2poSFN0VXJkVUZJTktBeUJU?=
 =?utf-8?B?UWY1ZjIrNGk1QTYraCsvODQ5WjRUOHRrTXBvQ1NVTDBzb0NaeG84d08yS0tZ?=
 =?utf-8?B?eEtZWEtnaDdlS2RUWm9CZmRXZVprL3NVdmtCSnNOMXYxVHorTVhtQ3hjNzR4?=
 =?utf-8?B?TkJGOFhRdzYwZDEzTWdONElZZkRFbG9RQ0RsSXF6SjBtby9GQ0xZR3B6dHE1?=
 =?utf-8?B?UHlnOWx1Zm0zUU52UnF5dTRuSnpsekJqWEJpSytHQW9zYm5xWnVDR3hZc0t5?=
 =?utf-8?B?bHdBelRnck5wQjFVZ0pQODk4UTVzSDM1ZHIyNW1YaG9yMC9uYVByMzdZOHlD?=
 =?utf-8?B?eitZNFJieVlna0kzbnlDd3BhaXNHczZMdmVjbk1YSGJsRStKemJyeUxXOUhB?=
 =?utf-8?B?TXV1aitpcDZyYjhNbE01UFQyNENjd0RzeWZKdnpCVmtMVi84ZkhxOUJJTlk3?=
 =?utf-8?B?VG1uSUk2RW84UWNTbFJDRVhUNjVBbkVlTjBiSk5nWDlyZWVqN1ovUjkzRHdz?=
 =?utf-8?B?Zks3K0NRUTRHOG1DOFYzYnZiejNpMHozZDVXTUhLUTJZRDk5aVNUNHJRTldl?=
 =?utf-8?B?VGZVWnVkeGZaeFpnb0lkaTFGSFI5WHh5L2MvZDlEQjk5WGtRRGtsaWFnVGhk?=
 =?utf-8?B?QVBkZzVOLzhlZTBmcTc1YUxHSjBjYmQ1VXNLaXcrZmxkdi9PZkhiM0FnVzdG?=
 =?utf-8?B?amZzUHcvWEtwQ1ZFbnIyTTZ4bnBlK3AwcHNWS1NHM2RKS3pBWlA1Rm8ydmJi?=
 =?utf-8?B?Kzlhc0NYQ3d5ZGpDcWFWdC8yU2ZzbVdTWUpRb3VuaHR0MTVaSE5MNlE4ZlZI?=
 =?utf-8?B?UEZwZTVwbUgrRVpHMHZUbTNWdHd0TDZ6bVc0TElwTDV4Z1BSSXQxNldyZE5p?=
 =?utf-8?B?YnhiLzZRdEJaVnVDM3dxTWE1Wk10am5xYjREcE96M3V1UEVrUkd2dzN5bkF2?=
 =?utf-8?B?cXYyZzZBMk1JWmgxVWRvTzl5Q3Vtb2hmdWdETDJNeGVaU09Lb0crTHg5WU1v?=
 =?utf-8?B?a2dMTmNtK3NPVHVQeVU4Yndobm9kWWpEc1BIY3Z3YTdMUmdidlJuN2VUNHV5?=
 =?utf-8?B?Q3lndVdIYXNJSlBldFVTc0dBS1kzNTBTbHE2SXFaYlZPaEtXKzVYOFBkZ0gx?=
 =?utf-8?B?cjJkWnQyNnFsTGN0N1REWU9Qb3RrUitJaDRJUis0TGg0eXpocUV3alBsekdB?=
 =?utf-8?B?b3JYZ1Ziamx1NlJSK2M4VVVHdStBQ0VHdUlCVldDLzRTY05WVlRMQWZEYUFN?=
 =?utf-8?B?bHM4ci9DelVrRmMvK0hpTEJVZGlXZWM2Slkzd1dwbkVZSEFtdnp1TlpCbkRI?=
 =?utf-8?B?Vzc1dFZJZjhiaGhzSG9yN1RGbTlUaE91anl6bWV3aFFDMm9JL1cyTVcrM0lV?=
 =?utf-8?B?V21RaXJPbW1VOWNWU3QvdlZGa1orRVRaci9yUmhWeWtWV2RpbWZnK3RYWk9l?=
 =?utf-8?B?dFd2Vis5ZTA0U1d1czBNL3JvZC9ZczcxQW5sL0tGYmtxaW5nUjkvc1BHSG9F?=
 =?utf-8?B?Zkg3T3hMZktGbklTMFdzRzdGU2haOFJjRDZpOEQwNCthOUJTOWQ1SjhyeDJM?=
 =?utf-8?Q?JVhuuIMoO7J1KwRAbY8+d/bsGzul1Qs9gCXD+FD78lFwB?=
x-ms-exchange-antispam-messagedata-1: FlLK/d1JTvHJiA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2BF3EAAFA67184DA9E623223A48D740@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YieuBcZBgm3JlrppI7Qvkz6GzwZWxoxzjfB2DzHty6N1TfJWdr2F69RGejfG9EC8oVHsSH++7EJWkkH+AKSPkX1lL0Qk6YdgeyGZbr/cITTMcf4aQm+Y5LpPfyxe1jHjEWg+JARRBn99lAeLZCxDv4cRP+zPiBW3Kb7gFKy2uXbEopkOspJ7N7K5ugM5bCsnyxyx0zsWUW4MNIJtlHwiVepwAytn0AuMenrPt2Jk1BdoSfh0TAav22VHBF6QORlqJuXU2goVUAmpoh9GZfhtz21WzyeeQh9ZOcZ1rFmfkwzwh6FOUdOveK9inecnHaHCG2WzTMMZNwc/CfHQ/KxLXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4259a2f4-d98a-451d-9004-08deba8747b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 17:58:51.9592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQQoFIGsYplSaJYFSp9bMDg7uOiB3qGW9l/0ZFhovFKTK6cU6G3wPnvepqI3JNpIpz3OwYq6e9uY2yXdorUvPyJgYXIw8AEkv19JDPxoecQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
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

T24gTW9uLCAyMDI2LTA1LTI1IGF0IDE4OjE3ICswMzAwLCBMZXZpLCBJbGlhIHdyb3RlOg0KPiBP
biA1LzI1LzIwMjYgNToxMSBQTSwgSGVsbHN0cm9tLCBUaG9tYXMgd3JvdGU6DQo+ID4gSGksIEls
aWENCj4gPiANCj4gPiBPbiBNb24sIDIwMjYtMDUtMjUgYXQgMTU6NTggKzAzMDAsIElsaWEgTGV2
aSB3cm90ZToNCj4gPiA+IFRoaXMgc2VyaWVzIGZpeGVzIHNldmVyYWwgaXNzdWVzIGluIHhlX21t
aW9fZ2VtLCBpbnRyb2R1Y2VkIGJ5DQo+ID4gPiAxZmZjZjhiOGFlOGEgKCJkcm0veGU6IFN1cHBv
cnQgZm9yIG1tYXAtaW5nIG1taW8gcmVnaW9ucyIpOg0KPiA+ID4gc3BsaXQgVk1BIGZhdWx0IGhh
bmRsaW5nLCBhIHJiLXRyZWUgbGVhayBvbiBkZXN0cm95LCBkdW1teSBwYWdlDQo+ID4gPiBhY2N1
bXVsYXRpb24sIGFuZCB1c2UtYWZ0ZXItZnJlZSAvIE1NSU8gYWNjZXNzIGFmdGVyIGRlc3Ryb3ku
DQo+ID4gPiANCj4gPiA+IElsaWEgTGV2aSAoMyk6DQo+ID4gPiDCoCBkcm0veGUvbW1pb19nZW06
IGZpeCBmYXVsdCBoYW5kbGluZyBmb3Igc3BsaXQgVk1BDQo+ID4gPiDCoCBkcm0veGUvbW1pb19n
ZW06IGNhY2hlIHRoZSBkdW1teSBwYWdlIHBlciBvYmplY3QNCj4gPiA+IMKgIGRybS94ZS9tbWlv
X2dlbTogZml4IGRlc3Ryb3kgZmxvdw0KPiA+ID4gDQo+ID4gPiBTaHVpY2hlbmcgTGluICgxKToN
Cj4gPiA+IMKgIGRybS94ZS9tbWlvX2dlbTogUmV2b2tlIGRybV92bWFfbm9kZSBvbiB4ZV9tbWlv
X2dlbSBkZXN0cm95DQo+ID4gPiANCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW9f
Z2VtLmMgfCA4NSArKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gLS0tLQ0KPiA+ID4g
LS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW9fZ2VtLmggfMKgIDIgKy0NCj4g
PiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkN
Cj4gPiBDb3VsZCBpb19yZW1hcF9wZm5fcmFuZ2UoKSBiZSB1c2VkIGhlcmUgaW5zdGVhZCBvZiBh
IGZhdWx0IGhhbmRsZXI/DQo+IA0KPiANCj4gSGkgVGhvbWFzLA0KPiANCj4gVGhhdCB3YXMgaW5k
ZWVkIHRoZSBpbml0aWFsIGltcGxlbWVudGF0aW9uIChzZWUNCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjUwNjA5MDk1OTM4LjE2NzgyLTEtaWxpYS5sZXZpQGludGVsLmNvbS8NCj4g
KS7CoA0KPiBUaGUgZmF1bHQgaGFuZGxlciB3YXMgc3VnZ2VzdGVkIGJ5IFRlamFzIGFuZCBNYXR0
aGV3IEF1bGQgKENDZWQpIHRvDQo+IHByZXZlbnQgdmlvbGVudCBraWxsaW5nIG9mIHRoZSB1c2Vy
c3BhY2Ugd2l0aCBTSUdCVVMuDQoNClllcywgaXQncyBpbmRlZWQgbmljZXIgdG8gdXNlci1zcGFj
ZSB0byBhY2Nlc3MgYSBkdW1teSBwYWdlIGluc3RlYWQuDQoNCj4gDQo+IC0gSWxpYQ0KPiANCj4g
PiANCj4gPiBPdGhlciBkcml2ZXJzIHNvbWV0aW1lcyBleHBvcnQgbW1pbyByYW5nZXMgd2l0aCBk
b29yYmVsbHMgd2l0aCBkbWEtDQo+ID4gYnVmLg0KPiA+IElzIHRoYXQgYSBmdXR1cmUgcG90ZW50
aWFsIGFwcGxpY2F0aW9uIGhlcmU/IEFueSBpbXBsaWNhdGlvbnMgZm9yDQo+ID4gdGhlDQo+ID4g
ZGVzaWduPw0KPiANCj4gDQo+IFRoYXQncyBhbiBpbnRlcmVzdGluZyBpZGVhLi4uIEJ1dCB3aWxs
IHRoYXQgYWxsb3cgY3V0dGluZyB0aGUgYWNjZXNzDQo+IHRvIHRoZSByZWdpc3RlcnMgZnJvbSB0
aGUga2VybmVsIHNpZGU/DQo+IFdvbid0IHdlIGhhdmUgdG8gcmVwbGljYXRlIHRoZSBsb2dpYyBm
cm9tIHhlX21taW9fZ2VtX2Rlc3Ryb3koKSBvbg0KPiB0b3Agb2YgZG1hLWJ1ZiBhYnN0cmFjdGlv
bj8NCg0KTm90IHN1cmUgZXhhY3RseSB3aGF0J3MgaW52b2x2ZWQgVEJILiBCdXQgdGhlIGV4cG9y
dGVyIGluZGVlZCBuZWVkcyB0bw0KYmUgYWJsZSB0byBzaHV0IGRvd24gYWNjZXNzIGF0IHdpbGwu
IFRoZXJlIGlzIHRoaXMgbmV3IGRtYS1idWYgcmV2b2tlDQpmdW5jdGlvbmFsaXR5IHRoYXQgdGFy
Z2V0cyB0aGlzIHNpdHVhdGlvbiBBRkFJQ1QuDQoNCkZyb20gbXkgdW5kZXJzdGFuZGluZyB0aGUg
YW1kZ3B1IGFwcGxpY2F0aW9uIG5ldHdvcmtpbmcgdHJpZ2dlcmluZyBhbg0KYW1kZ3B1IGRvb3Ji
ZWxsIG9uIFJETUEuDQoNCkJ1dCBJIGZpZ3VyZSB0aGlzIGlzIHNvbWV0aGluZyB3ZSBjb3VsZCBp
bXBsZW1lbnQgaWYgLyB3aGVuIHRoZSBuZWVkDQphcmlzZXMuDQoNCi9UaG9tYXMNCg0KPiANCj4g
LSBJbGlhDQo+IA0KPiANCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gVGhvbWFzDQo+IA0K
