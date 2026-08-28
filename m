Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120F5C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 19:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65010E045;
	Fri, 28 Aug 2026 19:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+feQGF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F316F10E045
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787944011; x=1819480011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v6eRaUT086nNYyA4Bwn8qqML+rWlApivQrsz9ha5Qow=;
 b=f+feQGF7Dgi34yw56BVNdMc2TpgFx3vaoQXrUzhoTkvFASRio2tL4O7e
 gupF7WpRou6puf38F9d5KRjCYMWnrBNsgTVLF0zaSOjFWzi8DlKDFT8dV
 vWBwzcuqffjvZRrSw2VkUvDudOmn72O4OX7gYIAYMygtkkEe4/lRFpZvM
 QycqqBMvzR0hjQcL0mq7CGlRkfpNbvT/h1XjDZN+X8q04zgSq/abcZND6
 mN5sPKHBo4Vm9yTuOvs2w1oxRIcyKT2squ2aIooODKmBOShFgB4bA4mPy
 2cHRi1IZCxFNte8Dgu8uuqGaPX5nUcI/gEjcO8CJRaa3IG57zny4TxxZW g==;
X-CSE-ConnectionGUID: F9XRnzvtTGS6GHtjg0mRjg==
X-CSE-MsgGUID: v8tUWlGjTrmHVpbS4EuA8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88482893"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="88482893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:06:50 -0700
X-CSE-ConnectionGUID: gEquWvjHTvatWtPYVWm3Ag==
X-CSE-MsgGUID: NJG9R9aZRz+QmeqIcbUX1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="293038148"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:06:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 12:06:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 12:06:49 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 12:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKdYIJ7B0sXHFRQzM/IyIQyeBePy2q0B+wjIQzWNrN6pAvCco9W0os2YOu3xjfh7HxEE3wT/ECIrKEAkF4dq+367XHmO7L6bzi+wcuq/4KOnXpUMnHMMAHFYo7JPIIgE1hEZufzBcLmLmsrDv7orTYmrEPK1Sq9dmq5zXb2Be9DTUTjSm9BU62HIlSSSr3kQFORRMZcquGbwhOzPUwEZhLszivEu60IekkOXCMSmByFIQa3k75yCR0yPzThADj84t4vQLu03B059IaepHK8po39DFkN6gfnm4FuVKy97j+oWbtgeGSv5k7Y0/qwGUbLT9vCe1lUvSWhfwmy8EQHUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6eRaUT086nNYyA4Bwn8qqML+rWlApivQrsz9ha5Qow=;
 b=bW5T5mzmspL/xSSKw7CYnai+OaRsuzkQMoCWtRy1vVmihscuzmaASXoRdLsVf4n17avAYJmOawXYZt7Wfm0lF1nTIoZNV+c8Z5IT6ZC0iqfOZT8SuSSZUb60gTqjGvLnUd0n2vflpZge8D2EFzYIA9BSgjyvB11mOjZCM/oKaMTIGzVj3Ovic0n8Kk/fFFyZX5DFW34wGq69XHMAfge+UVVY1MAkHlcH5le0q3IJFXR6+j2Ycfu3nV/vk/jsdVRYFbhGmTj6aeY/SbKlxU3u9GjhpNk706vDy78QZ+4AFlDUt2kXi0gSZ276FdOQasLOPKuQ8KscsjuPriSIKTQ5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 19:06:36 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:06:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
Thread-Topic: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
Thread-Index: AQHdNWIhqcG2Kahbik+HCKL0XhAJsLayA1AAgAHQRrA=
Date: Fri, 28 Aug 2026 19:06:36 +0000
Message-ID: <DS0PR11MB87181738381AA50FBF60B4E681AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-28-tejas.upadhyay@intel.com>
 <c0ad1040-6155-4a7c-a92f-ea263514ae43@intel.com>
