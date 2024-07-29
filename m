Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F7C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 14:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089C110E0D5;
	Mon, 29 Jul 2024 14:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbJ3yCys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BB510E0D5
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722263356; x=1753799356;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=+7hqWtI9MYoa+PBH3TUnoFbaUWTKVwjuRU+zD5/Ws70=;
 b=XbJ3yCys/CFQ2XY7nKg9wYRg5P1NrA5S6JPYksr/GVy4aSIoaw8tzcMz
 LXCHyVv+WYWk/eZ0mD6/dIMoexg1JzBlM86WeWrqsmgBnulHl68O20Mez
 m5YNyf+owl0ZeWb/eOthcaSV73raa3dezQvjLBwQyzwOphB905xZKd5pP
 /d5f8iutxryWNHAD4MgxsPnpGNd+ZV5y2ikvkH4oqRhw0M1fVQ+epTYXP
 ukg6L1ZJ8BE8gUhR/wyuKsThNu3eRYhQdw3eWoXsyeaWdlCGJv+KAKIp2
 pD7bL1vpRX0e0PXAotcyZizGEe5SXAe7xLBN744x+CtXzgOZEAQ5GRbNY Q==;
X-CSE-ConnectionGUID: FXK+uKFqS/KAA2riLmhGxA==
X-CSE-MsgGUID: lBDZav4bTueSwJdeqY3rKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31171274"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31171274"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 07:29:16 -0700
X-CSE-ConnectionGUID: K0NQWlFoR6WMqILyUX+4+Q==
X-CSE-MsgGUID: av1hPTDJSESbgaB6XLJI8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58578995"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 07:29:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 07:29:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 07:29:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 07:29:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 07:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bG5RJ7szD5Zq7jzj0WrW8LTyRZu/8bEGV1RGMz1wpTdq0hxDw0AqJEe7SlG0T7zuwU84km6QtjvSfDaDJhooXwYNJi/G6QqWHXYyxPfASngic+2311eBia5ELu9su1vxe9hEx8RYUyWrs6MQdfefK1J4pX7bAwOt5yOzp0UYbxuAWkMuN5N4sTqBhlv319zwSlgr7VdKcCr3m0kKFIvXcYBUHguxoQBY2iP7jpby6TlR9/CRN7IDcvT/DWl4+u2WfnmFY6HE+ZYIN2LzbnecNJ/oHepKNdAnIMn/WUffMIRzOK6WVgqU3aFtVox+1ycYYsZSe9WyTWEOLmgxAGD00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKiE1qBw5Z6VZmH1QN8zPFFpOtbNafzUXTaUPj32LqQ=;
 b=lAvRw8y/Y3AP4EYSFBt5OpKB88or1haKKhzwVWrJFRzipiI8WRUw/tVTXLIJzhlA6jkxruPxNiuNhRr0/ZHZPYWYJYSmZP3L8rqoMzsOdaiNmbir/M5JEQro32TayL0eOe+BVNOIfvdHWO4jftFGHtzXyNx3tdWcZkOMKLQLrzahd6TRaWCvQDEAy6JQgziPT7wKUPia/LETBtHZkiKG31L5pTLrQqZ946RlbsSDxsDydWqUocS5vfRndNWUA+78FED6msuR8+fePaX/PObu1ZFIeiHcS56hkKVY0NidKzSBlZn+munkkgyBnPWTT5jlrhs4CscHi/FQ3hIETF70xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 14:29:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 14:29:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240727015907.899192-2-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
 <20240727015907.899192-2-lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 1/8] drm/xe/kunit: Test WAs for BMG
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 29 Jul 2024 11:28:59 -0300
Message-ID: <172226333990.1863.12735643408052063757@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:303:dd::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 1128d364-d048-4ebf-c2af-08dcafdacc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkFJNE15M1dhekN1T2djUTVNZDhHNWJwT2pma1ZDa2E1SDRVNGo1OGhIQVlC?=
 =?utf-8?B?WlZiZENLcUxYOFBWQXAvRHhKSnFrdEJMOEp6aTNnSml3K1NqSnltK0UyaW5Z?=
 =?utf-8?B?M0FKbU1hb0NvU1dkcTUwc1hwcTl0QnMvc08waS8xRTZDVnJySVNLNk4wYnNN?=
 =?utf-8?B?aEV4U2dnNzZaQnB4RWhBOC9BUEcrL3lnQTNROGsxNXNBS0xyanlWV3hlTEFI?=
 =?utf-8?B?VnJNZXU1MzVibmh4T2JLYjRrWG5HTUoweWhVZ3VFTDFjb1hNY1dwSkpLY1dQ?=
 =?utf-8?B?RTdmY0EzeWp2bmdQY0R6b0toOFBLTFBXbWllSEk1VjZYODZQY2daeFlQSE9X?=
 =?utf-8?B?MURVdy9XdjZibHQ3WFFxcHBpdWY3RzYxbmUvTHlYaEY4SHBZcGN3SmZPZThx?=
 =?utf-8?B?OU9RYnpCSXMyazgzTUVqUmdWL1NSYlZ0NHRhdGNac2ZwQ1NBUkEvU3hxcm5z?=
 =?utf-8?B?NE9VNUlnelBzNGVtSTZmU3dUQnk1UVJZSTFyR1hLQjZVVVFNRXVJZ2hydXkw?=
 =?utf-8?B?MFhnOFNucGFBK3g5R2grWUdBNDcvb01hNVdzczdkNUZzaGJHaXhob0RxT1ZV?=
 =?utf-8?B?WWVqQnRqZklDeTdpMmQ1RHVRY3ZjMm9TMlVYQ2trd0hrZjJEZk1YMDdVbnJt?=
 =?utf-8?B?dzJ6Rm4vOWtvemM1aVZIWDdSYW10SGh1SDEyQVZhRTA5aXdGRnNFZEVmWlBq?=
 =?utf-8?B?SjV1TkVLbFowTkg4dFVBam41Y3pDRnBqTml1NkVhSE9LNWh5TWpQUndlOUJx?=
 =?utf-8?B?YUI1ZmxzenhBYlVvakdRT0hDdk1WU0tpWVJjNWJ1K05oNXIybXd5dGI3d21O?=
 =?utf-8?B?NmxkYU9BZ3laaHVuYkt0QUFxQWhpWHFqY2luRlQvQjNVU0FGbUpWQVppaThR?=
 =?utf-8?B?Zkw4dE5ZeDZucitPcFdMeVFWcXdSelB5Y0pkWUhLTWE3cWRWTTc0SWhYQlJN?=
 =?utf-8?B?UzhSZWlicmNyU0lKRC84VW5tNktJSzlIY0w5MFZ3ckpLQ1ROQ05hUW5MQ3Zz?=
 =?utf-8?B?bTM0RjBLN052THpDUElXSEF2cjBLVS9WMUt0MkFIbSsxTnRMRmh2WU43cEdu?=
 =?utf-8?B?dnE5R3BGVnU5dVhybElKekNJWWNSNHhUZUpwcEpDYU1wNWRSRzFVOWpYV2dJ?=
 =?utf-8?B?d1ptSy9heFJwdCtGWXZnbHZMTUxRaHZtcHpBMk9FM0ZVek9Yc3hCQk5lYVdu?=
 =?utf-8?B?NUVLOW9SY2RWQURybUE0WXlZTUREbEJ3SUxXOVI1cnZxUFU2L0lXRDh3NURQ?=
 =?utf-8?B?SWFCL0lIZy9jOUVyOUp1ZXRXdHQ2VUExNlNMWGFkVnUxaVl4TXZJNzc0U0I0?=
 =?utf-8?B?ZVZRREVqZ2o5ZzljT3JROXJIMmtxSFFpY0JyNHJvVUlEb0ROcEFweDR4QUdq?=
 =?utf-8?B?YlhhMzg0dkdOdElneENPTmtlSXJvS2Y4d2o5QXJQd2luQzcrRFQ2c0hYMjVB?=
 =?utf-8?B?bWltQ2N5cFUvVE1ZdFc1T09KQVd0Uys1NzlhdDJ6UVZhL2JXbUsrZmtheStQ?=
 =?utf-8?B?bXZRRGNMVGw0SlVkeWMxZjJ2MkRDZXluWFprUEJZbXY4dGVIRmhiZ3J1azN1?=
 =?utf-8?B?R1F5WWRLTXpLY3YzTWd4QkxnN0ZMWFhocDQ5RVVFbnUvTGlCN3B6NFZheE1N?=
 =?utf-8?B?Zzdld1kvY2FaNk9vQjB3andGT2pmc0pjT2ZFVTJJM2Z3OXN4ZnhiZHZiaXFu?=
 =?utf-8?B?N3dEanRpZnV3Umtvdnp2a0M3Wm5kTlRNZkxnYUl0V3liRHVPSjhvY0crbFR6?=
 =?utf-8?B?dlY0Uys5bStSNEY3M09nTXk5SFdIZ1lYOXo5cXhZNXhnYVRsZ00zbndUWm4z?=
 =?utf-8?B?Qno0M0JiUmYwNVgra20wQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFdMb2Q2NmpSOE5RZkNBRXczblRlK016UzgycGlzYXl2dWVJUkdsSUFLL2FC?=
 =?utf-8?B?ZmxUZHQwclNZZStneDhlaVlYdVYxL200bDFsdWMwek5MT1pQdHE3Wk1yVlFL?=
 =?utf-8?B?THZwSCtTQzFDQVB2cmxSSFVETlNHVmJQN2FZeVh2c295ZCtZbWI4R3c5RURr?=
 =?utf-8?B?WkV1cTdGTjZsMTRQZGZUR1FUV3hoL09UcjNPUzQzNmN2N2xwRXRKTDhHcC95?=
 =?utf-8?B?Q0NrcFB0Ly9DYTIwMWZaejliSTlOQXBQR1I3elV6eDFtSXNNZVFnVEE4Zk95?=
 =?utf-8?B?WHlpaUgzZDdGR29jYnVySVFyVkJxMFk4YVNFZ3JXMElsVWRVUGsrTUJXYS9t?=
 =?utf-8?B?cU44WkVYQzVQQTVOSk52Rzc0a0gvUkprN2VWaVhLMWRzUkxGTWdQdloxNmpS?=
 =?utf-8?B?WFlvRy90RkFhdWtCT0tyY3U3OTIyWkVxVUFZRFh2dkpVbHRuZldxa3cyWi9k?=
 =?utf-8?B?ZTV4SkZ3SWI2bkNuQjF6c2ZCVW5SRHF0OGhuRDFZY3NKaDd4SW1CaEQ0WXdJ?=
 =?utf-8?B?b2s5eEs5eUY5bG1CZTZTSi9xYy84L2g0Vko0N3dqOWtVVHRWMHMwMFdVdlFl?=
 =?utf-8?B?eGlJQWh1NHhkakRWc2NLQWliUGY4YUdPN25CNHdKYmk0WEIzcWdDU0NXUENP?=
 =?utf-8?B?M0pReWkyVzB2UTBMaFZuUW95TkUySkJ2K3pDbC9YVDBCeUY3dEpJRTBVc1Zj?=
 =?utf-8?B?bVhsWlBBSEpNdE5YdERSUmhHMjhoU1ByUWVpeUhmaHN0TVlrckxzNmV3ckZo?=
 =?utf-8?B?TXFud0JnU2dqbTdOSVBJNnFiMUNQTWtjN0dlNG1Dbm4wSmVwVFBZM09QWXYr?=
 =?utf-8?B?c3ArZ1g3SFZha0RyVXFUWEdsaHppVUh6WEpKYzd0L0YwcUozWjNjRzZpeVd4?=
 =?utf-8?B?QXhQTEVkdDRSNkZBN1VNelFYYmNTaDZsR0lEUGp1dFgwOWdUeTgrSUFocFV3?=
 =?utf-8?B?SmNndlI3WUNIRjdmUzRUS3hQZUNoYXdkVFRVQTlPMmRvWFNZQ1NEOU0rVWRz?=
 =?utf-8?B?MTNyWWt0SWgza2ZuN25sV0QzblR6aEI1MTFaZHNjNlBxZHNjTUpNY1B2aGV1?=
 =?utf-8?B?eVN3bHVLWWlRR3l5bWJad25idlVUV2ZSZFY0am9pbHgrNU1IQmpCaE5DMXVw?=
 =?utf-8?B?QTVsMWFhS1Uwbnd6c1VWR0xtUTNReDZxMGoxTmtidTl3d1c0QXlKb0NXeWxG?=
 =?utf-8?B?SEpKdHVOZis1ZE5qeWs5c3dGa1E1Y0xxYWI0bGR6VXpXUnFNTnhaMWt6Q1lN?=
 =?utf-8?B?akhyeEV6VDhjV1A1WEFRL1owWXAxWnJQWFBWVmh6R29qQkJ2NktUQncwSlJu?=
 =?utf-8?B?RytNQ1ZXWFRjSFNQWmsxaWZubjBwTVBLcWxKay9mV0NvOXNxNnA0V2VyVjZo?=
 =?utf-8?B?Nm5WWnFrdGhWbmpKTVRjM0ZtdE1PQitkaWFjOW84VWRWdXVqWFJzUlpud2Ni?=
 =?utf-8?B?OVRqUGtVNjdxNURTZHpMcDYzRk1mMXNFYUxuQXlPUVQweDh3MzdtVzcxOHp1?=
 =?utf-8?B?K1o4QzFXdzlMcTdqZytYM3BJNVRTSkdaQVB4WDE5Y2pyLzBFNXFEcFVVUzQw?=
 =?utf-8?B?SDc4UXkxajUwUktNT1NZOU4zQURONFRMcEc3NEtFcUhsU0xEK0tYQlQ3N2dG?=
 =?utf-8?B?a3poUHBSQ1o0RXYrbEZXZTRTbmtKcS8vVmlVZk5JNnRsVjQvTUN0ZnVKN0Za?=
 =?utf-8?B?WTdFZ3N2Znh6WWQ5emNTSWhNUFM5clRKNldQNzVMZUpERXJZSk5Ma3Yrc2Qv?=
 =?utf-8?B?MWQ0RHFpd1pJQlljQnVnR2VEOTAwckszeUJOWDJ4T3RMNmdWa0I5T2tQZTYz?=
 =?utf-8?B?YjRYdElrbW14SjhiUlRXblVYbkRiTlhTcFIwelM0MlpnS2NHVmd4Q0NnOE1V?=
 =?utf-8?B?YmhqZUEzdmd0a2ZQb1FWQThGRjBiWWg3UXNUR2Q3NW51TVBvamdGSTdlbVEz?=
 =?utf-8?B?YjdWYmI1dzlreTFQVFhIcjU2bEgzcktScDJVa0pTR1pMOEtYdE1KT3FmWUZs?=
 =?utf-8?B?Sk1OR1NqeEZiK0JvVlFmd3hyWkY3WmNxMVcxN2RXY3MrUWVrYy9Kd29leVNo?=
 =?utf-8?B?M3BYczM4Z002NENTaFREcVRkQm9vL20yT2RIZHF6cVU5Smp1RzU3UXdtNnY5?=
 =?utf-8?B?YUs2alBVNTJkMUpvRDdlNmxIWTFVTllaTFVjZ0E4amxQS0pzRWtTdEJUKzJ5?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1128d364-d048-4ebf-c2af-08dcafdacc4a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 14:29:04.6230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1u6IeTqwnfR2KqiI7mr4WChnglXCRPkb7vxVcmJhE+4bAhcxLWPS3QUsXqychy0vFZIrIscFlG9ZebHUIR10A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
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

Quoting Lucas De Marchi (2024-07-26 22:59:00-03:00)
>Add one variant for BMG to make sure the workarounds do not conflict.
>This matches the machine with BMG in CI:
>
>        BATTLEMAGE e20b:0000 dgfx:1
>                gfx:Xe2_LPG / Xe2_HPG (20.01)
>                media:Xe2_LPM / Xe2_HPM (13.01)
>                display:yes dma_m_s:46 tc:1 gscfi:0 cscfi:1
>        Stepping =3D (G:A0, M:A1, D:**, B:**)
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/te=
sts/xe_wa_test.c
>index 9d0c715142b9..c96d1fe34151 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -74,6 +74,7 @@ static const struct platform_test_case cases[] =3D {
>         GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
>         GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
>         GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
>+        GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
> };
>=20
> static void platform_desc(const struct platform_test_case *t, char *desc)
>--=20
>2.43.0
>
