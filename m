Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06D9C3ABCB
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 04:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943210E40A;
	Tue, 17 Sep 2024 04:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1iDCe5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F3C10E40A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 04:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726548789; x=1758084789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NhP0MD1ws1hWybXrs+KjzkistgAI+H3tkCeWNnXDYA4=;
 b=l1iDCe5cSqyZSSS6BpdPz1Xp2eoqlkG9+t/H6VL7zFyp9pHO9I8PADc7
 Uzrawqi5Hhd2fJsLn1e5TiNCvw0Jtd/khVNbILin67pooCzCbNThQIidv
 w8o6nd3zR+hOqfZO+WuDgAQ3UsxAjGM/qcCxuDFzkX+y3JyXoR6C1zb7/
 imKgvJSUxmLr2R3QKPYta3uB7rLSPLggPFjaynNcm4YWu3YxzszQ/vV1w
 q0f70y+ozvaGOR+FBSk7I671sJMPkAKePAHJAz7dY/NQgWHiZQSNAU6yg
 fxwOxk+Eo1tKaqMA/do6XZ8aYPWA7cr9CtVLGCJ8OsHlQtOC/acWPH94D Q==;
X-CSE-ConnectionGUID: he9puvQsT2aolBZnSBJiKA==
X-CSE-MsgGUID: vO7vGbcjRKCTYOIZ4gnCnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25275452"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="25275452"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 21:53:08 -0700
X-CSE-ConnectionGUID: PufR6M5cRVOiM/8DkUuj3w==
X-CSE-MsgGUID: zAfuKFo0SQm0YYXsjAJfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69034579"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 21:53:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 21:53:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 21:53:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 21:53:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 21:53:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwws0NCrfWzUuKyRqPKWGgj44VK8WuyvL+dLbwbWdO4atS13lDZTgjd8/GSMedvW69wtX85xDU01P2Wc6f5fD93mrlmAMqas6BcZ+/y4d8NsFd2LbIbm16s1r1V2A/2QmjSggHoiGpR1ZgqMGHKJ5wYX3XPiUe5DMRflPY6Vlt6b1v+rkn3o6ltnmpmEMLl3lbsyeU7hrhWRiGgWkfyyKO+qzvNRlJCK2sYrG23IftVzy6ewH+WUvZlIzqwECefQMRG3QzVWV6+NN5KGBFZfLHHinaqH9POlcov4UiHb7/E3axmJ6lVkgUqip5lEB/bc+9NDw8gDeJgkwIF147GCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4p/vvsIrP5iip3QmiepBJBY+x48VcQZZ7gXhdui/FI=;
 b=QadsgZHTHDEK/Qm/2bdNFS35ry+keifHabw5hxJEqCAgrCz3FN99y0scIgMpMIOrwdrU+xPPcjg0Hw38VOOlnZvC4FnHUkUJnDprhT0oyUtIS/TNo6QG6D9LuRjHQ6ocJEPJIN16MdKuLGPv+Ab1swCVuPEBalhebszIy18U+sY4mou92pZ1up/4OTy2f47bQrNFaP/SuDXQmyzWOpTXRyZ0AoI74vsIU/1rjX0uSxRwPVCayqdLEozhIQyafD9C5acjLi0LTJ9T8hLNZjZ8sUfU+uUKBrvubo5nX0xtYfl7uQi2tGtS2JnMvQLuX+Oq3A2K4fYhFk5JI4JkmHGJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 04:52:59 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 04:52:59 +0000