In-Reply-To: <c0ad1040-6155-4a7c-a92f-ea263514ae43@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: aravind.iddamsetty@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DM4PR11MB8129:EE_
x-ms-office365-filtering-correlation-id: 3863f0a5-971b-4670-4cf1-08df05377ba9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|22082099003|18002099003|38070700021|4143699003|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: Ht9u3bhlQkCmHpJNSqCtpfmmamt1NbDkyowgtZvbEf2IE+/xgpao6zdNG/laU8bjlD9d3Yad40uIxFziI+w0N1tldJE0yxfF4ZM4HYt/aAPLD8Un4qjO9+JbDA3AZRx7cOJvOpzsF5kTRivrQ/648RHeDtd2TeZuVt1lYv+OrTKRC2wQoLDGIJVYsLyLzJXlMOhC83TvlsLDFtwAL62y/IyJXmFpZepeU01/aGn6/QSzifRdn8y2b/QypmQOXq+3SUJVb0+Kx4EdLB62gZhpQ94/scnT5KPhwyAKAQZ2frU4OGKNu87c4GLBlcmvzQwmP86rNJXXeIfvsr+Nd0aV0FSzuPlMHMHmVOJRdMYaf1tPPgz+mbp8rN7pxQtSiXX4vmMmzP7BfXwS56vxs2/kjRONiSHKRdIlyi8H3PvyjZMBcSM63IZfi4Gwo4nfUyP4J4baCRIBq53vTY4vqmT+lEA/NwR7xMQ670U/FBdSo8kcoKbl1m7TjgFo0/gqT0oslX1V9gh9FNOm4NjGh/pJo9F8vzmnsU0FTOpej6lUJMg7paoU5qS2CWuuZ+SWmPs5ZIWqGEgJk7JQLR3+N+aLYmN6VutixIT/ly+cCnzVEZQuOXgnMTzmzdR6L50SCxBqSvdYTopS3D4DHPSoQr9GpMe1Novvyhu2Efw/B6a8VS/NnTMqLTLLo+fzTLCVcp1c4PUxbImXT9/zKhSCZnjv40zHWTWD65fwU1LauA2NHig=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUVjU2ZHNElNNWErK09mYWdWVklRbFFUWDVVWnd6YXNVWERkaXlKblJ2dEc2?=
 =?utf-8?B?KzJRcUpBKzh2SWdRMkx2VTI3MlVKTEN3TThmYXhSOGJNR1B5R0k4NDBnTHFO?=
 =?utf-8?B?ckpCNnlaUGJVQWZtcXQ0TittcElCV1M4Y0dreTlMbkFIb1FlV1BsRnptOGdn?=
 =?utf-8?B?dmNNOFo4cXZXUElnZDdMc1REQ1FUQnlPcXoveTJHVlJJSys5NmNza3lCRVQz?=
 =?utf-8?B?NUgvNFVJOWh1Z2ZwME1iNTlISjVVZEl6enN5UHZhVHhLMEtBMnBFZWFVTDMw?=
 =?utf-8?B?QTEwMm9hLy9zZ3A4dGd6aXJNQTMyZURZMGV0NTFzTi9JTjhFL0p0ankrZmR4?=
 =?utf-8?B?dE96K1JSRFhoWVdNTTVCSlVMWlZHdGJLVFd1QlZKRFVFQ3NrQUpWNnJjbTRM?=
 =?utf-8?B?cVMydU1iQ1V5UmJ3L1Z3VFNWNTNZRlBVZjMrazVJMzgwZjM4MGtvdzRyL1ZM?=
 =?utf-8?B?anhZYXBoRkVvTDRQZktHWUoxMXNqNitFd3ZGUzNCNHFSbzdMTlVVcE5aTFFr?=
 =?utf-8?B?V3VWUGpFcXQxYWM5SEdGYmR4WE1mOGoyQVZHNGN4Mno3cWF5NWgzOFllUGlW?=
 =?utf-8?B?dFZBeitPZ0dTOHloRW5DLzFRazlCTHlBUE4wTHhDQ2pxOWtJbHJPS3RHM2tB?=
 =?utf-8?B?RHNRUTgwVnlTUGt4RVpSRjBuTWVEWEhKaU43S1ljZUI0VHJCZ2s4UDFRUDlT?=
 =?utf-8?B?TDNhRzJTUk5LaE0wUkNYWEUvRXBTb2FhOU1KSnFOSE5vUVZuOWFwSVk0Z29R?=
 =?utf-8?B?dFlGc1Z0R3k3cEMxWEd0LzhsYjhsZm9hNzQ0akRGYkF1L2QyNUt2UFRQNjly?=
 =?utf-8?B?U3hTbCtnWVQ5M1BxcFVRRmQycnNoU1Iwbi9pNzBVQVl3TUIvL3FoVHRwdUZV?=
 =?utf-8?B?STlVb1ZWNFRhTUN0c0M1UnFHWWJKa2JabUtNWDJtRzA4eHI1cnNTUzRNWGY5?=
 =?utf-8?B?NHQzbUt4VVNSMEI0THdXL1pjL2lwWHBWTG5jNlBMdGhCSXdsS3RTN3pvOVk2?=
 =?utf-8?B?YlY3NSs2MHB0N04yRGJGaE53bXZEZnNKNVRzLzJqQVVXVjhlN245TTQ2Y3BW?=
 =?utf-8?B?Q0h3WkJhUlFZQ25xMFlYelJWTVUvS3AvRU81Uk4zZzNlYzV0aTQrSEplQ3NK?=
 =?utf-8?B?ZnlkVUxnNjVxaWNPa2Y2ZEhwTWxPMUdQSGdyUmkyVEJuSXd0K0xFOVlFb0Fi?=
 =?utf-8?B?YlJvNld1eWUzVG5MK0pCdGNRZlpnSjUvSThDb2VxbEZhUHZZblNObDUrajhN?=
 =?utf-8?B?VytuNitHNGg2YWJhNzZrUlVmckZZRG9jMFJOMklidlpLelNTdnN2ZUVsK3B4?=
 =?utf-8?B?VUVWV3NzeXV2bm1abFFpMkdIUUhocElPWDk1YkdSVHlLbXoxYXRTbzBuS1ha?=
 =?utf-8?B?ejl4ck9tNjNrc2IvS1IzZE12OXV0NE9FbDN6K21kMlFaYWJhZzRiSWRrbHRY?=
 =?utf-8?B?cDRRUTN1dEY5VGl6UXNJeHBPOHBPZ1ZUa2NHQkJZSnVZSkh2N2ZMK0FuUE9B?=
 =?utf-8?B?T0FnM1BIcXV0NTlBYzFxclU3NmpRQmkreEEyR05mZ2MrUlp1Q0Y0OXlrNFd2?=
 =?utf-8?B?RjcxRUtkQmc0NE94dXBSM0tPSHRNVGVZWklpbVE0U3VUdEpCRzR1Wi9Xc2lt?=
 =?utf-8?B?QXZ2dWFkU1g2SFhvK3FzVVhQTlh6V1NyWjBOdXJjaVZCVUxRaEMwOTJqSXYx?=
 =?utf-8?B?aFo1ZEo2ODc1eHVRZnU0QWIybG1ubHVXVmZFUTdLSXpvL0FkSVdxalZvODF6?=
 =?utf-8?B?aXp2eit1UUVjWlBNRklZbDJtdFk0dXk4UmxvODlreENPYUZpcTJTTXJlNmcv?=
 =?utf-8?B?TENIWUpoWFFFYWtSL1dtMnIwYnJZVGc0enQ3blIyV3VlUWdLT2p0WUZEZnZC?=
 =?utf-8?B?c2JrcVpJUVpSY2pBakR3a1FESGt2am9Wc3o0K3d2Q21IU1pSVlR6M0R0dVlj?=
 =?utf-8?B?bTMxaUVjaElKR1ByenljbzgxN29HU3dGQk8ySEhHM240ckJ6MVlUUlNLWEhC?=
 =?utf-8?B?bXMvRzdqblQxQnhSSG9kOU1nL0JzWGtHQit3SnVjVnJQVmlKL3k5Zm9tUUJq?=
 =?utf-8?B?dzVrd1JDTzNPRDBVQ2JnV1VUOThMbGRORUNQVkw5aTNqa0syR0RCNmx5TnI2?=
 =?utf-8?B?T3pxNUx6SVhhVHB5b0dBajVKSkM0eWRXT2ovdEJZZm1zelEzNXlnb0F0cFlB?=
 =?utf-8?B?MWpPeGpwNmRoTzRjLzNsMDBISEVjVERub25WY0czRUdtOVlIbzBScmpxSWd0?=
 =?utf-8?B?NloycGtSOHgybkhQK2NiVGRMNHlqcTJmUS9GWUV3NTF1SkIyMVoxTTZaZ1ZY?=
 =?utf-8?B?ZVk2T3dYY2JRQVlwaVZCdW5QaXVraUxIWXBHM0Q1cXRuNjZsaDM4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ME75QXXPSJpWgnJaYUK4MvoDx5vncSBXZADhpJABV7SPg+7cvQ4+opTu5NTcBJKcRB8RV6tvVpyCDaADDb3fv2wu/OKEZELKBPDztD2PpOeRMFMWTkrM2ql2BeCNYat12Hp/o4mP5O9pg2FVOD+xvmrQafz0JOtT3DNPV7PoA09bPrbj0GByv1ISl3JlDYG5x2icVhSNJca51ESll5nw0fLlYJaGmWJEIVFfmx20psewosGFWKVDFkKZhhEAPIi4tBVVSTdgC6HUX8JzcsckCliL16wbk2S9gHre/JK8aJZX33hE4HJcpazNcwxiMUopOZHnNPgL5oFqLVwRZeFjKg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3863f0a5-971b-4670-4cf1-08df05377ba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 19:06:36.5299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7vZ62wa1CAHe39CwTbXQVRf7XnuBDqVhr63vcNDlBZLkjB/TmpmKc9lN9R+4sv5e9wa2OLf8E3nC4dDWwY0VIO2sTPQLNL8SJm6/gyeUa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiAyNyBBdWd1c3QgMjAyNiAy
