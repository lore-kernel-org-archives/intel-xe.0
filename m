Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D41CAC593
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1C910E4DC;
	Tue, 17 Sep 2024 17:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgvtOVtH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EE810E4DC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595607; x=1758131607;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rmiYZLxdgHoivl5nDoHW8rILONwxDRsgQcRWlbhe6XY=;
 b=YgvtOVtHf4VsPa2UF3v+fnaDyPCQK4p2MRlI4DQbANaxXQQoh4Le+VFz
 ZUfhOi1UA5xEKWXbIVNslXpgI9zOaCUWhBV1NHx7R6+Z+GGHkamnMTPdy
 lT9/QMF/xzE/xOVi88zmffWBs4gPVU3IzcC+tQ7UCHiNWn9JSCStOfxnA
 0wciHns0mkKAvENdP5LKUiWFBK+8yee3z2tebrGmui/DZytAZ6yHPcNqE
 gzF/m2fEtDo2uZED+GMavxlK2FqdB2XxBefBWU8wUeMaPO8xNgwGPWK8f
 N/As0T8cjxG+22hT8QM/aBdPTcgCWIVTKDp9zmps03CnKJKUPEARN0h0B g==;
X-CSE-ConnectionGUID: tIwRfhclSzWlp9tCLh5wlQ==
X-CSE-MsgGUID: OAkhASx3QwyFhqIRfW1e6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25628022"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25628022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:53:26 -0700
X-CSE-ConnectionGUID: h+V2f2nDQFKnAje72a61dg==
X-CSE-MsgGUID: c1PB1P+tRme+yNMyIqsCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="74258590"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 10:53:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 10:53:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 10:53:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 10:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvALsi3z/pqE+Mq5YiA/mzzGlFn/UxBxeyWzF+oPf80fSmG8tQeCa6ZtiwsR3vOaQqvWq/u9cR+XWsT3BWW3Nue5sjQRBwuuQr+Wu+bixbh4hg9RpV8sHGIxLmS+2KMEuNrx50ZNhRTfD+V5YbzD53opLrbwX+T1u11mj2HX4Br4eD8bVutqS8tj9ZzK+BQfII4lNTG488c3BZYd+qpDfY6f8ZaIU38HAlEtGPuvLyDLQ2tR+WaFJQlUIEUxMoQuO+WnPotLHqJh8XSCDkuvBhHLXSv44viOg4VAaCsAY5uaWTO3VIg7+lL8S4PuQ+qyKPHzwcp7O80mD7iD3XK3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwackrPWpPz/rXtxt99WlLO6OjiPiQd98UHc9iymYK0=;
 b=CjJ4Q+P+Fi/OrEKHzTuQDzb5CLjnI83fXK8gyAzyz9m33i1sQuMK6fWYhtYNqpG1ir4jwrQEeIu8k2yPNxIMDKW3HAVGBsC83vd2vItJTEsokTqmPbitAjypCHjhjnn0XNeg+fFsbkQkSsMLS7ewSKx8W9Kkfrj9K54IgxgvIYKTaNc8p7cSmmW6iYS7M4RHjev66Ol8+xQwDjVJvS5ECpmhtk7gUXWa/DqwxeJ4Un1U1nAb9UFIzMNAmfTX/NrZwhu/kmIIoH3ua5iodrmw4XmhOikVyoVf2NNhXgcpeM+0uDsiquSBAyZVv0w3iGvjl04J0Y3f4lggrL7BFJbyrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 17:53:23 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 17:53:23 +0000
