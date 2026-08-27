Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC4BC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 14:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E109410F0BA;
	Thu, 27 Aug 2026 14:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJTVmHzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BE310F0BA
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 14:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787842115; x=1819378115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uM1r6YlHOPw5j3ZaTNgQBNAusAR/vuZ0t5DYGQfH0Ws=;
 b=CJTVmHzQfUcz9r3+bW6cXyzwvJb38kFr/PA0VjwtGtIEdid00SefkEWn
 t1rKqtVmxbGFTlQXOUv33Y9KC/g4HheiSwmSyDtGoSO28VIFrwqUZVznz
 trMAm742SBRYIC5GVFDHiCgEnguqoaGDhwWgkXGwBvY6Oqs1R4ctOHv5Q
 HVQD+Cw5dbV8FsOXqJIuQKiL0z4SbfYOZ3xfr1qVMHOlbTxa2MakFBVJl
 1ZsFwI0bg4lPhyJG1zGSEo0iM5h5J9LSIhvPlzHeoXqlcLSyHZgWjtn1N
 5n87D7ve25krOksRBLIhX0E/bqq684Y9U/IZqTd9Ll6QosHH+opStj3cG Q==;
X-CSE-ConnectionGUID: R7XaQS2wQb2k9+LIwX7SFw==
X-CSE-MsgGUID: pt2TcM5ZT3aVmIWNWIvlLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88368824"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88368824"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 07:48:34 -0700
X-CSE-ConnectionGUID: DeA/FlIsTPePTpHxegjXzA==
X-CSE-MsgGUID: jqLLAxO5QVi/rijdFNZoxQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 07:48:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 07:48:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 07:48:33 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 07:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBb5WAhICIpQSAXuqPCO69GNDcULfEHybakyAmlxFzsUjL8oQ/yMDTjb2Xlw4ijgC4V/uK84kqJQ9labdviDppMa56vKlLQnJA5/dSI3Wen2J/YUwKXCR8QAfIVpRYowyKaBclZsM7xcXg8wIJpTZYjaNjJHmWb2eHYA8LvbtHWphXVBGIHWxbXgOviRZaXi2cf8rVsGEWwvtuMUkOxpZZKyE4NcCh9PKQTHhRyaneN16iYIWt/6bvqxjgmJdqa0EJjVDFPDFYD41F8s8lfieweM3+OJYHn0DaOppoq0qsvFwhH7hRbzLkzgt7LGKRkyFqAu9gNp0nU8nr6oHEqgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM1r6YlHOPw5j3ZaTNgQBNAusAR/vuZ0t5DYGQfH0Ws=;
 b=TWbOsEsaIgKu995g4GCiJCNoUO7aIYMzQznE54kgumEyfxYOrlcKgo391gESMzi9MOTZM5DB66snbZ2cz5ZuU0BZQ4k1piq60pJIVRHtHNl27cgr9XVj2WIKEp+JLbNLoni/IKvz2xNym1u8bH+UqKdlLQ1iwTpuc7vGK4hZf/pM69eBlg7BZx9NRE4jGnnqFBHmQsf3DypE/zI5bOgqQwRd1Do0lSpJwfro2myLCa9y+x1wM+TAWV/xcUVhJye53o2y8DXSo1IYqOqj7CiSV9M3cZ6qQKL4ZXf+buQHFk0oR6WVrT6wWzB65QA6Ngqowwml/cviAdP9/K4R/Q0BjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DM4PR11MB6190.namprd11.prod.outlook.com (2603:10b6:8:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Thu, 27 Aug
 2026 14:48:28 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:48:28 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "Yadav, Arvind" <arvind.yadav@intel.com>
Subject: RE: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages as
 well
Thread-Topic: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages
 as well
Thread-Index: AQHdNWIa8lHAO7PzpUyTi9OWg/AoNraw7aCAgAB+jxCAAI0KgIAAAfEQ
Date: Thu, 27 Aug 2026 14:48:28 +0000
Message-ID: <DS0PR11MB8718BEEB2CEC1FE26EF2BAE381AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
 <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
 <DS0PR11MB8718159BBB829F3009BA9FB281AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <apBLqyLbxFisF5xi@zenone.zhora.eu>
In-Reply-To: <apBLqyLbxFisF5xi@zenone.zhora.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DM4PR11MB6190:EE_
x-ms-office365-filtering-correlation-id: 550496f3-1b6f-4f0e-bce9-08df044a41b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|10070799003|376014|366016|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: U/6RnawjJAdyjSqfiZReovvQjLOFnhT5jO0DGsmUU4yGzHrN5xovDabfek44Teo9w/gEjSF1z+Af6D8o3E4V/owHIAEoITxREm/IiXWCR0lyUHFyxFDs44ow5bJn6Qm4iE31VkxduYJSocllzpIbMsr65dS6avCMeKuw9HV3P3TrAzu6+HRzWIZEuPJtUzPO9HQy2l4Ag/d7TfF6s05KuJkzVUJ+lh9o4F0hJb1sSmQQEHTtKVYT/1qpE6s4cf4FSBXDbfg/Ymf403b3JduKzBavkvKI6Xa+IHSJ7/YT7Je/IZtAUYoccT1jrLPKL+CuvYDfy0c3AgYR1lf/fUZIfRltiXL4SbqE10pa1I8uMFqEieScuWmVMC203jDG7PCOb3x63hgfjVAgnogjOUSizjk23GtEtlaiWiIlBOlHA11kaeALpVQqpDisQLhhQGrx0UWeBrqf2eCV8C3TOEzZYcD1rxMr4zPHa62VYOiIrIP2DE0uZxPSW1IqBAmkJRxKjDP6w9tkhI6LHrdp+nTqPQq4sGURJSlL5shQdisFIJ/PX+ZN8LIEFytT9eyyqv/RmV64UEgy/swzSJQAvU/nbeyHVSF7pDMC3f6HE947xSHCkmcK94dicil0rNnbtitAfhLg1AlouwPMgkY85ON8zguxUpQ0fWRL7SwU35eWixfSKpVhuuvBv5Dx9HfxGtcSs+Qle0e6oADJza3GPl1XETV+0I7s6VuX7SoaLtn+fAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v1qwQOI3k2XVx6m1VSOKY5QAHmMMImDRXZCyUeJ9ZJtavWsLL3hZMqGI2/Nr?=
 =?us-ascii?Q?1J6ucog/45iAh6EdKWwYCUP8MZc0zVe0OitkKuZh1uHkNoKWXSVulyf+fU3W?=
 =?us-ascii?Q?CqUmMBQYYB1YKFX8tVKP9uFb4qvmC/NftI1gO1oRiEMNoVf5TUCD8MdeRq9d?=
 =?us-ascii?Q?lXWN8Bl0hGocnulTkn46H4ssWxjDSzIByXDcUSUijqhbVAXVnwII5EggXZkV?=
 =?us-ascii?Q?m3M1BH2QSwAGsAkAnJT/rSPLC3d32UDFt7Gp8YAScueFkPcDcjM1u8lxcBV3?=
 =?us-ascii?Q?CGcnd22Db0uVfRMiXWM8I0PnqnQ2g6gY2u7rS1xiMXMyiPUsroBlCNTqtc0T?=
 =?us-ascii?Q?aVrIf+FSwI//K786W/6Is7iIYhKusFkndHxcvcBxXIdHQkUmyI72dD7bnWb+?=
 =?us-ascii?Q?orLMBnAIjE0C0jGdfLR8dlYaWJ02AGh9bXjWffu0hzWW0QsYoLd7J6njw/5b?=
 =?us-ascii?Q?I3EJ8jh+yvK+NPA41efh9TF5qy7z+rLDzvh3knNB4YwisUAwzDNRVe9+0di2?=
 =?us-ascii?Q?dDw9SEstj5sQ1DrU2ZGuqcdlXn5Gn6nVYQ+x/e/bZJDAutCbazoqK55NuGQU?=
 =?us-ascii?Q?nQEyQFdbaV5HoVYCEAStuM/8kyhv4fs/c0J0FdHiLJ7q+xqSYZnxpjvauori?=
 =?us-ascii?Q?WRKHYNO6bYp7I2vzM9yJZKSBuJTRJznIFAfx5xzZCFugR8AvO8mga3nQ/MxV?=
 =?us-ascii?Q?etT43CKZS4R5oWsnF+Byhz+h8MU+n1es1zEfvOWLzHE4VARSGQTvXKsd8wrS?=
 =?us-ascii?Q?0JVEfN/hJckJt1VUYm4ZIiTF79talbcxO8iTCk/r9Hq0f04GZ5t86AoV9EYa?=
 =?us-ascii?Q?1O22WVyqGmhGmawqq+ZVEmfoA38ghdla8NMEiwSDwyACfUVbN/OxqCOR/dFc?=
 =?us-ascii?Q?8gDcwmr6nLlwktH/EW5hBmGYufQswWnhPyGpZArI11gUjvXBrHPlamC+imX4?=
 =?us-ascii?Q?iv/Dp3RgHHGPrYSus3pYFrW2Uj57stywvRmK0/JsMdJll3eRpl7RpfKmciZW?=
 =?us-ascii?Q?M/e0dW9kouJcFvDtyqRdWMz+iC+bzBwNr88WVXHXWEzP/xn6byR91XgZkTUF?=
 =?us-ascii?Q?tPVGzC9e8nwiUJwlCjAeAy2WtREMuxHGeQ29p+nE9b8aLnruvMFRRIEu5z9j?=
 =?us-ascii?Q?3CCZWniUPSvO+U7ds8b+0RxwN/wJr0wLjDcU/IfpnxKp3ueinwQiZRRWCu6o?=
 =?us-ascii?Q?Aio2I9XzQsLT3u/xK4ByG6ABKNauZQ1oB5t1C9jUKeRHLUpnOjG6gbtdlkcu?=
 =?us-ascii?Q?CnVk4efoBz55YjN1IzQk/rkYUXCKP3zOZGxuFG8GbxzLvs/SMTwwiyZOXllU?=
 =?us-ascii?Q?eVH+zGTQ6c/RhnBJzVAtkEKZdgTZUGkVYkdXDkBOeGoUyHr8S7FdSya4Hj3+?=
 =?us-ascii?Q?p1BQeinjYelxOevaVf6Sq//68R3WF63VmXFbDv0kHdX8hTZTZwR24A7++fuB?=
 =?us-ascii?Q?Lkem/a0Wh+TIWZjzrQYfytKPa+H60PZMwQk14RtJVinEbjzvCg6tuuay8SWr?=
 =?us-ascii?Q?gtXuskHfVPO4XGqxq+AZog8WqqD9bzkYfhjHlC8RE3C2Hn8DfOJFpw7b6wHk?=
 =?us-ascii?Q?iCSN6JiG8Z5LwGDA6dg+mXzdZ2jTe9TXuipGYMG2vgPKC9KHS4yS0790wWUs?=
 =?us-ascii?Q?2MTnbedjrULq0OSJvnqRd/gcyAw4wjEjAuOzAxkey0TcR7X0sEpdVAiQM9xQ?=
 =?us-ascii?Q?/vIJQjZKBlh8gdDaeYGqpbwPR7jAF58DVkhh6eletoWVsNIEo5BFjonSbBlP?=
 =?us-ascii?Q?N10TZ4bDCQFemy+70pQdeefW6t9D0sqG0qSt50H+BRQzW5sWpXmZMTg7O6j9?=
x-ms-exchange-antispam-messagedata-1: 3ZZUrH3hQx3d/g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cZSkrdfQ5adzaDM4KXqnSapxrVk3bYcSES/Jxh5MTORaV4hQ86OYHnCC3/QNTFsHtaCO4f81A4SSBgnIeRQdpFBQQVpL1c5R6IB4AnJ1coYh/tYGjzEGc7zkpCWMDVD7/sUsqGthlQr4DUgVlSzSQM9vZbJ6nKEwpiP8hs/C3ucSxZ0tyQ9wUTjMASK8MWBX90T5WfaMOvBMiRXjaIynxYu+RocjhXKRqg3Rnj7OygiMxh8ADrMICeuYkP9uzHSp0FUOVF/dj4bwpARNaeAlinJ8qiorvy82b4JA7TvZ9Gw/RsrBsNgD1oNM+j02rJN2OEFFo5UOfrlBRNJnLiCFjw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550496f3-1b6f-4f0e-bce9-08df044a41b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 14:48:28.5289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cA0bL5em/+4uQ31qm3aCSpsl2jPKo1PeFHHhkSAllryD1LV3YNgFp5ubZinbTQu2Yy7mizxHvfFtqhpGvPPppkQwGIdk+kcHP06Oct8hWTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6190
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



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: 27 August 2026 20:10
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Wajdeczko, Michal <michal.wajdeczko@intel.com>; Yadav, Arvind
> <arvind.yadav@intel.com>
> Subject: Re: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram
> pages as well
>=20
> > >
> > > Besides, can we split it in two parts?
> >
> > Not sure I understand correctly what split mean here, anyhow I will add=
 little
> elaborative comment here.
>=20
> we can have one patch that is adding xe_ttm_bo_purge() to the library and
> one removing the if statement. They look independent to me and both are
> vaguely hinted in the commit log.

Okay makes sense, I will add one separate patch for adding xe_ttm_bo_purge(=
) to the library and rest in other.

Tejas
>=20
> Andi