MDo0Nw0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBp
bnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBHaGltaXJheSwgSGltYWwg
UHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0K
PiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMTggMTIv
MTRdIGRybS94ZTogRXhwb3NlIGJhZCBWUkFNIHBhZ2VzIHZpYSBkZWJ1Z2ZzDQo+IA0KPiANCj4g
DQo+IE9uIDgvMjYvMjAyNiAzOjUxIFBNLCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBBZGQg
YSBkZWJ1Z2ZzIGZpbGUgInZyYW1fYmFkX3BhZ2VzIiB0aGF0IHNob3dzIG9mZmxpbmVkIGFuZCBx
dWV1ZWQNCj4gPiBWUkFNIHBhZ2VzIGFjcm9zcyBhbGwgdGlsZXMuIEVhY2ggZW50cnkgZGlzcGxh
eXMgdGhlIHBhZ2UgZnJhbWUNCj4gPiBudW1iZXIsIEdQVSBwYWdlIHNpemUsIGFuZCBzdGF0dXMg
ZmxhZyAoUj1yZXNlcnZlZCwgUD1wZW5kaW5nLCBGPWZhaWxlZCkuDQo+ID4NCj4gPiBleGFtcGxl
LA0KPiA+IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC92cmFtX2JhZF9wYWdlcw0KPiA+DQo+
ID4gbWF4X3BhZ2VzOiAxMDAwMA0KPiA+IDB4MDAwMDAwMDAwMDAwMDAwMCA6IDB4MDAwMDAwMDAw
MDAwMTAwMCA6IFINCj4gPiAweDAwMDAwMDAwMDAwMDEyMzQgOiAweDAwMDAwMDAwMDAwMDEwMDAg
OiBQDQo+ID4gMHgwMDAwMDAwMDAwMDgwMDAwIDogMHgwMDAwMDAwMDAwMDAxMDAwIDogUiAgIOKG
kCB0aWxlIDEgYWRkciAoaW5jbHVkZXMNCj4gdGlsZSBvZmZzZXQpDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jICAgICAgICAgICAgfCAgNCAr
Kw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMgICAgICAgfCA2Ng0K
PiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1f
dnJhbV9tZ3IuaCAgICAgICB8ICAyICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92
cmFtX21ncl90eXBlcy5oIHwgIDIgKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdm
cy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jIGluZGV4IDI4MTM1Zjg0
ZTI4Ni4uZTE5ZWFmZmZiYjA4DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RlYnVnZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2Zz
LmMNCj4gPiBAQCAtMzIsNiArMzIsNyBAQA0KPiA+ICAjaW5jbHVkZSAieGVfc3Jpb3ZfdmYuaCIN
Cj4gPiAgI2luY2x1ZGUgInhlX3N0ZXAuaCINCj4gPiAgI2luY2x1ZGUgInhlX3RpbGVfZGVidWdm
cy5oIg0KPiA+ICsjaW5jbHVkZSAieGVfdHRtX3ZyYW1fbWdyLmgiDQo+ID4gICNpbmNsdWRlICJ4
ZV92c2VjLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV93YS5oIg0KPiA+DQo+ID4gQEAgLTc3Myw2ICs3
NzQsOSBAQCB2b2lkIHhlX2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+
ID4gIAlpZiAobWFuKQ0KPiA+ICAJCXR0bV9yZXNvdXJjZV9tYW5hZ2VyX2NyZWF0ZV9kZWJ1Z2Zz
KG1hbiwgcm9vdCwNCj4gInN0b2xlbl9tbSIpOw0KPiA+DQo+ID4gKwlpZiAoeGUtPmluZm8ucGxh
dGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQpDQo+IA0KPiBtYXliZSBiZXR0ZXIgdG8gbW92ZSB0
aGF0IGNoZWNrIHRvIHhlX3R0bV92cmFtX2RlYnVnZnNfaW5pdCgpID8NCg0KSSBjYW4gZG8gdGhh
dC4gTWF5IGJlIHlvdSBhcmUgcmVmZXJyaW5nIGNsZWFuIHZpZXcgaW4gcGFyZW50IGZ1bmN0aW9u
IGFuZCBjaGVja3MgaW4gY2hpbGQgZnVuYy4NCg0KPiANCj4gPiArCQl4ZV90dG1fdnJhbV9kZWJ1
Z2ZzX2luaXQoeGUsIHJvb3QpOw0KPiA+ICsNCj4gPiAgCWZvcl9lYWNoX3RpbGUodGlsZSwgeGUs
IHRpbGVfaWQpDQo+ID4gIAkJeGVfdGlsZV9kZWJ1Z2ZzX3JlZ2lzdGVyKHRpbGUpOw0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4gaW5kZXggMjRkMTM0
NzU0MjY1Li5hZjllMWZhODY4ZDcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3R0bV92cmFtX21nci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92
cmFtX21nci5jDQo+ID4gQEAgLTUsNiArNSw3IEBADQo+ID4gICAqLw0KPiA+DQo+ID4gICNpbmNs
dWRlIDxsaW51eC9jZ3JvdXBfZG1lbS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGVidWdmcy5o
Pg0KPiA+DQo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gPiAgI2luY2x1ZGUg
PGRybS9kcm1fZHJ2Lmg+DQo+ID4gQEAgLTg3NCwzICs4NzUsNjggQEAgaW50IHhlX3R0bV92cmFt
X2hhbmRsZV9hZGRyX2ZhdWx0KHN0cnVjdA0KPiB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcikNCj4g
PiAgCXJldHVybiB4ZV90dG1fdnJhbV9yZXNlcnZlX3BhZ2VfYXRfYWRkcih4ZSwgYWRkciAtIHZy
LT5kcGFfYmFzZSwNCj4gPiB2cmFtX21nciwgbW0pOyAgfSAgRVhQT1JUX1NZTUJPTCh4ZV90dG1f
dnJhbV9oYW5kbGVfYWRkcl9mYXVsdCk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHZyYW1fYmFk
X3BhZ2VzX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICp1bnVzZWQpIHsNCj4gPiArCXN0
cnVjdCB4ZV9kZXZpY2UgKnhlID0gbS0+cHJpdmF0ZTsNCj4gPiArCXN0cnVjdCB4ZV90dG1fdnJh
bV9vZmZsaW5lX3Jlc291cmNlICpwb3M7DQo+ID4gKwlzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFn
ZXIgKm1hbjsNCj4gPiArCXN0cnVjdCBncHVfYnVkZHlfYmxvY2sgKmJsb2NrOw0KPiA+ICsJc3Ry
dWN0IHhlX3R0bV92cmFtX21nciAqbWdyOw0KPiA+ICsJc3RydWN0IHhlX3RpbGUgKnRpbGU7DQo+
ID4gKwl1OCBpZDsNCj4gPiArDQo+ID4gKwltYW4gPSB0dG1fbWFuYWdlcl90eXBlKCZ4ZS0+dHRt
LCBYRV9QTF9WUkFNMCk7DQo+ID4gKwlpZiAobWFuKQ0KPiA+ICsJCXNlcV9wcmludGYobSwgIm1h
eF9wYWdlczogJWRcbiIsDQo+IA0KPiBpcyB0aGlzIHRoZSBzYW1lIHZhbHVlIGZvciBQTF9WUkFN
MSwgVlJBTTIgLi4gPw0KDQpZZXMgaXQgd2lsbCBiZSBzYW1lLiBBbHNvIHRoaXMgdmFsdWUgd2ls
bCBldmVudHVhbGx5IGNvbWUgZnJvbSBSQVMgcG9zdCBpbnRlZ3JhdGlvbiB3aXRoIHRoZWlyIGNv
ZGUuIFJBUyBjb2RlIGlzIGluIHJldmlldyBzdGlsbCwgb25jZSBpdCB3aWxsIGNvbWUsIFJBUyB3
aWxsIGdpdmUgdXMgRlcgcmVhZCB2YWx1ZS4gVGhpcyBpcyBqdXN0IHBsYWNlIGhvbGRlciBJIGNh
biBzYXkuIER1cmluZyBpbnRlZ3JhdGlvbiB3aXRoIFJBUyBJIHdpbGwgcmVmYWN0b3IgbWF4X3Bh
Z2VzLg0KDQo+IA0KPiA+ICsJCQkgICB0b194ZV90dG1fdnJhbV9tZ3IobWFuKS0+bWF4X3BhZ2Vz
KTsNCj4gPiArDQo+ID4gKwlmb3JfZWFjaF90aWxlKHRpbGUsIHhlLCBpZCkgew0KPiANCj4gYXMg
d2UgbG9vcCBvdmVyIGVhY2ggdGlsZSwgc2hvdWxkbid0IHdlIGFkZCB0aGlzICJiYWRfcGFnZXMi
IGRlYnVnZnMgZW50cnkNCj4gdW5kZXIgc2VwYXJhdGUgdGlsZU4vIGZvbGRlciA/DQoNCk5vIHRo
ZXJlIGlzIG5vIHN1Y2ggcmVjb21tZW5kYXRpb24gZnJvbSBhcmNoIGFuZCB0aGVyZSBpcyBubyBy
ZWFsIG5lZWQgZm9yIHVzZXJzIHRvIGtub3cgYWRkcmVzcyBiZWxvbmdzIHRvIHdoaWNoIHRpbGUu
IEBJZGRhbXNldHR5LCBBcmF2aW5kIGFueSBjb21tZW50cz8NCg0KVGVqYXMgDQo+ID4gKwkJc3Ry
dWN0IHhlX3ZyYW1fcmVnaW9uICp2ciA9IHRpbGUtPm1lbS52cmFtOw0KPiA+ICsNCj4gPiArCQlt
YW4gPSB0dG1fbWFuYWdlcl90eXBlKCZ4ZS0+dHRtLCBYRV9QTF9WUkFNMCArIGlkKTsNCj4gPiAr
CQlpZiAoIW1hbiB8fCAhdnIpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCW1nciA9IHRvX3hl
X3R0bV92cmFtX21ncihtYW4pOw0KPiA+ICsNCj4gPiArCQlyY3VfcmVhZF9sb2NrKCk7DQo+ID4g
Kw0KPiA+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KHBvcywgJm1nci0+b2ZmbGluZWRfcGFn
ZXMsDQo+IG9mZmxpbmVkX2xpbmspIHsNCj4gPiArCQkJYmxvY2sgPSBsaXN0X2ZpcnN0X2VudHJ5
X29yX251bGwoJnBvcy0+YmxvY2tzLA0KPiA+ICsJCQkJCQkJIHN0cnVjdA0KPiBncHVfYnVkZHlf
YmxvY2ssIGxpbmspOw0KPiA+ICsJCQlpZiAoIWJsb2NrKQ0KPiA+ICsJCQkJY29udGludWU7DQo+
ID4gKw0KPiA+ICsJCQlzZXFfcHJpbnRmKG0sICIweCUwMTZsbHggOiAweCUwMTZsbHggOiBSXG4i
LA0KPiA+ICsJCQkJICAgKGdwdV9idWRkeV9ibG9ja19vZmZzZXQoYmxvY2spICsgdnItDQo+ID5k
cGFfYmFzZSkgPj4gUEFHRV9TSElGVCwNCj4gPiArCQkJCSAgIGdwdV9idWRkeV9ibG9ja19zaXpl
KCZtZ3ItPm1tLCBibG9jaykpOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJbGlzdF9mb3JfZWFj
aF9lbnRyeV9yY3UocG9zLCAmbWdyLT5xdWV1ZWRfcGFnZXMsDQo+IHF1ZXVlZF9saW5rKSB7DQo+
ID4gKwkJCXU2NCBwZm4sIGJsa19zaXplOw0KPiA+ICsNCj4gPiArCQkJYmxvY2sgPSBsaXN0X2Zp
cnN0X2VudHJ5X29yX251bGwoJnBvcy0+YmxvY2tzLA0KPiA+ICsJCQkJCQkJIHN0cnVjdA0KPiBn
cHVfYnVkZHlfYmxvY2ssIGxpbmspOw0KPiA+ICsJCQlpZiAoYmxvY2spIHsNCj4gPiArCQkJCXBm
biA9IChncHVfYnVkZHlfYmxvY2tfb2Zmc2V0KGJsb2NrKSArIHZyLQ0KPiA+ZHBhX2Jhc2UpID4+
IFBBR0VfU0hJRlQ7DQo+ID4gKwkJCQlibGtfc2l6ZSA9IGdwdV9idWRkeV9ibG9ja19zaXplKCZt
Z3ItPm1tLA0KPiBibG9jayk7DQo+ID4gKwkJCX0gZWxzZSB7DQo+ID4gKwkJCQlwZm4gPSAocG9z
LT5hZGRyICsgdnItPmRwYV9iYXNlKSA+Pg0KPiBQQUdFX1NISUZUOw0KPiA+ICsJCQkJYmxrX3Np
emUgPSBQQUdFX1NJWkU7DQo+ID4gKwkJCX0NCj4gPiArDQo+ID4gKwkJCXNlcV9wcmludGYobSwg
IjB4JTAxNmxseCA6IDB4JTAxNmxseCA6ICVjXG4iLA0KPiA+ICsJCQkJICAgcGZuLCBibGtfc2l6
ZSwgcG9zLT5zdGF0dXMgPyAnRicgOiAnUCcpOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJcmN1
X3JlYWRfdW5sb2NrKCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiArREVGSU5FX1NIT1dfQVRUUklCVVRFKHZyYW1fYmFkX3BhZ2VzKTsNCj4gPiArDQo+ID4g
K3ZvaWQgeGVfdHRtX3ZyYW1fZGVidWdmc19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1
Y3QgZGVudHJ5DQo+ID4gKypyb290KSB7DQo+ID4gKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJ2cmFt
X2JhZF9wYWdlcyIsIDA0NDQsIHJvb3QsIHhlLA0KPiA+ICsmdnJhbV9iYWRfcGFnZXNfZm9wcyk7
IH0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5o
DQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmgNCj4gPiBpbmRleCBk
NTM5MmJlZmYzMGMuLmYzNTRjMjZjNDI1NyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdHRtX3ZyYW1fbWdyLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dHRtX3ZyYW1fbWdyLmgNCj4gPiBAQCAtOSw2ICs5LDcgQEANCj4gPiAgI2luY2x1ZGUgInhlX3R0
bV92cmFtX21ncl90eXBlcy5oIg0KPiA+DQo+ID4gIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uOw0K
PiA+ICtzdHJ1Y3QgZGVudHJ5Ow0KPiA+ICBzdHJ1Y3QgeGVfZGV2aWNlOw0KPiA+ICBzdHJ1Y3Qg
eGVfdGlsZTsNCj4gPiAgc3RydWN0IHhlX3ZyYW1fcmVnaW9uOw0KPiA+IEBAIC0zMiw2ICszMyw3
IEBAIHZvaWQgeGVfdHRtX3ZyYW1fZ2V0X3VzZWQoc3RydWN0DQo+IHR0bV9yZXNvdXJjZV9tYW5h
Z2VyICptYW4sDQo+ID4gIAkJCSAgdTY0ICp1c2VkLCB1NjQgKnVzZWRfdmlzaWJsZSk7DQo+ID4N
Cj4gPiAgaW50IHhlX3R0bV92cmFtX2hhbmRsZV9hZGRyX2ZhdWx0KHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlLCB1NjQgYWRkcik7DQo+ID4gK3ZvaWQgeGVfdHRtX3ZyYW1fZGVidWdmc19pbml0KHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZGVudHJ5DQo+ID4gKypyb290KTsNCj4gPiAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgeGVfdHRtX3ZyYW1fbWdyX3Jlc291cmNlICoNCj4gPiB0b194ZV90dG1f
dnJhbV9tZ3JfcmVzb3VyY2Uoc3RydWN0IHR0bV9yZXNvdXJjZSAqcmVzKSAgeyBkaWZmIC0tZ2l0
DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyX3R5cGVzLmgNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3JfdHlwZXMuaA0KPiA+IGluZGV4IGRj
OTdiMGFkMGU1MS4uZWZjZjNlMWQ0ZTgwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV90dG1fdnJhbV9tZ3JfdHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV90dG1fdnJhbV9tZ3JfdHlwZXMuaA0KPiA+IEBAIC0zNyw2ICszNyw4IEBAIHN0cnVjdCB4
ZV90dG1fdnJhbV9tZ3Igew0KPiA+ICAJc3RydWN0IG11dGV4IGxvY2s7DQo+ID4gIAkvKiogQG1l
bV90eXBlOiBUaGUgVFRNIG1lbW9yeSB0eXBlICovDQo+ID4gIAl1MzIgbWVtX3R5cGU7DQo+ID4g
KwkvKiogQG1heF9wYWdlczogbWF4IHBhZ2VzIHRoYXQgY2FuIGJlIGluIG9mZmxpbmUgcXVldWUg
cmV0cmlldmVkDQo+IGZyb20gRlcgKi8NCj4gPiArCXUxNiBtYXhfcGFnZXM7DQo+ID4gIH07DQo+
ID4NCj4gPiAgLyoqDQoNCg==