Message-ID: <757afb01-308f-4042-8d70-17e1477a0f28@intel.com>
Date: Tue, 17 Sep 2024 23:23:14 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBDSS5CQVQ6IGZhaWx1cmUgZm9yIEZpeCB4ZV9mb3JjZV93?=
 =?UTF-8?Q?ake=5Fget=28=29_failure_handling_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
 <172658191854.1022204.17322220016425673205@2413ebb6fbb6>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <172658191854.1022204.17322220016425673205@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 4098dbeb-ff3d-448e-8fe6-08dcd7419d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R01YUXJaS0NJaFdKMnNoK3UreWZPb1RibElRSy9RWFY5Q3JEOTlJbzRsbmRY?=
 =?utf-8?B?TzRkcEEvck1BWEYxL2RKeGNwVThpM1M2QmRUeGhBU1BQRmhlY1JYbDNGZ3gw?=
 =?utf-8?B?a2dRTmJYZHJCR3g1TVBSbklrdnhMS2xRL1ZoMkxnbGpUd2JMWk51N2hHb29M?=
 =?utf-8?B?dmRIaWlsSitsWXBESnBtUlR1N2FKcTdKYXZJdkhaWDJZaWdmTnVoc1drdkEy?=
 =?utf-8?B?QkdQQ0k5NFpHNG5rd1Bvc2d6TjJ1ZmJJK3NZRkQ5SHpCa0ZjRzRLVVBQRS9q?=
 =?utf-8?B?UnVUdmdPc0FLbStKd1FRbmwzbFdybjlBUHhET3VmcWxUNS9BRDVJbHpYcmhD?=
 =?utf-8?B?ZmgrVVIvcktQVFRwSm9YY2ZmcmY2aEgxVmQ2WEhBMVdRVUR3U004cGxBWkth?=
 =?utf-8?B?S01rV092MlRKdG82VmdaTFVBb2t5T3VQcGZyWUUveS9YYVZRWHN2NVVSZWNw?=
 =?utf-8?B?OWdQR1FNeVBvK3dzSEdGeFRRL01rNFlFN3NUcDlyMXdsNXB6RXhMTE5rVDZv?=
 =?utf-8?B?bGIyeWRJS1NTZWd2RjV0bUVRNTh2SGNDOUk2UDVUei94M0ltY0M1SEkrdUhy?=
 =?utf-8?B?S2xDMU8zU0NocElKNmhzNUxVTkNnemdVK0FhaFdOM3lpQ3BtY2EwMHh3bEdZ?=
 =?utf-8?B?d3h2b3VyTWFiRzRDQUxtY0tmMUpQaHpwT2Q4UHNzaWQ4c3VmSFFtVldPaThz?=
 =?utf-8?B?c1dCdkU4M09Gd09kcUNJMUZ2Y2w5SExYK3Riem9vT1pzNWZ3ZlJVT212UlJY?=
 =?utf-8?B?VnlHSjNnQ3VlckFxRU10Y3RDUmQzN2JRRENGZVRXdWc5S0NYK0ZTSk1RT01X?=
 =?utf-8?B?bEdpRGlqYnJIZFUrVjlSdW9MeGF0Z2p3ampqZUFrckl4MXVPRFVtU3JISjNO?=
 =?utf-8?B?aUlxazgxQ3RwdXVLeGY0VnQvZVJvb2NjSU96SFBod2ZTUUE5OFg4U1hxMmhC?=
 =?utf-8?B?MStmZlhMRDhyQmU4UGduU2NuRTVUZDNtZWpvNDhsWDZaMmp2U0d1Skd5bXR5?=
 =?utf-8?B?WU9nQ1M4Zi8xSVdVamZFTzVUSU8xM2hJWlVVdW9SQy9sc2VUbkJRcTdhb3lJ?=
 =?utf-8?B?UGRPUURrUG9IRCs3ZUI1eVcvZU54eWFCL2dDNWpva3U3VmcrcVV0QzYyRG5v?=
 =?utf-8?B?cFRsWGRPWWtVT1I5dzdmYlZmazBrcG9uVnRwY2pTRVBVR3VpOGxaRXZ6ZVVE?=
 =?utf-8?B?OGZBRGJNaDEwR2lONVI2YXczMjVPcHFhUE54c3NnZmd3N2pMU2g3b08yZ3VI?=
 =?utf-8?B?UVFnOVR0a2VzN3hiTWtwS25hTEc5U2V4ZGMrNWxMMW9KczV1b1ZVSTNudXRY?=
 =?utf-8?B?bEwwSzE0Qm91dkN5dXFDVGIwOVh3VHlGM2pCalI3NFc4eGhDMTU5RFJlKzBK?=
 =?utf-8?B?eUJvMG5ycjdUWEo2eUcxMFE4UzJhS3dyZmIrUTFmT0d0QXpXcmF5M2tVOStv?=
 =?utf-8?B?eXhReC9TYmpaQ3VPUEE4QnU0QzlOaXF0U0k0UFRqRGY3UlBPY3JaSU5NcUV3?=
 =?utf-8?B?TktoWDdKNnNiaUxscnBCN2NSeThLRSszZ0ZpV2tyT3BNWVNWSEEzL01vN0RS?=
 =?utf-8?B?RzNJeVFoTWlnU3dNby9RSGdaMTNwQmNxZG1qQzRZT0t1cndWT0JZV0hrVTNQ?=
 =?utf-8?B?SUowVW5RUGhFRjY0blV5cmJPV2pXTHVKZk9GcEZPa051QlNTRlUrZmJNV1lp?=
 =?utf-8?B?OE1lcW1ZRk4zSG1GRGZVWjA0RTZ6YTJHMENCYlpWMW92TEhDRkdnRnJQTmhs?=
 =?utf-8?B?TkFPM0JnSmp0U3dQayt1dFNYbkg3MFZ2aTVrSkd3L0pBenZDbmpqUjFEZE5u?=
 =?utf-8?B?aG8vbmlqTURDZUhPMkM2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1E3MWoyZ3diZGFkckNqbEZkNzNESVJsTmFqM0dOYnZBTEJSZEhqS0lVVGpI?=
 =?utf-8?B?Z21MZ0x6enhDd1VHMFhGc3FlUFdtZFM5Q2ZzaWZ5VysvNzF6VW1mbnFUN212?=
 =?utf-8?B?dXNHVHdKMUNvU2JIM0VGTmk5cFNRb0g0TWFKMGFyVnIxZnRaNm1oc01BMElC?=
 =?utf-8?B?aDJUUWMwajJHY3FrTktxM2pZeisvdFJkd3ZnMTdoWElCVVZtc2VMcU5Za2V5?=
 =?utf-8?B?S3FrRFNoRUl2Z3A2SFFiQmtBbkMrNE9qcWtkRXN5M3grNVB1eExTTWJ0eVZp?=
 =?utf-8?B?NkljZnRta201NzZvM2l5YlJlU2JuTnJGSC8rd1NGQkFoTVdmb0F1VjJ1VkJB?=
 =?utf-8?B?K3FiQW1BTC9BUzFvL094TFFVL2pPRlV5Uyt6RUlpV3FUMjAxRkdIajRyUjlh?=
 =?utf-8?B?c0lvREtGRjlzZ1Z5dFZsSlpiUWVjZ3BLcXpVMm0yNGkxVXNldlAxc0tVdVBS?=
 =?utf-8?B?S01Kc0g4UDBjaUk0NE0zWnJXdk93dTE2eTMzckZhOHpmQmdtWDlKbFJPK21T?=
 =?utf-8?B?NnhrNUpVWjhkb2NZMWs5WGxaWkE2NTA2VndOdVRsWFQvOWdiUldxWkZPVkNl?=
 =?utf-8?B?OUd0UG1CLzd5VFUzc2hSYUF5eHYwR1VydzRsTzI0S3h6bXRtUjR1RllNT0xz?=
 =?utf-8?B?R0FoZkZodzRXM1UvRG5BaFZoUmlYVlpaVFhZN0lXOG9uWmU3Sm5tS0wxK0JH?=
 =?utf-8?B?dHVGbldKYzUzZ2UrMm90MGFLZ2M4LzFGOHZwUXJ5bTEyR1Q2bk1IWUs5amFp?=
 =?utf-8?B?c20vZkY2M0sxVVI0Sytzc1p1aDZFOXdHR2QyYmc5Mi9rQk4zR1NET2pUeE1T?=
 =?utf-8?B?UktNU3p5dW1LZlhkaSttSTJXeEMya1cvZWdrQnpqR0dDeWVBdVBXYStQZld5?=
 =?utf-8?B?a0MxcVBSZi90ZGMya1BRbkVBcldFVXdMaEVXaFVOY2N0UjdSa1l0TXRoUi81?=
 =?utf-8?B?MVhhekgvMERiU0V1MEhYSGY4RkhBdjlSZHlXcWgvSkhGS21nQS92amtSRWhZ?=
 =?utf-8?B?U1hwRVdLdXdGR2tienhpdHZJSlZQeWl5eTZEa2RPYzJMRi9jQmYyYkZWMk8w?=
 =?utf-8?B?R3cxZDlQUzIvOW9Md0tvNzV2b09DcEVscS9RbWRRcW5WZ2tLcWd5UWd1R2tj?=
 =?utf-8?B?ekFQNzc0YjZ4K1dEL0dRc0R4eVRqaUMvRmc0N0c3Ly9RNEh1SHRqd1o1MXhR?=
 =?utf-8?B?R1hHYzFoc0NGTUxVM3RBdFg2b2dnMnZJekRIZzhyV1BYTEdpQlJ1RE9valU4?=
 =?utf-8?B?a0JWUEw5MkFwNFVRYll4dW4xTkNIdUk2R1E1dGZTRVd5WGRZTWdnWHRxbmQ0?=
 =?utf-8?B?Rm51YUVFVG5aY3JJeUtadi9KME16dEJBZmVtTUNvcWI2WTRpVkFNdHBzUjQ5?=
 =?utf-8?B?SUVLR253WVZmcTE0VXhzcWlOb1hrQUxuYS8vcUlVL212dTRwbjJKVzN2ZnZn?=
 =?utf-8?B?OUQrVGRyZnd6YTZLRG1hdmdaQVR4aGlPOW0ySTlTQXFyRGxpM1U3cGpOeHp1?=
 =?utf-8?B?L1JzMzVyd3RhMmFpcDU0blZta3ZESDhxVGJYOGZtN2VwSDdEZlJEZmZSclk5?=
 =?utf-8?B?R2VuUVlUUUhQZ2I4Rm4xR0VSbUFtVFJIYm9WVTlhTVJkR0hYUHlpclJuVWRx?=
 =?utf-8?B?dVdrU2ZyeWh3ekF1K1dQYUM4Q3JWQm9rbkkrdXpLOWVIQWJyTFNXa2JOUWhv?=
 =?utf-8?B?QzRkZThtN3daeW9KS3Zka0pJdXJFWXJuU1UxWVRWenczR3lLbVBvOWF6Z0c3?=
 =?utf-8?B?VjByNXhNUUZUcGxxRDIyUnU1MmEzb1hrcy9ZOGtNakNlOGx3T2NTOG5jZUdz?=
 =?utf-8?B?c3VsVlhEUVE3dUhvZk5iK1JqaHJzcEY2NEh5cVg5aElDSE5sVWhkbndzTXVZ?=
 =?utf-8?B?WDZmbVdCQ0xvcmJra2JIckZ4QVRPOFJPRTdLWmo0UC9iblZTSW5SbDBlRWY0?=
 =?utf-8?B?NVFxRHZoa0FoZjRUQ1lEa3NDZnJqS0JSeWgwdW1TM3c2STgwb29WeGlVSkd3?=
 =?utf-8?B?S3BUOFNKRW1ESXNBT1c0d01EUTVuUCthUW15SXhaVlFYcmlXeHB3eFh1Y3VK?=
 =?utf-8?B?d2ROQ2pnMmkweG5qRTFqd0ZqVjg2RHYyZHRXdmkyMW9QdVhTRlkxdHRORmlv?=
 =?utf-8?B?WWxwU3ExZG5JZVowMUw0RXJ6MHJDbllVakt4VlZ0NTh2dS93RTNORXQyR284?=
 =?utf-8?Q?zJy35Mh72I+oJ91ueWkK7uU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4098dbeb-ff3d-448e-8fe6-08dcd7419d93
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 17:53:23.7059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ragTRSi4orXWcDUhl8C1aCbiNlVMilKEZd/nijd5G2yAwGrlnjvfrukoKCrkSXcRYtbcOlp/EsNU8v4oUpTo1SkNFyOjFA0EEwdQUuSR+k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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



On 17-09-2024 19:35, Patchwork wrote:
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-137982v3_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-137982v3_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (9 -> 0)
> 
> ERROR: It appears as if the changes made in xe-pw-137982v3_BAT prevented 
> too many machines from booting.
> 
> Missing (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-pvc-2 
> bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7

This series was verified manually before submission for review for 
device bootup/module load. I am not sure how the bootup can fail here.

Re spinning new version with couple of changes(which doesn't change any 
function behaviour from this series) will wait for result on v4.

> 
