Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE44EE01F3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 05:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E470110E179;
	Wed, 11 Sep 2024 05:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2puqA2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B2710E179
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 05:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033555; x=1757569555;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lntuQL1V0D56YXKna0+A6Yhyv5XzncSx0B6uhQ1lFIY=;
 b=l2puqA2KlHRgvTI6u543MuiBpZVMrdi4sQcbGpRQyn5Qd9FnWgPWr5oK
 BiHrxdOpjaMqG6at9n3QlKwBsllVsCyOgCZwaBYpbDAh5iW8Xfkr7fvzw
 JIjIxYxm6DsF+12AOMswtWHNkoRw7rYqBb9h1OBHzA9ExicFqEJrQnEBF
 1+YEbcZumD+bhvD+jOlNZ+Nns1p2ArW7ZB+DgrfOyj19XBKQiKqicTRQl
 bu/hmDnz1z6W/AWuibzd65uM3n1CzLJaR5ZB+7kfQ/dhkdZw++Fvblz11
 UYSFWyy8wYdXsE3x9LDagbYT5k7ZXRDwiLfBVAvFSDiOCS39SWQnF9dld Q==;
X-CSE-ConnectionGUID: eZ72cH8KRgyC48EwFrUsLA==
X-CSE-MsgGUID: wFFdX469Rwe7dZ57GsCW9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24688662"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24688662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:45:55 -0700
X-CSE-ConnectionGUID: P64S6h8XTc2ePbwCkl0anQ==
X-CSE-MsgGUID: yBJ1XyMhRqyK4fQx9ptgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="98076264"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 22:45:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:45:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:45:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 22:45:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 22:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1WFflQuHjXJ7xUTeFsjbCCyMXdyq+VX/OzZKAkxp8CGOBVhScq5CMXIQLIw8ZwHHCRl5/DVt9DrihJDqRw+n9LyHHeccKH85YVLcU4gbRIUaAh+UNNpEIQeWt1/EebMHmP7ibeaJrnlgv4lesvpqCiUo4tNSY6xTbKlqOlA3GKiKtjkO0Bpo1VXobmypr3QlUqgCAWsraqxFU98PgEyNnVkdTpXfl31J+/Y5Spl4OWaqeRW29tQO02wUJf/XRXRjERVNi1BoC6xjAEwh9mOaW9qHVs+t7aecgi9GzbSxZcHC/aQmGaFs4lg0+cZQ/dwJuCK+NM8682IPdFPyKUoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lntuQL1V0D56YXKna0+A6Yhyv5XzncSx0B6uhQ1lFIY=;
 b=LSwzY0u7nD1PZDgHxE+5I6A4Bx68ZoCqIEYtSvz/OmA27e6aFCicDm9qFsSQQeDoaEvV1GKj7pgOQVH7/lkT30FK3swsHhrhFuFqqNtQK9JRjlbMWA35lv24M0ZUlmdpjTtOrGK89NvzxKK4yAFpW9ForxXv7QjqsSFnVMatU9Hm3wcQ3k3fJGXdMdLS7jbYdY21pp0eG2OAYONjg6rPzrpL3LjttUtJdvrR1ZBNyx6pmxVA62hzYhw1A4WtnnkOGq86XhIAUZntKooN4ApO6ibQMgMeCgTeIPkAQ+9j6KSD5GAVCbnysM2lyyvquAJrgC9VPfuFuJyjx1QUCxIrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 05:45:52 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 05:45:52 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH 3/4] drm/xe/client: use mem_type from the current resource
