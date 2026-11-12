Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6F606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kqwe9fjU;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KW0q1sd/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F820112058;
	Thu, 12 Nov 2026 11:54:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2966411204F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484468; x=1826020468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qIAM4bsXAlE+qM0ye95/dGBnsHyjA/cs0KIfRc/xPeM=;
 b=Kqwe9fjUXmsdibu/lgh19sssDizihu0tYjg6ZeUagKyiyZgBGj1qh6Pp
 YwzgBLsWkVQOL22BrR58kpzsrNAY9K30mloukWjbAKeRwZXGB8vG9sBBg
 StXEx3BtIH1q01FAgD5pbMmjIP1cQU6pS9gcNbOtAsBYw17U5WFVtW1GU
 6myxGdb/YPpSWODfzAwXnfO8drt6agbcdu/fbs2FU4GrH+Tie8eEQNR/e
 4kvDY5bWDcrjwKGseqVtCz0u1DSW1xCTN7ZfZSvnfO6keImP54sinphQi
 lvFoDtqUZ91uHU1fCgEccPjnLZuqdz5hZFsIMjoUgSYvbblwDHBSJ/Tt0 A==;
X-CSE-ConnectionGUID: Sz+/m3C3SkqDabp+43qCRA==
X-CSE-MsgGUID: xk7XomWXSt2FFcBb/dv4jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3299090"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3299090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:54:26 -0800
X-CSE-ConnectionGUID: flxIUc70RvexrnLEDqewFg==
X-CSE-MsgGUID: knKohhggQuCvJBKOfrQBDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8569688"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:52:17 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muUZuoREcsDGO6xiiw54Gklct5Xl2rdDZ+8d2ksU+L1tq7V172jRd/JkZZaEK4/wLrHrhR1kczf7HnTG03UKJzNndOlhmZzbw3OxrAuF9cb4BzNQWnc5IVF1rNu4ZsctCWeYKIyYkKjRGdhv6UrFeC+6RsHFC8STxwo8RcZsS9v6Wq1Kymd+NkOY1b/WrF7zvtZJcEWQie2LDNQWY5jSYOCO91Pryiey6nIbEqhnJD0AJHOIrITLKNW7OLOpFVyllCz/vsaspzZv+EdnopJ0mY6VqJMAnwPZCaVCfr46BucoTvinkqJa/7wA3iq1TG5Wn9YH22qasMNFTX7mMnSLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AmlYYsnCV9+Zw6a5wpKnLZot9PrabfFEGbpUh3jCfY=;
 b=tdaeIpaHEmDJ0pEe+GgwcQq2Cd8tVkkklGYDaacONq8VEcd6wAZEhm3CgZWMIrUFfQJdZaZom7OlRdm/yGvM7Q2z0OXLAHfSpFgzHpoITrRuU6Ou+ijNR+Fcw0D9JdnKt8bOoVeuDA4++ePQDsIAKIV2IbsMzdKI9vLXcT8Am18EAJh8CDh8xQhSo9xx9rGWgvaIfuTR5ZW5T/ZfAGdblHKDwiA1xtx6uKHfM+vZ/8rQSFt0H6NICsTnE931SMOtOH1/jr8QA1Jale8IjTntymrcN4QuZJ35DMCOb3bkK++m5lCIZ2uLUZ/y4I/nhH4sWTZHFVQGqEpIeEmr3OxfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AmlYYsnCV9+Zw6a5wpKnLZot9PrabfFEGbpUh3jCfY=;
 b=KW0q1sd/37R1wMIAjqGO/bI1NhELdILl5AjoFSIHgs0Dyw6Q7WS/0CZzugtoHzbMAPsjp1DBVCOQIq2oNPRnlZSTDbxG1KT/tQ+nIgPhQtXaG7cwGGRFLbJd6XvY0xi5sl2DSTmOUHu9Myr4nqDmsQW515oBtl64PjbvSex13go=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 11:52:10 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:52:10 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Tomasz
 Lis" <tomasz.lis@intel.com>
