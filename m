Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C7FFF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 11:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B784910E323;
	Tue, 28 Apr 2026 11:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeuWMEoJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6310E323
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777376430; x=1808912430;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OtLf4m83bFYiIYSOeF81k7WA/m1gpr5ahVU1yjhoy+o=;
 b=BeuWMEoJAkvNXu8svYVXqCFWPRmnWRAXq36GPfrau3+saooG9TfkKLSk
 6dMAFaBdWhHwRwGC7OlK+C62BKaTGvcKSxO8QY7UPhFOZPGqq79WedlcG
 t4IbJIyWhnWiUQ/Vk8Up5t0odM6nQ+SIuLaFSf8eZsYCTEDjVoamaxghu
 wu1BR/FkEJZB379WS/wcBdxUCrDxJNFofd7IoF2vNblOG9r0rkXJLDb96
 kfI0058/rT3f1FOm17sUojj7YmM1jT7R6EFg9sVdRvBa5Zn5R9oaMKVLr
 oC8VE3M2HJQ6JIDdKVdGAhL6MJPHq+yyRcOdEHERWGUai6tUspga4NLqM g==;
X-CSE-ConnectionGUID: BIiOTXtmSziH2KHUu0uMlw==
X-CSE-MsgGUID: ZZ45rQtUT5+piIvE4F5uGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78344694"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78344694"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:40:29 -0700
X-CSE-ConnectionGUID: 2ySTQP/8SL2rQU3yeVRhkA==
X-CSE-MsgGUID: TjmmURYmS5uIU/qfyBwN3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="272070377"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:40:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:40:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 04:40:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP3iwftoeYHuMQLLehN6khkpDUw4/tpm291zB3GDF4105T6xrQA4/wCTERLruFSH/oT3rg3vWx+a5Z2FqOuZcC525TitXoIM12IK2WbLfSfV9RRPSvrWs3IyoFN4COXjryw+biXuSJ+Fd5I64E3aQj0PlifWXzLAga/iiyIZ+xJGhZQO2IPuS+mM0K0a1j7vSBDRwqQPzHQlJ3q8j6PgDrWdcuXOJ++RXVLlPhe3bXTibbpJcrM0IZuFLc49XffKfKffXEjZCFdKrvHwZhL4XECsu1+7M+9kXFjYiapKQP5VFEM7VeSpKWFfy7oUOkZ3Y7AAGiz9RRz+K8H65i6CaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtLf4m83bFYiIYSOeF81k7WA/m1gpr5ahVU1yjhoy+o=;
 b=oGAkORdV8HVZ84olbIyOAfbXsEpUoF5VOzKlTPSwhDtA+moFzXeqGgBnpJAyWW5FuqUAa4BN4all37DM3K2VCXJ1Fe52J2omto1p8SU31UtnjJ1KCVJ+c7d4MyZ2qpxlLX1ELTt+7o7JV0iM+NHhrPcaNpIGyDDEsjc1wP2M3gUjoeK2pjj84TfdF6gzzsH3ue9jDXc1D7eZF+kMZp1R6/40uLNPg9rPg1tQ21ewSfZ4X8B/ryDjKTl16IqEj8WragnC43NR+idueQ5QnyRHkIOZ0kpfwfMKgTUo9na2TkLjEK6CldB81WybhkQji4ivfBZ3e/TzX9cdJssFZvu7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3232.namprd11.prod.outlook.com (2603:10b6:805:be::14)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 11:40:23 +0000
Received: from SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00]) by SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00%6]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 11:40:23 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
Thread-Topic: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
Thread-Index: AQHc1vpViV5NVL+lT0O4EmpVEqr+VLX0SHWAgAAHgACAAAkmoA==
Date: Tue, 28 Apr 2026 11:40:23 +0000
Message-ID: <SN6PR11MB323249C2BF34D0C8805A2D9B81372@SN6PR11MB3232.namprd11.prod.outlook.com>
References: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
 <d9a80b36-f54f-4ec4-9045-c24d2f493b01@intel.com>
 <bfaa816c-bdb3-4830-ab1a-3049a0b66849@intel.com>