Message-ID: <326ecbd8-e5cb-40f5-b1d4-987339f49c6e@intel.com>
Date: Tue, 17 Sep 2024 10:22:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
 <fdf3d4ea-dacb-48e2-8b20-a4fd6fd73e00@intel.com>
 <c93e3fcd-6648-4a07-8645-6e10310f0b41@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <c93e3fcd-6648-4a07-8645-6e10310f0b41@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afd3b65-0ced-4464-6dd3-08dcd6d49a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlZdXVneWFJNXJUclkyeVNlNFVTam9zVWdWVG1vVTVOZ3RNNmU4Ky9oKzRD?=
 =?utf-8?B?UnAwV2NkclNoZlJmN05lZnFHMzFkeVU4eGM0UjExRDMxTjRjR2hiYnp4UmJF?=
 =?utf-8?B?SjFrZlFlWTZPZUhqL1BTdFRFZVgweWZnemtEejUzV0wzYkxsRW1VRlFlK3VF?=
 =?utf-8?B?MDV1ZFl4RnVZUXk3OForWjlCUEhZQkJ4L1FzMTB4Q3BXcWdZTDRKNDdud0pj?=
 =?utf-8?B?ZkVGMForQXpiak93ZVFMWWFSckVjemh6aVBBNytTRncvVHRIMUh2TTNWVlFN?=
 =?utf-8?B?NjJjR3FlVC9PdXdhODBMQkNsM3NHVnNRVFpEcmx2VUg2UjVJVU9KbUhRV2Nj?=
 =?utf-8?B?NGlVL3poSFN1MEsvK0RrTThqTlRtMm9hUTNKRFhuTXZtNDRwSjhkc28vZUZR?=
 =?utf-8?B?V3E4VVFNMHFXajNWaW83cTdQVXJxZjUzSGxrYmRLbHRjR2RRRnE5UU1EbXAx?=
 =?utf-8?B?SThOVHF6bHBBWjhYV01TOWpHaVNqdzZSZUxsaXluSSs2NnhobGE0OEptemhp?=
 =?utf-8?B?ZTdIZ2laQ0hFZ1NjQjFudGp0NUNqa2dMYnI5V1FlMVhvQ2NEM3dPaUZzb3Vo?=
 =?utf-8?B?K3Q3ekpRWmo0UUtOS016WHd6SFVKdWJTWXNWOFkyQXFOMWZDK2hJVkxIL1Bk?=
 =?utf-8?B?MW16cTdxaGh0b2VFaXRkbTZ1S3pzMGpXVk1GRENzVC90WlRtbE9SM3dmUzAw?=
 =?utf-8?B?ajFnaHY3ZzIwVXhiNjdEQmpuWVVBZ3JiaUhRdzF3TGlFcURwOVJHN3l3WUVY?=
 =?utf-8?B?bE9xbWtGVjBPbEZtMDFWc2JnRERURTkwS0ZNZnB6UEQ0ZXBueVNtR1EzM1VR?=
 =?utf-8?B?Nkd6NlRCVDdjUGx6TVEydVZiMXNVR1hLNlRNMzVySDcwaGplRm1oT04xdVpx?=
 =?utf-8?B?L3BxUitXbm1ydk54bG9ZMmI4WDlUcWNSVExXYk42Zm0rNm9WbWhXTURpWnIv?=
 =?utf-8?B?UVZKYXA5UFp2TEJneVdLRFBNdnlHR0Q5QUEyVVd6Vm9NY21CQXBtbnB6VStU?=
 =?utf-8?B?WTRYNXN1NXZOVis4MzArdGdza20xTU1oOHlScXV4LzBUNU1wME10dDhMaWpE?=
 =?utf-8?B?b2Y3WXVwTXNERXFqZE4xbVY3bGI2RkttaDJ4WFREcVRsZkxGbFZGTERoUVp5?=
 =?utf-8?B?M2NqN01kT0hUc3BKT0QzQXFTdGxDamkxOURzZG0wZ2ZDdCsxeENHdjAwTDZJ?=
 =?utf-8?B?WHVFU0dPb3kzb2tBRW5BVWpyNmtTd2FzUEZSNW5KejZRTUhnNmUvb1VWL0Fa?=
 =?utf-8?B?dHU0KzJuaE5XS2w1Y3pVcWlFLzJuRGl5bnZHTmxTSjlxNGUwZTdYNUdEVFIy?=
 =?utf-8?B?WGF6VnlQYXpMZ000d0JGS1VRZE55SHBhSEplR0o1YVJGQkhqNFRrdGlvQ3BX?=
 =?utf-8?B?T2RwTG1kMWdwNnJWTW90MnJyYnNOZXFiY3R3eDR6SllWS2ZvTC95Uy9XL3Qw?=
 =?utf-8?B?RTQ5dlgxZUNwM1lHQk0vTlE4N29sNThKaG51NThkSHpHZzVWQlplVUdrRThE?=
 =?utf-8?B?SkszaVFudk1UTmJLeHRPcDRFbTduMGJtUlJzOUk2cEtMdzFEZVdINzFnYXR0?=
 =?utf-8?B?Z2twZFBBM2xjUk85b0M3RjVacGUzVkFPQnh2bkVzOE9KcEJiNUpWN3I4NEdj?=
 =?utf-8?B?bW9PWUFIdlpKdEFySTBuRUhDUDRvbWJTM3VlamJiMlVkUWtXQ2FxaUN0RWtj?=
 =?utf-8?B?V0F0cFQvdlZhR3N2TVFyTU1CYVZLSDVTb2NkTlpLK2ljWWdta3pCSmRKcU41?=
 =?utf-8?B?TENXdk5MWVNzM1ltWHF0cXE5L0VQYlZHVXJtbmwzL2dPQzRJbkREZkFQdi80?=
 =?utf-8?B?MnFPTkl5eDJCSG1CZVYxQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9WcjllUmUycUk4MmZyUEh3QmZqQ1M3aHhHQ0hSRkVORG1zYzdHdXY1SjZG?=
 =?utf-8?B?Mkh0MWxzMStuMlhQblhsRGJCNmE0QkNEay96S1U5TFNkZ0RlMWhQRGJYNVVI?=
 =?utf-8?B?Nis4Z3AvRzlHcnVmWno0U0swNk8zYVhZYVBzWlB6QU9SaEowNzFqeUNLU1Z3?=
 =?utf-8?B?Z3N3KzZ0T0J5YU04aXVqOTVLcGFSeWZwZzZKNjVUakJWbDdLMEpGM3dRZ1lF?=
 =?utf-8?B?T3pOdjc2WENxb2ZVQUpGOGY0VjFOcUlSZG94OTQxaDVEaUx4WlEvNFB4MUlE?=
 =?utf-8?B?cFArYmVadGx5YzF3cXd0SDJHN1hvakN0U2JQdVlnam5sNnhEbGFQb29OUFlx?=
 =?utf-8?B?Y21UV1dDZHhWRDMwWGdXQUwrQzgzWmhZRUFKd1BFTHBLVUdMdkFhMmpTS1FF?=
 =?utf-8?B?TGZTZjltcDN0TDlrL0YreGphei9mZ2NoSXlWYWFJeVNld1JPWGlxRWJMUEp2?=
 =?utf-8?B?N2xZT2VualdETUQ1YUY0VzBvZjRsNXJGQjd5MGtFZFc4MjVIQUxTOGJJOHAr?=
 =?utf-8?B?QkVaaGc3ZmtTdytzdVBaSWppWVQ1Zmx2MjJOdVF3OExJNC9tNXdoSTQwaUVZ?=
 =?utf-8?B?Y3lYcHErMnBlaXpOU1ZRWTgvWEs4K0FDT1IzNFdsd1ZkM0ZuKzQ3ZEhKUzE5?=
 =?utf-8?B?dmN6Ym9vb2tQekF4RzJZS0c5ck1VU3NLdk5iS1F0Ny9VMVMyTFN6Q3VtRDdB?=
 =?utf-8?B?WVB3cDc1d2NiaGwvbVdhdm9WNTEvSk9KcDVXVHErWEFrdGNiQ3BRT0prcVpw?=
 =?utf-8?B?Z1djT1pJazlKdVJ0RFBUSm1uTjE4S0dvWnVycDlVOG9taU8zUXZrSk16Uk9M?=
 =?utf-8?B?dXI2c0JwSHVJdjc0TjRWN2dHWSt3cGtqQTIvaksxaE5aSkFkSkVtUmlqOStn?=
 =?utf-8?B?SGZzK1JML2lLdVpOUy9TdjNIOXdXU1UxUXFmWjd2SG5WMkFFSFFDV3Q4bUFt?=
 =?utf-8?B?cTg1ZFY1blFQcXpSVUxCZmE1eFhnLzdtSm5qY2pLbVl2R3YyeFVmNXowVlhU?=
 =?utf-8?B?VHZhamtTcnV6OHZ1QXZsUnpTMnIrbzY3MTBDcXdUNDNxK2JYK3FwVkZXMW9w?=
 =?utf-8?B?UzZnSVM1YnJWMlpsRmh0S1lkYU41dmxYRVNXSndSN0dmT09oSUR5VE5PZTEw?=
 =?utf-8?B?VnJjRnlHY28wR1llRC80LzA1bG5tbUNpdlRXTDhKbkFqaCtGeElvUmlySlZV?=
 =?utf-8?B?WkJqT0tjcWNycUgyQ1J4cmJ1T3BoZUZIOHFjMUtoYXp0MWpIKzlUQlFXQ2Ux?=
 =?utf-8?B?YkdSdkowdjRWM2tvQmhaZEFCSTA3YVVwRDFKOTFXOFpxM09UNUhBSnk2OFlz?=
 =?utf-8?B?WU5oWGIwcmVJSENvRzM2bEYxVzJwSDRmUVRLaUpHYnlHVDNudkZ5enNJU2Vi?=
 =?utf-8?B?ZlRjOHEveWhPd1k0azh0U3JnUi9ZRXAvU2RQaERWR0VXU1FwUGtRVkV3RG4z?=
 =?utf-8?B?cDY2Q2piZ2QvWmdpMVVma1hTMTJtaDFzLzduM1VlSGVqVlBSZWRsNlRWK3hh?=
 =?utf-8?B?VENhUzdJU1o3d3hCcXVxSXV4TU44bjZoK1hScVV3ZkwxUDA4YlQyemJjTjc5?=
 =?utf-8?B?SFJua1hzZkRNalROdkVHdUF4OGczU2JWM1JablYrSkVZZ1U2OGZPTTFza0NY?=
 =?utf-8?B?TTd6TzY5QTAyVnFpNXk5STdOZ2RleHhvWUd2dGpIazgvWlZQUTBoQ0U4ZjU4?=
 =?utf-8?B?a3VteTVrZGFiNUhsOXFRcXp6WnFvMWY3UTNTcHp3RGVVbTlXLytlTmg5d3Vq?=
 =?utf-8?B?NXo1QzhXOG00V255UEx3RGNacEtaZ3Fya2M3c0JEVzArOXZRZ1ZmOXBuQUho?=
 =?utf-8?B?Y0pDSzBNZittQnA5NklIczBuUklhKzE5YTY2K3Q1blV3dVBGQ0RmRlFnOTU5?=
 =?utf-8?B?N0IwM1BueWxBcGJWdXdWbDR5alNDb212UmxUWFg4ZlFKTDlOOVpoOFVzQmtL?=
 =?utf-8?B?aWJPWXVDcSt1djlMRGdkQWN2SHlLUXRuVFIyVzRXdUpmaEtnOUc0UzY0S0tC?=
 =?utf-8?B?QXlNekkrQkswcmJPYy9xWWhZYm50QWU2YzdYS2NNWkpmM2JaemJEV3NxTGdW?=
 =?utf-8?B?RzZWUmlFSHcxc2c0Zy80WWQrVzdrNjRNV21uN0pzSlNQcDl2WjZpb2dGY2V4?=
 =?utf-8?Q?GUtlGYj+GKwbb63wpZD2KddjI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afd3b65-0ced-4464-6dd3-08dcd6d49a4f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 04:52:59.3667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xgCmFqazqaCYJTxPEyWbjgzG83ayTnxP2lgRN8Qt/lY2SXng8aSdBhDoK1Hm9KUBaci1H5hoWVLGkwNjphFSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
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