Subject: [PATCH v8 1/5] drm/xe/ggtt: Assert lower bound of GGTT PTE address
Date: Thu, 12 Nov 2026 12:51:43 +0100
Message-Id: <20261112115147.2329912-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: dd584771-e1b4-43f2-54a0-08df40b36255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|261009223027099003|18002099003|261022075727099003|261021121427099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Pl5235tdjDDFYovLtxg6wfsSEWPqmJ733zciHlLWIWuo+Lnh4Zwx2LTgP+kYqZeu+04dvLKBjcr1K8vc5P79He+8AmhXUfPNm0zD6tMtDXvjaJMOWXLQqjMRnDaCGG4quqdnQF0T76GiX6f3HSyDz778iJTPkZ+TIL+vf7/noHXKitkF8sDiviIMqVLLgcUQNtL3xXV4bFQiVmVzqQfgaQ67Cpo8l/l63dXi5wVwzotp60cKUrrvte1+/xxpyatbWM3fGsLS0+yX1NDzvx3Hb2ZhjNZffTKP3EgQxmICwco4wER0fO29Tpjpc6zepCmfn7ubmbqkQpeugukcGUXd74/Tp1pteFF1G5KXaQXmvAxx0b0XrX65cCqtw56lRGdsIWq6DqU65vWjPbV2mn2nJMsSS4qlt4JjWzjzo5LL0HCqKlW+7bTaLmHrX0/fTemb9BFdeD1Jp3ZV9jOtNIU7rdUlqdDhS+R9vo1Z0b5AcdMQxIHzQ5akB/kg1x39zjUkaOaqad38Cu03KONKqcl9zkwGuv4Ug5zUhsdiVfYC7D815bG2xF0lqJsleJgA07XypVqVcBU8PENgTFXzPejCFtAPT6lyvQ3z923AuAP9JUTrcqRCerrUdGjQn6H9TdqofaGxdLN/jZw5l7xFpSCgOvC+K9KFhqHGcR7QGSxvfDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(261009223027099003)(18002099003)(261022075727099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VpQjNkWkxjNlJuRG43bjRNNzcxWlA3UlNLMVd4K1J0OW5YdG1mbUU1Q3kz?=
 =?utf-8?B?NXViK2E0Z3ZndVZURjhFZmNzNS9McEk4VURTUkFtREFYUGpvTjh5Y1YwTGps?=
 =?utf-8?B?SFd0M1pUK3Q0aHliaUhEZU9Ed2xMc3BwYmwzM1VHNWU0UUxnNjgvV1IyMlNF?=
 =?utf-8?B?eG42ejlqSkhMNzhKaWh4WnU3MUxNaDdLRlo5TzFrd0NWWDVDZmlkUjBOcENx?=
 =?utf-8?B?SWkrZjUxY25wb2FaaWswMzdVbWJUOTg1VzdKQSs4VzFuVE1jKzBXWW52U3Vt?=
 =?utf-8?B?WFRLUytvRnhVMDBLcXpzOTAyTzdMVTd1YjhWTnVnVVc0eUNwK0NnZEJZb0lW?=
 =?utf-8?B?ZGJadHF6OVlJY3lYNlJ3M0Z2K0xjb2t3b2FIRW54N055YnkrcERPR1gvalFk?=
 =?utf-8?B?M0o5KzQrc01aZDlwNnppTXpCc2VyaHpFZEJzUzhPdlI2TTV2MUd2d1lCa0FK?=
 =?utf-8?B?MUU3d2R2QU1GcHdvaGxWM0J1LzFKZkZCbXFMV2wxUUZnQTZkaFBSRkR1Rmg4?=
 =?utf-8?B?RUxnOHVlV1FuSEhTYUg1VC9jNlBkR3NOYjhvM2ZRUDZ3QWY3OUh3R0JpTFVE?=
 =?utf-8?B?VStud0g1V2hSZXdsRGp1dmgvcnJDZGhGL2x0WThXYnFYQ21qc2Z1T0VCRWY0?=
 =?utf-8?B?MFQxN1Vzc1U4NFNxNVRtYi9Ua2lQL0dPU1ZNVVVhODhnYmZpTmJSNlFiV0g0?=
 =?utf-8?B?QTZLYjBFWFg4azdLTTVtTUFFdjVvN3hqcTRwTHEva1BRdkhyY0o2SzV5QTZT?=
 =?utf-8?B?R0lxbWZoVyszZTJBWU1CYWZ4a2xWTU5uejJHdUszbE5ad1JvNDRIWmllWHpn?=
 =?utf-8?B?MjZLTCtSYXpNOTd0eDBGcGFocXBUZkhPVHJmYWVqZHRtbFdJZW1YRWczOEdQ?=
 =?utf-8?B?ZERqenlLcEhQdjh6YXFVcG5lb1N3MXlSWVEzeG1pVWpUUW9KOXpMYi9nVFVp?=
 =?utf-8?B?NlExOTMxNW5RN2pxN2l3NjdPdjlabythd0hxREQ2NkFxejlZUCtQeVFjWGZE?=
 =?utf-8?B?aGRrTkFjY2x2OEFZbnh0dWNLNmp6ekpSaWpXOGxkTk1TYllFenEyYXo0b2ZT?=
 =?utf-8?B?cmJveG8rc2Z2S21NeXZMSUIrRlFhNS9nNVlaK3Q5cDhBZ3ZCRUxtS3B5YWxD?=
 =?utf-8?B?NW9lZVNSVXc5SFpUMWtZdnl2cG5WRlpoZlJFSmI5ZFVPa1d1TUFONkhPMmps?=
 =?utf-8?B?THNyODlnc1V0VVNqUVdDOVdVdEpPLzM0UWZVSFBLcHJuSkU4MlRJM3A3bENa?=
 =?utf-8?B?NmY1YW9lMStkSVBMejBiWm9vV2gvWnpYL05hTlhONkhGNXRScmRLV2dRMFU5?=
 =?utf-8?B?bTVaSEtPMDFXV25RSXgzeGkzcG1Pb3Fvd0RuUjRpeXBMNUp1MU8wSjdrbEdH?=
 =?utf-8?B?MmgvSVJhS2hDNytUa0FDaEpJOG05VGlBQTVZd0lpTDZ3LzZZbW16ZDU0NXRr?=
 =?utf-8?B?WU5UMzdlaWJ6NlZBMjkwK0hycVI0aDJ0a3ltRHBIejFib2JYKy91cVFacG91?=
 =?utf-8?B?TGhKV0htMmlWTFRrWU9TSXpmUVd5V3lCWFMxMUtmbkJJS1ZPVkE0cGxSNmg0?=
 =?utf-8?B?ejJ3ak9KdUc3TExLVHdkWU0rK2Faa2o2ZGk1TzN2ZGMwODZvc0FMK3hZakxq?=
 =?utf-8?B?OXBHenVaSk1SYWVGU2Fsb3lrSmYxR3c1VFpNSDRYVnZyVFZDemJvcTZOREpD?=
 =?utf-8?B?TnpVN2M3Ti9MYWxLekJUbWs2ZkJQdUpFak5IZEc2ZlE2OHlvem1TZDNxWUR4?=
 =?utf-8?B?dFQ0a2syZWhtU2I5ejk4NzJWUjQzRkZhckNBa0huTk1WS0tMbmhsNUV6SXhP?=
 =?utf-8?B?UzliejQ5ak5ZM1lYM0JMeHhQWW1Vdm4zVTg5Qm5CZHhsVVJYeGJmVkZaOWRO?=
 =?utf-8?B?WHpIdUxiTHhqaitjbjVjRklJYUlLM0l2MFpmQWRkWWdKeFhPK1BnTUc4RmpG?=
 =?utf-8?B?RTZHK05MTUk0dll4a0M0R2tySTg4RXBxMFRvUW5XbHJia1BxQTc3RVdSamF0?=
 =?utf-8?B?VDV4aVVqd0JHVER4RFgzQUVTZzZOUDFXRjZsQUt3VTZIZUxiV0Q5WWh1Ni80?=
 =?utf-8?B?RWZSUnFkQXFHOTZGUU1GS3VocDErRmxHd0RiWWtxekYxTXEwcDZaSk1QSmhv?=
 =?utf-8?B?TFE0VDJ3djltaUtsT291V1lNTDZOZ09BTnA0dFZnaU9Yb1JxRnBad05DcjNx?=
 =?utf-8?B?UlhpeUdvcjNMaG9WY1hMYUxIbndTUkxmYXRncUM2SGhGQ0dHeXdxcFZ0Y2ln?=
 =?utf-8?B?amQ5TXFQdFB5bnlaSDY4aWJoa3pHR2ZqeVdFb1Y1bStlZGJJR3JUeVgzdXZ2?=
 =?utf-8?B?d0cyZG0xM0hUUitOTnF0UXFyZFYvU1laQm95UXFJL1VxZ3MzMjJPTnFBUDEz?=
 =?utf-8?Q?EtmFHkJ03RI/AgUM=3D?=
X-Exchange-RoutingPolicyChecked: N7juCJHgvBrGt/lm5TSBDcN7V51TbBCu2E/vgytxmCB3Ax13jHlTCP+rJS/tTwaSwzrrkUhMRPlAkRpbIdaMNno2/+qBoodfCiKZGQAyEZDXOb0REImTph45XHEn+PSaUnrodWhyep2g+Liz1f9YY7ivT0Pdz5PfKpCs3ZnJVd5CLdVIPAcaxvKNCqeCkAQd5Xx9OJtlwAp8x36+go6BBfd4ZQXJCQqQLJnQ6+ok0v0EfmnBb5ILcCjiaPm79mhCFm8UWqGWu07tJ0JYq0CUWyzWV2rL9kf/6f3sastX7nTjs9PgkBNcgH/9AWG56hbl7FqEKgnM21PnvQfyn8lQ4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd584771-e1b4-43f2-54a0-08df40b36255
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:52:10.3715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUMYHllaxYxZjQdp8HWTrFWf8D1cnWCFw0jmuwuoUEXMNDNAhd8YZ55GYeHXfdJ/SrD/TZHBggbATOQNH0q+lW4rGqdOdcYPLvb3Li5v+1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Since ggtt->start was introduced, the GGTT range no longer begins at
address 0, but the PTE accessors still check only the upper bound of
the address.

Also assert that the address is not below ggtt->start, so that stale or
miscomputed addresses (e.g. after a VF GGTT shift) are caught as well.

Suggested-by: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 9ef2ce743770f..deddf18d0bb09 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -240,6 +240,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
 	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
@@ -254,6 +255,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
 	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
-- 
2.34.1