Thread-Topic: [PATCH 3/4] drm/xe/client: use mem_type from the current resource
Thread-Index: AQHbA4MgXh7pBsuX8U2JZCuFIUoVnLJSFE1w
Date: Wed, 11 Sep 2024 05:45:51 +0000
Message-ID: <SJ1PR11MB620487ABC6F880A9A5A8ED9A819B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-7-matthew.auld@intel.com>
In-Reply-To: <20240910131145.136984-7-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB6756:EE_
x-ms-office365-filtering-correlation-id: 9cdcac50-e823-4b4e-d7d6-08dcd224ff16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dkRacE1NSGZCRlJmRW1LZ3J5OUNzcGpyOUM3WUwxRTZFZ214YU1ZRHR3V0xa?=
 =?utf-8?B?K2dnbnhkNzE0Tkw1Qzdvbk1OVDZZRGRqUGd3L0t4c0RCc2JadFpacGJBNzJt?=
 =?utf-8?B?NHBITTFTRVJkdEdwUGxwU3BnOE5lcGFCSEI0cmgrM1N3TmtIWU9ibHYwMml5?=
 =?utf-8?B?MjBwRGtRMGRYcHA2SnRDNThBTndocXBXN3o2bWdSc09DU0ZFQWsrOVRheVFh?=
 =?utf-8?B?cDF6Q0x0UTUwdjJoQUt5MzFJVkIrR3I4QzZGNUtzTFdJWDY2SVgvR1QxdktK?=
 =?utf-8?B?STBKT1hiT2FJalZ3c3JkdDFKM2pXUFREUmlGWGpncTJxRjRGU1JNYXkrc3dM?=
 =?utf-8?B?NHJqUFFGSk1WZHhtUElsb2lBUC9PcmtjcXE5cDVxS29sbGs5K2tMUEs4Q2RU?=
 =?utf-8?B?MWlDMEl2aDM0aDEvTkl0dncxcmVTb3JXSm9lNjAxQ3JJTG11RjRKanZtSVZZ?=
 =?utf-8?B?dkNtQkZ1M1plMkcvRHhXMEZIbDNNcGo1VVViS0MwWEtnaHZPbFpRZ3pDMzhD?=
 =?utf-8?B?eXJyUkVtSWNOaStHU0grdUhzRXk0SlEyNVJIbHNkakFMVzhKd3BjUHcvQ0RQ?=
 =?utf-8?B?NWlRelVRZ002RkFwK0ZZUlg3bEZxaDZGbUpFcE1od1dSQnBJcDhvbmhPOFhp?=
 =?utf-8?B?U2xFczBpYzh3aE9Nb1llbGxoNGo3Rys1US9ZSU1aaXpIamxIWWJmYUlJVUoy?=
 =?utf-8?B?K2xpVlNvZlNUWi8vRFZSb2JCUWxaTlJNQ2dDVUxsd1hBeGJHSW5ueTZKcDVz?=
 =?utf-8?B?MzBCa2JPTGRQTEE1Vk11SUhmL2lOQkFMbEFXS1dvd2U0cDQrbWtSRy9TUHF4?=
 =?utf-8?B?MTNNYzNiRDBxeDBMWVRuSDQ0bm1FVDI0OU5aS1U1SHN6WXVWamlpcU42dHpP?=
 =?utf-8?B?UjBiN0syNE5GMTMvNnk3eW93YUhlN0ZGcDlERmhIUmNMeWZPTHp1TWhhSitZ?=
 =?utf-8?B?Y0h5YnRTSHFMR0RtN09DTTR6UjFiL2tUVEI3Yy9tZWdxVXR5alUzcGpkeUk3?=
 =?utf-8?B?Ykc3QlZLSWU2SW4xN3l2Uk9LdHhXcldWVGE4bWJkdWMvN2dtTnpDYlB3WmhF?=
 =?utf-8?B?QlBnVWlEU1R5Yy8vaFp3d3lIQzlCR3dtV1J1d0FMc09ORDlROGIxdmlQbHBC?=
 =?utf-8?B?cnVnOW5kZTJTWldyZDZaaDUwR0Rkby9JdGZ5dE9McjZGZStwN1Q1emJOaEZ3?=
 =?utf-8?B?VnhuRktWeHIyZEpvNW9zMmdlSVVCUXRhYnhRc1hMTjhjc0JSc3NoWVhjUDBR?=
 =?utf-8?B?a1FxU1RoenBoNnowMVg5cmwyOFh4SkJSMnp4dmp2QWtXSzdTbDBnZnZzQldo?=
 =?utf-8?B?ajFQakxWbFZiYm1wRDJXYTFBVzdUWllwbVhXcEpQSnpkVWVqNHBzOVFHbXBa?=
 =?utf-8?B?ZDZuS1VHS2REM0hzenNIV0Z1Tk1oRDVLcDJLZXpvNTMxTlBRcnM0TDZucUlj?=
 =?utf-8?B?enJSN0VCUW5PazNxeHMzSjZMeWhEbngzS1pvTHRXQVFkN0dqTEMxRkMxYVVp?=
 =?utf-8?B?NXR4QmM5a3g5V0hTUW9KZk1tRGJ3WjI0aFFGZ0JCL0lDSzlSblEybk1FdlRL?=
 =?utf-8?B?YlZhdDBZNHhROWJtV0RoZDFWS1J1VThIRFRvcWNmdEtKcWR5eFFPdGNEeHdZ?=
 =?utf-8?B?eVpiRzhXZHVGc0phK3JRWFJDTjJUVzFwVW10S3I3Umg4dFpSQ3dmTkhrWVda?=
 =?utf-8?B?MXRUTFB6MHJZMEVpa1FxN09kT0xBL1l0UnY0anBGSXN6RjF1OUFQSkhnUjVx?=
 =?utf-8?B?OGRZR2lMY2ZvWjVSSjRCZ3dWWkZqMjVROUtoY25USUxYem1JTUVCNXh5Nndw?=
 =?utf-8?B?N3JIeVFSY0h3TXM0a1UzWkp3QUg5SFJ5SUVOVFZzSGJUZzM4TFdkZDNsVkpR?=
 =?utf-8?B?M2Vyb3pyeEtMczZOSGRzWlpQK3hlSmRkaTVyU2FVUTZvS3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHpJeTBJcjEwRFFEeGdmQkZMamNkSU1MN3Y3SzF1MTNTdUkvN0FBZHdON2Nt?=
 =?utf-8?B?RXFxekx6Q2FWY1orSmpDY1JPM2FDRjY2cFcrY2NLeGkwcm1ZbDdENFFINUtx?=
 =?utf-8?B?bGpYNm12dWlueGsxbk9qL2lhUG5yckdteWhyQUVXWGwwOXp1UUNFTFNGYXRi?=
 =?utf-8?B?OWlXazRvSzZLVUVLSEovZURVOGU4S1RMSEtsNmJhbHlaQ1hTTEk4QitTZitx?=
 =?utf-8?B?SUhjMEVuNU1JbDhpMC9lM0UrbGZFblhxUDVYc2FEbnVWSnE3cDFyNW9nN1Jz?=
 =?utf-8?B?Z1BBdmsyZWZBYnBpbG5HU2hMZGFycTJtNVdid2FSOW5mbU5Cd1BFeDBDalVJ?=
 =?utf-8?B?RHVkd09sVGdJNGhSV1RHdXlHMXpNSXFvNUN1dGkzYXQweHhCUWRvMXZDekpB?=
 =?utf-8?B?bG9RNTE4bUJpcEtlaTlOUndaRjZTeDlyZjFaNFluMlowdkxXbjhHcUtrcHNz?=
 =?utf-8?B?Qk9jdUZtR1h3ZTRUakk2T2F6dHBWK0cyVnk3YmFiUXlaWVl6QVZvcy8zUXJi?=
 =?utf-8?B?c3F2c3M0bUMyVkg0d3hJR2JuTVh1YXpGemlwV2lzZHZUZ2NiNVZqLzNmYjFB?=
 =?utf-8?B?aWp6RHZ3OVRNZEZ4by85c2NIS3J5NXJhNnZHMXNBSlEwSU1HTXpqM0N0cm9r?=
 =?utf-8?B?V2YxeUwxMXZobFk5NzBtdzhjd05XczhnMCtDdGYwYVFWNzJ5UVhFUzBLQnJR?=
 =?utf-8?B?bDJxMjUvN0FVYjFRRWNPRGNHNUpCTHNuQVA2aXRENUFydjM4bzZUc2VndGIz?=
 =?utf-8?B?QmZFc0dDWVJUSC9VSVZ4c1VNQ1F2eTZQT3RhT2hYWVprY3Jrc1Vyc3BBNE1h?=
 =?utf-8?B?U3BlUks0bUJKNlJ5S0F5d3YzdUVxTXRVamdqQTE1VEJvSXRHOFdLdnJNRzJO?=
 =?utf-8?B?c09wMTN5MURUS3JFZnNUbExHYTdFTjdNZTc2aUVrckdoMG44eFdZclBna3ht?=
 =?utf-8?B?V3NiYWMrMW16dFE1ZjlOaWo3NFBJYzV0aFRDVHY5RzhCVUR3QnRDK1ZDYlVX?=
 =?utf-8?B?b3hsaFoveW1NeEc2SGhZQWtZQlB3Z0UwRzlhTFpGbG9TaWZFN2c4K2RqRThy?=
 =?utf-8?B?YlI2NzBYQldaZTN1azY4bzk2eGpROHp2RGdnRmpjdEpuS2FIRS9vN1lpQ2RW?=
 =?utf-8?B?Y3M1MjZiVlgrVHFrRFNuaEJRazcwWlFXU2NGcjVsWGVXcVcyemZ6UDFIWDJt?=
 =?utf-8?B?UU9QOXdkVXZXb3czN2g2R3hBWWt6OHZ2akxZdk83bk5Na2loVTU3dW9XWXZa?=
 =?utf-8?B?RTBrYW5iYWFaKzVvY05sbllENFBjNmFwdnBYWlFwZHpKRG1iTVZ3bzhsdUdG?=
 =?utf-8?B?SjZMRmJ0S1NxSEpVVWJ1OFZkUGRRb0d1RWF5L2JaUHcwL1MxMzc5Uk4vVVBI?=
 =?utf-8?B?VVpLdHU3ZU9LcnFMN0g3VTZPT0tQZXc3ZWplc01JOW5qb1Uwd2lPaUdtZXU4?=
 =?utf-8?B?aUFjc3IybUhoaEVlNngxcTZDenhtTmN5ZVp1VHlLR3V4dkZoUDRnUGZWeEM3?=
 =?utf-8?B?OXlYU0h3V0JWdWJPWkVvMmZtelZ1MGEzOUxNOW12Tms1LzBYNk1EM3FBNEtT?=
 =?utf-8?B?aFMyc2JnazNJNzFGeWQydEFSQXA4L0ZzNE1nU1ZvRVRXenFTQjBhb1pIWklF?=
 =?utf-8?B?Y3lxcU15TE44bXdwNWtWVkF2aS96M0lyTzk2YzlWU01jRCtidk9vSDJZZmkx?=
 =?utf-8?B?b2RqbG9sTnYrMlJ0a1VHVkNvbWtsb2JNUEVjOE9HVEdXMHZOcHBWaXpaNThp?=
 =?utf-8?B?UTNPTDRlOFkyZ2lvZ2FZZWRoeUVhUnh2SzFuZ3pJaFRVNFBLcU1oTHA5TlR4?=
 =?utf-8?B?bkcyUG56V3p4Q2lwOFVBMVpzY3hQYXc1ZzhyUitnaXBRdEU3WUl6dmJ0cTVV?=
 =?utf-8?B?VU9zbWJLVkRQM2ppb1ljclpLbkhUNkxPMi9za0N0MVhwLzJHLzhEQ3U3eXJH?=
 =?utf-8?B?WFlQZkMyREx5T2sweDZDaEs1TFl5UUtsRTZ0TTFRT0F0TmpyMHRNUVFqa0sy?=
 =?utf-8?B?V3hXWnFidTRBM2RDWjJMVzJ2b1lVZjFQOFErbCtBRkJIeXRmQVNhckQzSzRn?=
 =?utf-8?B?ck1hRlN2UE5BSUhqSnRpN213WldvQW4yRVNGelNaUW84djhVdjlwY0ZheGZx?=
 =?utf-8?Q?2Wc0eK5aEKwvkAFTq3p22w9K2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdcac50-e823-4b4e-d7d6-08dcd224ff16
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 05:45:51.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vs51cGCucWeBGMRatI3CXfhuJeEKmFI8M3ttO7Uzxnth/cBNKY2fxDyIgjIIN2Lhu2noGhvFgWRw6t3ghwK+fBSdWWv5AWoJtHeuqavKGLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAy
MDI0IDY6NDIgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
R2hpbWlyYXksIEhpbWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT47
IFVwYWRoeWF5LA0KPiBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgVGhvbWFzIEhl
bGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggMy80XSBkcm0veGUvY2xpZW50OiB1c2UgbWVtX3R5cGUgZnJvbSB0aGUgY3VycmVu
dCByZXNvdXJjZQ0KPiANCj4gUmF0aGVyIGV4dHJhY3QgdGhlIG1lbV90eXBlIGZyb20gdGhlIGN1
cnJlbnQgcmVzb3VyY2UuIENoZWNraW5nIHRoZSBmaXJzdA0KPiBwb3RlbnRpYWwgcGxhY2VtZW50
IGRvZXNuJ3QgcmVhbGx5IHRlbGwgdXMgd2hlcmUgdGhlIGJvIGlzIGN1cnJlbnRseSBhbGxvY2F0
ZWQsDQo+IGVzcGVjaWFsbHkgaWYgdGhlcmUgYXJlIG11bHRpcGxlIHBvdGVudGlhbCBwbGFjZW1l
bnRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50
ZWwuY29tPg0KPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWly
YXlAaW50ZWwuY29tPg0KPiBDYzogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVs
LmNvbT4NCj4gQ2M6ICJUaG9tYXMgSGVsbHN0csO2bSIgPHRob21hcy5oZWxsc3Ryb21AbGludXgu
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xpZW50LmMg
fCA3ICstLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVu
dC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuYw0KPiBpbmRleCAzY2Nh
NzQxYzUwMGMuLjU3OGQyODI1YzFmYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RybV9jbGllbnQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVu
dC5jDQo+IEBAIC0xNjgsMTIgKzE2OCw3IEBAIHN0YXRpYyB2b2lkIGJvX21lbWluZm8oc3RydWN0
IHhlX2JvICpibywNCj4gIAkJICAgICAgIHN0cnVjdCBkcm1fbWVtb3J5X3N0YXRzIHN0YXRzW1RU
TV9OVU1fTUVNX1RZUEVTXSkNCj4gew0KPiAgCXU2NCBzeiA9IGJvLT5zaXplOw0KPiAtCXUzMiBt
ZW1fdHlwZTsNCj4gLQ0KPiAtCWlmIChiby0+cGxhY2VtZW50LnBsYWNlbWVudCkNCj4gLQkJbWVt
X3R5cGUgPSBiby0+cGxhY2VtZW50LnBsYWNlbWVudC0+bWVtX3R5cGU7DQo+IC0JZWxzZQ0KPiAt
CQltZW1fdHlwZSA9IFhFX1BMX1RUOw0KPiArCXUzMiBtZW1fdHlwZSA9IGJvLT50dG0ucmVzb3Vy
Y2UtPm1lbV90eXBlOw0KDQpCb3RoIHNheXMgY3VycmVudCBwbGFjZW1lbnQsIHNvIGltcHJlc3Np
b24gd2FzIHRoZXkgYXJlIHNhbWUuIFNlZSBiZWxvdywNCiAgICAgICAgLyoqIEBwbGFjZW1lbnQ6
IGN1cnJlbnQgcGxhY2VtZW50IGZvciB0aGlzIEJPICovDQogICAgICAgIHN0cnVjdCB0dG1fcGxh
Y2VtZW50IHBsYWNlbWVudDsNCg0KSG93ZXZlciBMR1RNLA0KUmV2aWV3ZWQtYnk6IFRlamFzIFVw
YWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQoNCj4gDQo+ICAJaWYgKGRybV9nZW1f
b2JqZWN0X2lzX3NoYXJlZF9mb3JfbWVtb3J5X3N0YXRzKCZiby0+dHRtLmJhc2UpKQ0KPiAgCQlz
dGF0c1ttZW1fdHlwZV0uc2hhcmVkICs9IHN6Ow0KPiAtLQ0KPiAyLjQ2LjANCg0K