On 17-09-2024 10:18, Ghimiray, Himal Prasad wrote:
> 
> 
> On 17-09-2024 00:12, Nilawar, Badal wrote:
>>
>>
>> On 13-09-2024 00:46, Himal Prasad Ghimiray wrote:
>>> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
>>> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
>>> void.
>>>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>>>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>>>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>>>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>>>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>>>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>>>   drivers/gpu/drm/xe/xe_pat.c        | 30 +++++++++++++++---------------
>>>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>>>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>>>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>>>   13 files changed, 59 insertions(+), 65 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>> xe_device.c
>>> index 5edb1cf51ea5..cce754801e8d 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>>           drm_dbg(&xe->drm,
>>>               "Flat CCS has been disabled in bios, May lead to 
>>> performance impact");
>>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    return 0;
>>>   }
>>>   int xe_device_probe(struct xe_device *xe)
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/ 
>>> xe_drm_client.c
>>> index 01f643f6aaba..e5defce08281 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer 
>>> *p, struct drm_file *file)
>>>           fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>>>           if (fw_ref != fw) {
>>>               hwe = NULL;
>>> -            XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +            xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>               break;
>>>           }
>>>           gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>           break;
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/ 
>>> xe_force_wake.c
>>> index 73d37e79da9c..01b8bfdd748f 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>> @@ -11,6 +11,7 @@
>>>   #include "regs/xe_reg_defs.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_printk.h"
>>> +#include "xe_macros.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_sriov.h"
>>> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct 
>>> xe_force_wake *fw,
>>>    * and waits for acknowledgment for domain to sleep within 
>>> specified timeout.
>>>    * Ensure this function is always called with return of 
>>> xe_force_wake_get() as
>>>    * @domains_mask.
>>> - *
>>> - * Returns 0 in case of success or non-zero in case of timeout of ack
>>> + * Warns in case of timeout of ack from domain.
>>>    */
>>> -int xe_force_wake_put(struct xe_force_wake *fw,
>>> -              int domains_mask)
>>> +void xe_force_wake_put(struct xe_force_wake *fw,
>>> +               int domains_mask)
>>>   {
>>>       struct xe_gt *gt = fw->gt;
>>>       struct xe_force_wake_domain *domain;
>>> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>>        * in error path of individual domains.
>>>        */
>>>       if (!domains_mask)
>>> -        return 0;
>>> +        return;
>>>       spin_lock_irqsave(&fw->lock, flags);
>>>       for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>>> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>>       fw->awake_domains &= ~sleep;
>>>       spin_unlock_irqrestore(&fw->lock, flags);
>>> -    return ret;
>>> +    if (ret)
>>> +        XE_WARN_ON("Timedout for domain sleep acknowledgment");
>>
>> This looks good to me. There is no need to propagate error if domain 
>> failed to sleep, warn on is enough. Additionally we should see if fw 
>> domain ack bit is not cleared due to PCIe read completion timeout. 
>> i.e. if mmio read for fw ack reg returned value 0xFFFFFFFF. This means 
>> device is in bad state. In this case should consider putting device in 
>> wedged state.
>>
> 
> 
> This seems to be good check to have. On cross verifying, I see similar 
> implementation in i915. If you are ok, How about taking this as seperate 
> patch ?

Yes, i915 has similar implementation. Sure, lets handle it in seperate 
patch.

Regards,
Badal
> 
> BR
> Himal
> 
>> Regards,
>> Badal
>>> +
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/ 
>>> xe_force_wake.h
>>> index e17fe316dc3c..c2c729371b2a 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>>                   struct xe_force_wake *fw);
>>>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>>                      enum xe_force_wake_domains domains);
>>> -int xe_force_wake_put(struct xe_force_wake *fw,
>>> -              int domains_mask);
>>> +void xe_force_wake_put(struct xe_force_wake *fw,
>>> +               int domains_mask);
>>>   static inline int
>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index b0126daee359..5f5760b60eac 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>>        */
>>>       gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> -    XE_WARN_ON(err);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       return 0;
>>> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>>       if (IS_SRIOV_PF(gt_to_xe(gt)))
>>>           xe_gt_sriov_pf_init_hw(gt);
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> -    XE_WARN_ON(err);
>>> -
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       return 0;
>>>   err_force_wake:
>>> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>>>       if (err)
>>>           goto err_out;
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> -    XE_WARN_ON(err);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_pm_runtime_put(gt_to_xe(gt));
>>>       xe_gt_info(gt, "reset done\n");
>>> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>>>       return 0;
>>>   err_out:
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       XE_WARN_ON(xe_uc_start(&gt->uc));
>>>   err_fail:
>>>       xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>>       xe_uc_stop_prepare(&gt->uc);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   }
>>>   int xe_gt_suspend(struct xe_gt *gt)
>>> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>       xe_gt_disable_host_l2_vram(gt);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_gt_dbg(gt, "suspended\n");
>>>       return 0;
>>> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>   err_msg:
>>>       err = -ETIMEDOUT;
>>>   err_force_wake:
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>>>       return err;
>>> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>>       xe_gt_idle_enable_pg(gt);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_gt_dbg(gt, "resumed\n");
>>>       return 0;
>>> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>>   err_msg:
>>>       err = -ETIMEDOUT;
>>>   err_force_wake:
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>>>       return err;
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/ 
>>> xe_gt_debugfs.c
>>> index 86146de1d31c..2ecf3c87c6b0 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>       struct xe_device *xe = gt_to_xe(gt);
>>>       struct xe_hw_engine *hwe;
>>>       enum xe_hw_engine_id id;
>>> -    int fw_ref, err;
>>> +    int fw_ref;
>>>       xe_pm_runtime_get(xe);
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>       for_each_hw_engine(hwe, gt, id)
>>>           xe_hw_engine_print(hwe, p);
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_pm_runtime_put(xe);
>>> -    if (err)
>>> -        return err;
>>>       return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/ 
>>> xe_gt_idle.c
>>> index 9af81b07ab7a..1a7ee5681da6 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>>       }
>>>       xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   }
>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>       XE_WARN_ON(!fw_ref);
>>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle- 
>>> >powergate_enable);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   }
>>>   /**
>>> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>           pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>>>           pg_status = xe_mmio_read32(&gt->mmio, 
>>> POWERGATE_DOMAIN_STATUS);
>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       }
>>>       if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_pc.c
>>> index c7a00565216d..27ad412936f7 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, 
>>> u32 *freq)
>>>        */
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>           return -ETIMEDOUT;
>>>       }
>>> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, 
>>> u32 *freq)
>>>       *freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>>>       *freq = decode_freq(*freq);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       return 0;
>>>   }
>>> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, 
>>> u32 *freq)
>>>       *freq = pc_get_min_freq(pc);
>>>   fw:
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   out:
>>>       mutex_unlock(&pc->freq_lock);
>>>       return ret;
>>> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>           return -ETIMEDOUT;
>>>       }
>>>       xe_gt_idle_disable_c6(gt);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       return 0;
>>>   }
>>> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>           return -ETIMEDOUT;
>>>       }
>>> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>       ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>>>   out:
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       return ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>> index 80e5c4ef86ef..8d7d9e7ade51 100644
>>> --- a/drivers/gpu/drm/xe/xe_oa.c
>>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>>> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct 
>>> xe_oa_stream *stream)
>>>       xe_oa_free_oa_buffer(stream);
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>> +    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>       xe_pm_runtime_put(stream->oa->xe);
>>>       /* Wa_1509372804:pvc: Unset the override of GUCRC mode to 
>>> enable rc6 */
>>> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct 
>>> xe_oa_stream *stream,
>>>   err_free_oa_buf:
>>>       xe_oa_free_oa_buffer(stream);
>>>   err_fw_put:
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_pm_runtime_put(stream->oa->xe);
>>>       if (stream->override_gucrc)
>>>           xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>> index 96d5ec1fbbd9..4372dd727e9f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pat.c
>>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>>> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, 
>>> const struct xe_pat_table_entry ta
>>>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    int i, err, fw_ref;
>>> +    int i, fw_ref;
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>       if (!fw_ref)
>>> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>>       }
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   err_fw:
>>> -    xe_assert(xe, (fw_ref && !err));
>>> +    xe_assert(xe, !fw_ref);
>>>   }
>>>   static const struct xe_pat_ops xelp_pat_ops = {
>>> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>>>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    int i, err, fw_ref;
>>> +    int i, fw_ref;
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>       if (!fw_ref)
>>> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>>       }
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   err_fw:
>>> -    xe_assert(xe, (fw_ref && !err));
>>> +    xe_assert(xe, !fw_ref);
>>>   }
>>>   static const struct xe_pat_ops xehp_pat_ops = {
>>> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    int i, err, fw_ref;
>>> +    int i, fw_ref;
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>       if (!fw_ref)
>>> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>                  REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>>>       }
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   err_fw:
>>> -    xe_assert(xe, (fw_ref && !err));
>>> +    xe_assert(xe, !fw_ref);
>>>   }
>>>   static const struct xe_pat_ops xehpc_pat_ops = {
>>> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>>>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    int i, err, fw_ref;
>>> +    int i, fw_ref;
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>       if (!fw_ref)
>>> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>                  REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>>>       }
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   err_fw:
>>> -    xe_assert(xe, (fw_ref && !err));
>>> +    xe_assert(xe, !fw_ref);
>>>   }
>>>   /*
>>> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, 
>>> const struct xe_pat_table_entry
>>>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    int i, err, fw_ref;
>>> +    int i, fw_ref;
>>>       u32 pat;
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>              REG_FIELD_GET(XE2_COH_MODE, pat),
>>>              pat);
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>   err_fw:
>>> -    xe_assert(xe, (fw_ref && !err));
>>> +    xe_assert(xe, !fw_ref);
>>>   }
>>>   static const struct xe_pat_ops xe2_pat_ops = {
>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/ 
>>> xe_query.c
>>> index 7c866b736f00..df7bdf3822cc 100644
>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>       if (fw_ref != XE_FORCEWAKE_ALL)  {
>>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>           return -EIO;
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/ 
>>> xe_reg_sr.c
>>> index 6ab6a48b1d29..874523f22f56 100644
>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, 
>>> struct xe_gt *gt)
>>>       xa_for_each(&sr->xa, reg, entry)
>>>           apply_one_mmio(gt, entry);
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> -    XE_WARN_ON(err);
>>> -
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       return;
>>>   err_force_wake:
>>>       err = -ETIMEDOUT;
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>>   }
>>> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct 
>>> xe_hw_engine *hwe)
>>>           xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, 
>>> slot), addr);
>>>       }
>>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> -    XE_WARN_ON(err);
>>> -
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       return;
>>>   err_force_wake:
>>>       err = -ETIMEDOUT;
>>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>       drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>>> index 3b5256d76d9a..1384c97a75c2 100644
>>> --- a/drivers/gpu/drm/xe/xe_vram.c
>>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>>> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, 
>>> u64 *vram_size,
>>>       /* remove the tile offset so we have just the available size */
>>>       *vram_size = offset - *tile_offset;
>>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> +    return 0;
>>>   }
>>>   static void vram_fini(void *arg)
>>