In-Reply-To: <bfaa816c-bdb3-4830-ab1a-3049a0b66849@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3232:EE_|IA1PR11MB6417:EE_
x-ms-office365-filtering-correlation-id: cc8fb7c1-3431-455a-2c49-08dea51aef37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: TqACiM9iv0uRgzCTWPTiluYOpCEoDfKWg2WGq5cpOamfhNx9eVXaSVqHjj9UlRqz+xWNkdJnIJctkyn1rw73VkWQRm0gDD78PuM3NTIpZjTWK1uK+AauGHhgeTxDSaWOnWvwKlJQoyhIGxnGGosIU4CWkYy4aP4aCIUolDJQF0949pSSX2jYasnfG5+JcNROWRAMnpJSXdDERrGQzJVWFdE1CSHQPVH/HQ/H6tws40CHF5oJmlxEOpVOFaR2qarBtur1rnH+bZqnxdkyS5XFhnSRdiyrl1ZDyPk4t5Yyp2AUTU61mJva+XGoG2a6V3i984McAwty3Z1ugzW5EIEK6TcciV/ZhjPbGCoC/elPRjdkVJNhOEmOrJfZegY3U6vkfSdOLGvTNGAj+yuJHcIM8fybpxDCRGTSawkBps2ROizRUeI6Kr/Urui8LMucFNtqXkSJppThi9WLd6x/MEanvwmEcGcTiycr7gIMjs1VYLEh9JTInlyPpVi8IgiOTaZqmUvm+kE2dQl0Kefpn5BFhYlN4PG/KbNgko+6OlVd4HEdQlXMJrAMSRafqz++jxMLnpFluOHR7pgDf/CI7nUfIombT6VhUe67esWmhImkT96JkJF7xRVrSbK1Fit4YrT/GZYjiiPR7W/cm2nSxvbmNLC86CrGEPchEHWQO031jCue2IMe9bT8Cwi9OPmi+n+yMzMPmAbRArspM1Y1kbVv99h+7YFcF618wC91jhp7khSAmn+ZsqmRjgaPKwyTDqPSWSK3XCQM73JweSGHgCH2d7OAFidKtFHhIU7q84ZPauw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVA1eTIxMkJUZ3YzMEZ0YUJzbmRDNTVkNk9nKzBvRmx0YW5iUUowOGVWRmlF?=
 =?utf-8?B?VE9wdXV1UlZycFI4S1AwK2JEbzg4b3RwSUpROTg2RXkwSUhIOGxENDZaTm9F?=
 =?utf-8?B?V28yVmF6UXo1UlVSNHZoUXYyMXdrNERQeDdVQ1lRbG10QUFudDk5SFp3SnVO?=
 =?utf-8?B?bE9qdVgyaU5oUk5OczlOaWRaSWtaMkxRdHFxem9VZ0lHK1JCOXFRbzQ5NnpQ?=
 =?utf-8?B?SCtSSE8rbk45Qk1OQndvMEVBaXlqaGY1cERUaWcyaE52ekJ5K0QvYmwxWllI?=
 =?utf-8?B?eFIxK3hpVXQrZ2ZNdks3WGQzL0hqK2tGTVNzbnBjQkowLzdISndlS0ZWZHVj?=
 =?utf-8?B?UTQ0T3hvTHYwUzlNZDEyNlc5RkZ3WTVEeEFhRXZUdVdYeFhVNzhKT2V4cktB?=
 =?utf-8?B?RG9zQTZmNXhSR0xZZm9RR29iNi9jMVFsVFZNMU53VkJVN1JjSFNEQWtkN0dG?=
 =?utf-8?B?SVdydVl4RytuVngxYUY3NHRNY2pQUUNsRlVXa1I1RmZHWVVaSGhxcjQzTS9v?=
 =?utf-8?B?dkJORjVzcXZ6aXdWdHVzUEt6K3N2dkthN2kxZjhNd2VHWThoRjNac2xVTHla?=
 =?utf-8?B?SG1OZHNqOHNWYlRyVnJFNUhjdXNHOEFQa29Cc2E2Kzl5SjRKVWNINzBLUjd3?=
 =?utf-8?B?aHp3VUFsNTVyR0cwd21MeSswZGFTRmFjbU5yZGpSTnNOQ040QjNYRTNKNS9N?=
 =?utf-8?B?QkR0aGMyUGh3eW1jY2JvQ04yRllGOEtSSHFhcVVQQzJLeGMrdVByUEMwRkdn?=
 =?utf-8?B?aDJUVFExQnBLQWF3TXpxQUgySS9qTVRhSDA3bTM1S3JFZW9jUDJiUVJKekJT?=
 =?utf-8?B?MGtXVWRXU2RoZjhqZmk0SldjMWJ4NGRMaldMY1lMeU1ibzFuYW9KTTc5Z2Fp?=
 =?utf-8?B?bTJkVWpaWkU2UHBzVU5zSmNmYVB5cW91Qk9hSmVhRDBVbWJRMmxMdk1naHhi?=
 =?utf-8?B?cWlNbkQ1TVViZXhQNlFjdFlIbkhCT2hKWXdjRGEyUFA4c2NiYmZMcFZYbDJH?=
 =?utf-8?B?SmpQR0pZQmdRL21oRlQ2Ukt1Q3VoYkh0TnRBSDJnMCswTFZKSXdrWVFPODZh?=
 =?utf-8?B?ZGhod1RDcnJ5Q1pNU2RIanYra0NEa1QyMWRvb2hMQkprN1pTbWZocnpLNGRL?=
 =?utf-8?B?Wlk4M0NxeUZNQzQvOUVySjEzNVEyY1U3aEduYkdJRDRBcjdkN1VkcXV1Y1J1?=
 =?utf-8?B?cEttWHE4bE5yRkRzZXFsWlJ0UmhnbTZudDdPbUF6dEJyenFDMldySWdLckZi?=
 =?utf-8?B?TVViZ2Y2S1QrQUZaWC9HVHptSU5WS2RQSlp5Q2NsUW5zdVZVcEJJOVVNS3Q4?=
 =?utf-8?B?eUNlcmwyYlNLM0NNcXRQMUN0N1VpcFV0R3FBUmdPQVExU3VkY2xzbE92bW11?=
 =?utf-8?B?MTFQQmxPbTZmdTZ0UjAvbmJFS0h3MVJuZW03R3pPRmVxZ1hIMUVoQnlXeDBN?=
 =?utf-8?B?SWdYcm5jeUI5LzVRa2gyVGNQd0NkVUJKQU5vVENjT05jUElvQjBCVWNjWUE4?=
 =?utf-8?B?blYrdFJUMjRrQUlEWkFJMkV0ZE5hMkkwMEdkejF3OUlJQUVPTzNQUzJZdEE4?=
 =?utf-8?B?d1RnRUgwWVJPTXRqYWVyWVNkUjJMR2pKT21xQXBTYmRpV2dxak11UmlUNFU1?=
 =?utf-8?B?VTBFZFg2MWE3Z0t6ZEE2M1pJN21QcDlCMkdUMGswVE5KTnMyN25VVmhyOEpo?=
 =?utf-8?B?TjE1WG1vbnpTWjRVd25vRUZERnR1Sk1uT3MwT0tLTXBBQkgyTWQ0dmJXQktK?=
 =?utf-8?B?TXZYYjlpYVJDRHR5NXcxWjc4VlhYOFpWYkxzMXc3ZlR2QzdJdkw1ZG9kb0Qw?=
 =?utf-8?B?Z1o0dDNvVWhwTk5OVXZsaUkrcGhhb0MvemVsNXBEZjZFSzY5SVBLZFhZWktY?=
 =?utf-8?B?dTJyQ1NjSTBha3plazJFTXZaVUpFRG93QTUvc3p0NzZhNHl1WitNQUtXQTRj?=
 =?utf-8?B?ZlZtdnI1c1grTmJYckZJd1QvRjlGZEN5VlJCeFlNNy91QklFaWM2RkhkREh6?=
 =?utf-8?B?NW05Z21NaVJtdzNvRnNxaTlDQnNocWpWdWZqQW5DS1oyWllzOWo4TEFwKzNn?=
 =?utf-8?B?MnZ6SHV5ZUNtQmkrT0J1UlFBZHJxMkp0K0U1YTBDcUpnVC90amtQZ3ArUmNQ?=
 =?utf-8?B?elNUMEZ5ekQzV0VqY0lSQnJlY0E4VGZjSGtTWkUza3FnQzFvMDl5aTAxeFh3?=
 =?utf-8?B?ZUZXcDdwMHhNNlYxdnlrUXpVUTlFNjFTKzRLWVpzRW9sODJqcGV1QU5nYk5u?=
 =?utf-8?B?eXFIeU5CVkh1R3Y3RXpIYmphcm9iOW9QNnhDZmxaSEpSQ2pmaG5FUVNMUkRI?=
 =?utf-8?B?RU9EQ0hQc2VPZzVyUW83bFVTSGRvM0RQQktUQWw0M05BVG14U3k0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E73M3j82ODS6ezpSVBcdJww+w/V8bxQV4jxWxn2xkEwbr5VuUq+vEVM92mHu7Z9Kg9gOOTcqruQy2DFfa44QeyayE1LmPH+Aqb1jRzGLoMTO6ERy+Sa3Ne/tcRW9xWy+u8i6XMVNoo5/HhGebQwiTP6YRpeRUr2M6nSkN6o1kADyx4Ua8sJj2FJBvE4lqUsSGEOh1gdJUEeSC8d9ze5u1dqtH2Gta/t3EA9m5N8q4+cJYPoaGSNI2VYEabQA1vTqKmsWHRIo8tCZrBQGzHD5s03R/HW01ZpasCC7NFSnfGoiKVXjATbvBG9lV9KQCM6xM8UV9xyvDM7Yxagj+GOVIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8fb7c1-3431-455a-2c49-08dea51aef37
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 11:40:23.3710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfDuxOpTvC3QhepcrMBJWUO1ScTc6tyJFPGqDX6q8RjYMwv0YmD5T/xYV6d9a3LXcG9hhHRTAYreEyclVy1YtXRfC5bKJ/BsYJRbPFkDnBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMjggQXByaWwgMjAyNiAxNjozNg0KPiBU
bzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4g
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+Ow0KPiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsgR2hp
bWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlOiBEZXN0cm95IG11dGV4IG9uIGdwdV9idWRk
eV9pbml0IGZhaWx1cmUgaW4NCj4gVlJBTSBtYW5hZ2VyIGluaXQNCj4gDQo+IE9uIDI4LzA0LzIw
MjYgMTE6MzgsIE1hdHRoZXcgQXVsZCB3cm90ZToNCj4gPiBPbiAyOC8wNC8yMDI2IDExOjMyLCBU
ZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPj4gSW4gX194ZV90dG1fdnJhbV9tZ3JfaW5pdCgpLCBp
ZiBncHVfYnVkZHlfaW5pdCgpIGZhaWxzLCB0aGUgZnVuY3Rpb24NCj4gPj4gcmV0dXJucyBlYXJs
eSB3aXRob3V0IGNhbGxpbmcgbXV0ZXhfZGVzdHJveSgpIG9uIG1nci0+bG9jayB3aGljaCB3YXMN
Cj4gPj4gcHJldmlvdXNseSBpbml0aWFsaXplZCB2aWEgbXV0ZXhfaW5pdCgpLiBUaGUgbm9ybWFs
IGNsZWFudXAgcGF0aCBpbg0KPiA+PiB4ZV90dG1fdnJhbV9tZ3JfZmluaSgpIGlzIHJlZ2lzdGVy
ZWQgdmlhIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgpDQo+ID4+IG9ubHkgYWZ0ZXIgZ3B1X2J1
ZGR5X2luaXQoKSBzdWNjZWVkcywgc28gaXQgbmV2ZXIgcnVucyBmb3IgdGhpcyBlcnJvcg0KPiA+
PiBjYXNlLg0KPiA+Pg0KPiA+PiBBZGQgbXV0ZXhfZGVzdHJveSgpIGJlZm9yZSB0aGUgZWFybHkg
cmV0dXJuIHRvIHByb3Blcmx5IGNsZWFuIHVwIHRoZQ0KPiA+PiBpbml0aWFsaXplZCBtdXRleC4N
Cj4gPj4NCj4gPj4gRml4ZXM6IGRkMDhlYmY2YzM1MiAoImRybS94ZTogSW50cm9kdWNlIGEgbmV3
IERSTSBidWRkeSBiYXNlZCBWUkFNDQo+ID4+IG1hbmFnZXIiKQ0KPiANCj4gV2FpdCwgd2hlcmUg
ZG9lcyB0aGlzIGNvbW1pdCB0aXRsZSBjb21lIGZyb20/IEhvdyBkaWQgeW91IGdlbmVyYXRlIHRo
aXM/DQoNClRvb2sgY2xhdWRlIEFJIHJlY29tbWVuZGF0aW9uIG9uIHdvcmRpbmcuIA0KDQpUZWph
cw0KPiANCj4gPj4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5
QGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1f
dnJhbV9tZ3IuYyB8IDQgKysrLQ0KPiA+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdHRtX3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vDQo+ID4+IHhlL3hlX3R0
bV92cmFtX21nci5jIGluZGV4IDVmZDBkNTUwNmE3ZS4uMzE4OWU0YjdhZDA1IDEwMDY0NA0KPiA+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4gPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4+IEBAIC0zMTksOCArMzE5
LDEwIEBAIGludCBfX3hlX3R0bV92cmFtX21ncl9pbml0KHN0cnVjdCB4ZV9kZXZpY2UNCj4gKnhl
LA0KPiA+PiBzdHJ1Y3QgeGVfdHRtX3ZyYW1fbWdyICptZ3IsDQo+ID4+IMKgwqDCoMKgwqAgdHRt
X3Jlc291cmNlX21hbmFnZXJfaW5pdChtYW4sICZ4ZS0+dHRtLCBzaXplKTsNCj4gPj4gwqDCoMKg
wqDCoCBlcnIgPSBncHVfYnVkZHlfaW5pdCgmbWdyLT5tbSwgbWFuLT5zaXplLCBkZWZhdWx0X3Bh
Z2Vfc2l6ZSk7DQo+ID4+IC3CoMKgwqAgaWYgKGVycikNCj4gPj4gK8KgwqDCoCBpZiAoZXJyKSB7
DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBtdXRleF9kZXN0cm95KCZtZ3ItPmxvY2spOw0KPiA+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsNCj4gPj4gK8KgwqDCoCB9DQo+ID4NCj4gPiBD
YW4gd2Ugbm90IHVzZSBkcm1tX211dGV4X2luaXQoKSBpbnN0ZWFkPyBBbHNvIGNhbiB0aGVuIGRy
b3AgdGhlDQo+ID4gbWFudWFsIGRlc3Ryb3kgaW4gZmluaSgoKS4NCj4gPg0KPiA+PiDCoMKgwqDC
oMKgIHR0bV9zZXRfZHJpdmVyX21hbmFnZXIoJnhlLT50dG0sIG1lbV90eXBlLCAmbWdyLT5tYW5h
Z2VyKTsNCj4gPj4gwqDCoMKgwqDCoCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZCgmbWdy
LT5tYW5hZ2VyLCB0cnVlKTsNCj4gPg0KDQo=
