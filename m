Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08A8CF9C5B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 06:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D06310E1F5;
	Mon, 23 Sep 2024 06:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LydUX4KO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB94F10E38B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 06:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727074368; x=1758610368;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-id:content-transfer-encoding:
 mime-version; bh=nXbgvVH5EF50ANff+ZG3gdhZVDh9IOe66xDEZJ6jC00=;
 b=LydUX4KORp20O03Uoy4Z3GqYWA8oIozqgGcKnMZDrA4ko9t30UzQi22A
 iTxZ6765oyIUeuSdRwSZc2TsiMzopOusdEC6b5VYqeCm05jzhLmD2i69U
 lba3lrtAK6/EtVnPF25oMVMIi8tb01rntS3j5TPIdtPtCC2hIPydJdifw
 Y3XA6xzPHMR4ScNFMtjzTENoFfz8oj0llkmvEjLrTKhGq5wBaObz+XtL1
 IlvYU6T2L7bQDme+sNMFOykO8+TPVvH1rLDibiY9Zp3UntSItDnpOAmXG
 latFWoV6pzO4bZLE0sXt0vOmnHbI1DBSU/+AMdfSB7LqDKCoMUhZGwwfQ w==;
X-CSE-ConnectionGUID: v/cfhZLhRP+Pg9KhWnn8Fw==
X-CSE-MsgGUID: 75IUiW+uS2OdxTqYcQBwkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37378119"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="37378119"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 23:52:47 -0700
X-CSE-ConnectionGUID: XKdKYnQ3SFeAHO+UjfwFcA==
X-CSE-MsgGUID: Ix/3oSTEQWa8PmeuRBHuUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="94304095"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 23:52:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 23:52:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 23:52:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 23:52:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 23:52:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M223rgQUD15gKrjaWCYDaZRO14eIn6zWc/1Ukztmfb5VfFF7qrc6xyfLQDUMycZ/NuEHwhivy0vudV9P5l4IwIIqkXArZJXxzx5zb33jvNs4YROp0gh6zj96UhP7zKUFYFcNgi58VGhOMAoFzfao/bQ9XRbFp+QRgJntV6JYsi6k49YD9cn3M7zYJYPwgU+jE/WQDclU9SDCRQm6Hr/jT2wFItosRnkBIDL/P28akufuB9/2vxNraaSege22igiAlm8TUteXpmDiNyMgln8PKQju/BLES8mt4KlVeXk9Klv/FSKmdB/A7ePzNDzq6jNanCO1W3geRBbQdXRk8fvNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXbgvVH5EF50ANff+ZG3gdhZVDh9IOe66xDEZJ6jC00=;
 b=Uz6ZSAb2jyWHNsMK+a7fipcahWN1lhdxw7w9D+isOE/HfQVxUHPaohUUZxlFoZ5XWzom0ILBQqM6JIxhf7fNuv7UTWCHct4VRwxz4cRW6Ba8Mzb89iACArU3VwxkKjVzI8IWQOkL/rBehfiid4g1AkXDbqL37HqKNgxXQQ+caxrWQNWOLvtEY6DesDKexIRlzJuf+KY+ICorKzQnuSO5CyPS6m8+24ZK5vt4CYpP6JXmfIrh16FDcCUWOFnjraqzEik0LJMx8+fyX+j96B3vOuK7F1DjYSQ61uMxSYywwDSWTvpk9UE2lVbKSDcrBq5PrlH2VTYDmSYDmwC1cEdAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 06:52:43 +0000
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::8de8:8579:ef2a:5f4e]) by SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::8de8:8579:ef2a:5f4e%6]) with mapi id 15.20.7962.022; Mon, 23 Sep 2024
 06:52:43 +0000
From: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>
To: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "andi.shyti@linux.intel.com"
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] [RFC]drm/xe: Introduce active ccs tracking
Thread-Topic: [PATCH] [RFC]drm/xe: Introduce active ccs tracking
Thread-Index: AQHbC2StIO9nSskCcE2L98HacAWfvbJk85SA
Date: Mon, 23 Sep 2024 06:52:43 +0000
Message-ID: <0ffcb1dfeff83970d753a6dc68e973e5b8f7584a.camel@intel.com>
References: <20240920133514.84426-1-tejas.upadhyay@intel.com>
 <wscurb6v4mzxoitxpb2mqr3olgpp5sahqssq3s6izccbl2mq43@eq2yo7txrv4m>
In-Reply-To: <wscurb6v4mzxoitxpb2mqr3olgpp5sahqssq3s6izccbl2mq43@eq2yo7txrv4m>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5630:EE_|MW4PR11MB5870:EE_
x-ms-office365-filtering-correlation-id: 7c8f0b99-6ec7-4fc6-b93d-08dcdb9c52f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VFVZL3owQllGblBPOG9YQjI2Uyt4TFlRdWphKzczK245bXgxMTNuekJNZ1VW?=
 =?utf-8?B?WHBlaE9XVUY3dGhjNzdJcVdoMHJTRDh0Nm9qMjFJaVdGM2k5N2RxRmFhcWRZ?=
 =?utf-8?B?OGxwb1NhSGt6SzkzdW1lRkY0RGdDcDBWaUcyQlA5SHhGWlRMNldhakdCRmxl?=
 =?utf-8?B?UGl1eFYwVUV4eXVNSFNPRnVyVUZHSHlRUHhpdktpUkdGenliYlE1R3VYSFp0?=
 =?utf-8?B?akthUVY1MDhMODVhVmpOdHpxRndNTnREcW02cXFJRnkyR28rSll0NlNaU291?=
 =?utf-8?B?TWFvSkw0QUdkQXZ1TkNTOVIwYkJHK0w4aHJFN3dycFJiejZib0pwdTJDQW8r?=
 =?utf-8?B?d3NZaFpxK3FwYXNSamlvaWRqNGZBUnZ4N3ladzNrM2ovajZJMTVJdkNxZE1P?=
 =?utf-8?B?YlczNE16U3QvdlQ5ajdHQmd4bzRkZWdabDlGajgyNytNOTRmOFBHN0ZlVWpM?=
 =?utf-8?B?bzNTYWJRMzZ0MGlHRTlWS1ZSRWV0bEZieFoxdmF2NWJjQmdmNjlucnoveWoz?=
 =?utf-8?B?MFhlejdFRTFkajhxajh0Y2VuYklUbHJENFpaTitub3ZsYTNvZWZvMFRQVk1p?=
 =?utf-8?B?SnhROG1DYlo5K3JqVGtzTWdwZHVXdzBCNy8rcmRxa2NRQS9Hd29rS3BSN0ox?=
 =?utf-8?B?QzJsNldRNVljb1FhZ3dmR0d6YkVyQmlFY2s2NEwyODZoc1ZSMThxb3hienY0?=
 =?utf-8?B?TDkvbldDZ0FHOFJmV2Q1TWQzUmdrVFpHZlJMcWxHMWFYSWtpbVR0ZlovMW9O?=
 =?utf-8?B?bUd5N2NKd2hYcEE0UTJFbFg2a3VCU3IzODVkd3R3VDREVHdyZzZwK2xWVjd6?=
 =?utf-8?B?c0J6dzYrMGZoU0R0M3kxa1FUZis3Y2M3ZWtSZ2RIbWV3blZwYTZ2OVlwTnR0?=
 =?utf-8?B?VzY3OUtFVzFiVFEwVFYrTmVCNHg3VkNOQ21FaWNHLzl1djNXZjdoRjY2RTgv?=
 =?utf-8?B?eXZkeWxpZHNCemdaRGNCTnlMR1FsbWZmYnNaL0EyL0htdlFxV2dsNHFXYlZj?=
 =?utf-8?B?WjdzdWp6NThJZ0xMUzdLcHE2SzNFdm9zZGRwcVg3VTAvaDRxUHUvY21tQjZy?=
 =?utf-8?B?ZjVHRHNQK0NtNGhyZ21zcGk5QndVQmxHZmVlQzFqWUdLUnh0c3RMRFRpMG1y?=
 =?utf-8?B?Tk9mZ2NTUGtDVW5VMlFsNXpIdUhJd0lsTTZuZkVtY1pzTUF1aUhhQmtRT1pN?=
 =?utf-8?B?MTk3QWJ0UytNd1RONDJHa0pEL2hURDBDN1BIV1N0anVhTFdXUzRFL3VkUnZ3?=
 =?utf-8?B?a1BMbUJMSUw4amxycXlqV2xNdWhCZnhjZ3VNVUxBc2preC8wYm0vQzlnUVFJ?=
 =?utf-8?B?QUU5ZW1lRGVISjY2SVZGWGhFU09VMnFjcE9mVUkvelBrWEpxempvVEZOT2xl?=
 =?utf-8?B?b0tKWTJ6d3JlNlFZSUt5eEVoczdLY2hsYVZ4b2tkejFLUUQ3V0FXRXlyWVNa?=
 =?utf-8?B?UHlaTE5HaDBIK1AzcGxDakZrcGtJOUZLZ2sxZ2MzSjdsc2JEZVhWVVVFQWVa?=
 =?utf-8?B?amlsVTRhZFN0TWhKejhqWTNELzNmRExURlJnUGthby9tZnBwVGNqL20raUNU?=
 =?utf-8?B?Mnl0Mng0aTJrZXF0VkVwZU5SaGpFWkVzWkMwZ1pmeXNETEhDNm80SVRGNWdO?=
 =?utf-8?B?eFNSdFUrbmNZLzlGSGZJVWN4eVRsbC9qM0xvVzRkTC9wMkgrczZTemdvOTlp?=
 =?utf-8?B?Z0FXRU9UTU1DUUNNekxVd2hPWW9ROWEyMStJZ2xOaStwdWdxKzhZdzV4Wnlz?=
 =?utf-8?B?SDJVM1RnTE9ENmF5elZhcVB6RGZXR041SDVyOFFvQmdDRVhFa2tvMGwrQzNx?=
 =?utf-8?B?OEdsTXhtV3djZzcrMHY3R05UYWU2cHVUVHl5cWFSS1FKU2lDQ2tOOWpjN0dS?=
 =?utf-8?B?TmJJZndXWURnNG1xQmdoWnhPYVNmQ3c0ekoycjNwYmo1K2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5630.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUNTNCtPN0NjWlVIVmZMbUVpTjBrVjNpMXdXRzZ5NExQTFdJb3o4QmVhWUtG?=
 =?utf-8?B?R1JHell4YU9wVmdqWDV4UjJJY0h3M3ZaMDgwd3FUSmw4czc4dytvVG9mQVI0?=
 =?utf-8?B?R0Vpb09veEVycEE5ZjBBZk13NExDL0F1MHM4REVyRlJxVUczVFQzZnpwWTRP?=
 =?utf-8?B?RGFuVG1IUGNhNkxPU0JHcE1iQlh4dHQvZkhROWxOdTZmdXBtbGNNUUk1cDRm?=
 =?utf-8?B?cE14YmVHWXRFYzVFcVB4RGczV0xNZDJKODBoYjlvbGRoZVVERjNyU1piN0RG?=
 =?utf-8?B?eUpWWGxONVc1c3JDNlZua0pXajVXbDFXMzlZdE5BQUlRNi9GUGtpZjdnUWRE?=
 =?utf-8?B?d2NhNmd4aEYvUU1sUytQbHJtUUcvRk9Vay9LYnQycU95a3BGSXhlVC9OSkZm?=
 =?utf-8?B?bXFDSGJwSWUvbXBuU1dmMVlwOXg0RVVYS3B3QlhWQ2c4cko1SEt3MllIckR1?=
 =?utf-8?B?QXdVYytLUFRDcnpJOTZOSm9Da1IyZXo3VnJQQlNPQXdwdXordHZYL0hvYkNW?=
 =?utf-8?B?UzJsOHVrMGpYVDRON1ZsNy9GUE9sdFRlenV4TXpFRXBoNkxnWW5iQWFCZE9B?=
 =?utf-8?B?VDlqa2F2MEREbnZzcDZicHdyKzUxQ1NxMG5LQ0ErUHkyZDVhTkJ0NWhDejNw?=
 =?utf-8?B?dmRUKy9TV3FyRDlONGFhMHo5QUwzTkR6UGZaQlRRWThRN3Mwd0tiOW5EaHZI?=
 =?utf-8?B?b1hGeVRjTDRGODBQd3dtUVM2ZXhJeUt3WDVvcXgzVGhudm8rdFA1QVZlbWhF?=
 =?utf-8?B?T0d6UjFUTkZuL0NJdjc4dHNrNWVtRkJoM3k0cDgwRkNldUVldm92SjNCQ3JC?=
 =?utf-8?B?bkh2UzlKdnM3U0FhTlRpaitOb2tSNjRibzlmcCtkQmRsdTBqMklad0g2dTNm?=
 =?utf-8?B?YnNmang0NzZ6czFSejJjOHVOVUdtYU9ra3ZIeU5xOFM1ZmlDdHdMZXZkdkR6?=
 =?utf-8?B?SVdLRi9RMVk4emRRdGRZK0Q3dGsyNEwybllySXdua05iRnJGb2dYeWhjZ3hU?=
 =?utf-8?B?T3I5OHVXS3prMXJ1VjFqbnlFU3JHWHBZdkZnWHVsVVpiY3FGYklyc2dYZ1ZQ?=
 =?utf-8?B?bS9iQ0FjYzVacGpkZ2E3anhBMEJyK2FkUmNHNEtkc2Z1RE0wMFA0Rzh6RFA0?=
 =?utf-8?B?ZFBvNjNsVVo3bXpscG1jY3YvVjc1MkRPYkNnZDIzN3hKMkhRMGJiM21EL3I1?=
 =?utf-8?B?K0RxWlFrTWtwVXhFQmN5YzVzMUhwU3F0RWk4WmRaRm1KRFhPNVpFQzRLUU8v?=
 =?utf-8?B?N29IdjNxOU0wZlFENDJpS3FwdGc1anlDTm5FTHN5ZEMyaTYwZFVDK25KRmRX?=
 =?utf-8?B?L1JMRGNHNTg0RUhGR0NtQTZKb2FWK3RSRVltMHdFTnNoNVA0U3pPV0ROOTFp?=
 =?utf-8?B?OE5QUVl6MzJya0NqTDJMcURrQnY0VVVqM1NBOU9oNVhSMUY4REZtd3UzTjlI?=
 =?utf-8?B?ZGtKS1dvdkh5UVlTRzFJdHVGdGtxR2cvWDZvdTVNM2kveUEzckdIcmxVWWZn?=
 =?utf-8?B?MWZvdnBESFNKRUFtSnR6M3RLOWxvb0tSRWpmd1NkM3ZOTnQrdGNpUEpXNkVp?=
 =?utf-8?B?bTU1elkvQ2tQZ2Zaek5zOW1KMEw0ZGxnR2hRc25XZllaeUIxbi9iMlZOR1Bo?=
 =?utf-8?B?NHZlMmpZUnVsVHhvQVNGazdpWmk5OXFBMUl2ejBZOE5QUnliUXFVK0t0S3hn?=
 =?utf-8?B?MTZOUy9ONU9PQ01mRlhibHpoNXpnSmdzSnEzd2N6Vkgxa212N2Q2OVFRMEFq?=
 =?utf-8?B?TnM5TE0rMXVsQS8rMTBYcFl6bDhSTG9lQ3RxcEhzb241T0tzM21KSzNDaWkx?=
 =?utf-8?B?clFBOTZWaTljOG4rbnFCMWFCV1VDY0RiM01UNTdNd3pPV253L1BEb2xvZFFL?=
 =?utf-8?B?Zjh1cENjYzYvMlpsa0E0WTR6WGRDRnh0dXF1RWtyMk13dVNpa3plSlBzK1ZE?=
 =?utf-8?B?bWNtWkdIWXhTOVliMlFKenFuR1JvaUQ2OXRtcEdtci9GU1VuVi9vc09LZTI1?=
 =?utf-8?B?RlBvTUU5M0VLOEtpeFVBK0NqVVhYNEg5SUR6VEVnV0VsdG5xdjZIREFaaDZx?=
 =?utf-8?B?akhrcVlwVGcvQXp1OTFWK3lDTnZBRTh1Z3dGaXN2dEM5QVM4c0R6TjNoMXFo?=
 =?utf-8?B?UEsvMDBzMU5nRytsUk91ZzFhTkkrWXpPMmM3TlJvd3ArbmROY1B6dEF1YWx6?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B9120A13E449246925478080A2506A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5630.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8f0b99-6ec7-4fc6-b93d-08dcdb9c52f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 06:52:43.3029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0eMajhAplSX5PCbxXFOYCh0uMuT6I3ab8a3UDPTWO5plEpJg/U7MrZXQtKK4FmN4XgUzipONckusPCGCwrfChB2qacmbzWEeYVhCE/kHg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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
Reply-To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

KEFkZGluZyBBbmRpLCBTd2FwcGluZyB0byBteSBAbGludXguaW50ZWwuY29tIGFkZHJlc3MpDQoN
Ck9uIEZyaSwgMjAyNC0wOS0yMCBhdCAwODo1NCAtMDUwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3Rl
Og0KPiBPbiBGcmksIFNlcCAyMCwgMjAyNCBhdCAwNzowNToxNFBNIEdNVCwgVGVqYXMgVXBhZGh5
YXkgd3JvdGU6DQo+ID4gQ3VycmVudCBjY3NfbW9kZSBzZXR0aW5nIGlzIGFsbG93ZWQgd2hlbiBu
byBjbGllbnQgaGFzDQo+ID4gYWN0aXZlbHkgb3BlbmVkIGRldmljZS4gSW5zdGVhZCBpdCBzaG91
bGQgYmUgcmVzdHJpY3RlZA0KPiA+IGlmIHRoZXJlIGlzIGFueSBhY3RpdmUgY2NzIGVuZ2luZSBp
biB1c2UuDQo+ID4gDQo+ID4gQ2xvc2luZyBkZXZpY2UgZmQgaXMgYWx3YXlzIGEgYXN5bmMgYW5k
IG1heSBsZWFkIHRvIHNob3cNCj4gPiBjbGllbnQgcHJlc2VudCBldmVuIGFmdGVyIGZkIGlzIGNs
b3NlZCBmcm9tIHVzZXIgcGVyc3BlY3RpdmUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVGVq
YXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCg0KPFNOSVA+DQoNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuYw0KPiA+IEBAIC02OSw2ICs2
OSw3IEBAIHN0YXRpYyB2b2lkIF9feGVfZ3RfYXBwbHlfY2NzX21vZGUoc3RydWN0IHhlX2d0DQo+
ID4gKmd0LCB1MzIgbnVtX2VuZ2luZXMpDQo+ID4gCX0NCj4gPiANCj4gPiAJeGVfbW1pb193cml0
ZTMyKCZndC0+bW1pbywgQ0NTX01PREUsIG1vZGUpOw0KPiA+ICsJZ3QtPmNjc19hY3RpdmUgPSBt
b2RlOw0KPiA+IA0KPiA+IAl4ZV9ndF9kYmcoZ3QsICJDQ1NfTU9ERT0leCBjb25maWc6JTA4eCwg
bnVtX2VuZ2luZXM6JWQsDQo+ID4gbnVtX3NsaWNlczolZFxuIiwNCj4gPiAJCcKgIG1vZGUsIGNv
bmZpZywgbnVtX2VuZ2luZXMsIG51bV9zbGljZXMpOw0KPiA+IEBAIC0xMzIsMTAgKzEzMyw5IEBA
IGNjc19tb2RlX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmtkZXYsIHN0cnVjdA0KPiA+IGRldmljZV9h
dHRyaWJ1dGUgKmF0dHIsDQo+ID4gCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAJfQ0KPiA+IA0KPiA+
IC0JLyogQ0NTIG1vZGUgY2FuIG9ubHkgYmUgdXBkYXRlZCB3aGVuIHRoZXJlIGFyZSBubyBkcm0N
Cj4gPiBjbGllbnRzICovDQo+ID4gLQlzcGluX2xvY2soJnhlLT5jbGllbnRzLmxvY2spOw0KPiA+
IC0JaWYgKHhlLT5jbGllbnRzLmNvdW50KSB7DQo+ID4gLQkJc3Bpbl91bmxvY2soJnhlLT5jbGll
bnRzLmxvY2spOw0KPiA+ICsJLyogQ0NTIG1vZGUgY2FuIG9ubHkgYmUgdXBkYXRlZCB3aGVuIHRo
ZXJlIGlzIG5vIGFjdGl2ZQ0KPiA+IGNjc19tb2RlICovDQo+IA0KPiBzYW1lIHF1ZXN0aW9uIGFz
IGJlZm9yZTrCoCB3aGF0IGhhcHBlbnMgaWYgdXNlcnNwYWNlIGNhY2hlZCB0aGUgYXZhaWxhYmxl
DQo+IGVuZ2luZXMgZnJvbSBhIHF1ZXJ5IChsaWtlIGl0IG5vcm1hbGx5IGRvZXMpIGFuZCB0aGVu
IGRlY2lkZSB0byBzdWJtaXQNCj4gbGF0ZXI/DQoNCkhvdyB0aGlzIHdhcyBoYW5kbGVkIGluIGRv
d25zdHJlYW0gZm9yIFBWQyB3YXMgdGhhdCBkaWZmZXJlbnQgY2xpZW50cw0KZGlkIGhhdmUgYSBk
aWZmZXJlbnQgdmlldyBvZiB0aGUgaGFyZHdhcmUsIGFuZCB0aGVyZSBpcyBhbiBpbmRlZmluaXRl
DQp3YWl0IGxvb3AgYXQgYmF0Y2hidWZmZXIgc3VibWlzc2lvbiB0aW1lIHVudGlsIHRoZSBoYXJk
d2FyZSBpcyBpbiB0aGUNCnJpZ2h0IG1vZGUuIEl0IHdhcyBiYXNlZCBvbiBmaXJzdCBjb21lIGZp
cnN0IHNlcnZlICh1bnRpbCB5aWVsZGluZykuDQoNCkl0IHdhcyBzcGVjaWZpY2FsbHkgZGVjaWRl
ZCB0aGF0IGZvciB1cHN0cmVhbSB3ZSB3YW50IGEgc3lzZnMgb3INCm1vZHBhcmFtIHRvIGV4cGxp
Y2l0bHkgY2hvb3NlIHRoZSBtb2RlIGZvciBhbGwgY2xpZW50cyBmb3IgaTkxNSBhbmQgeGUuDQoN
Cj4gQ0NTIGJlaW5nIGlkbGUgZG9lc24ndCBtZWFuIHdlIGNhbiBjaGFuZ2UgaXQuIEkgdGhpbmsg
d2hhdCB3ZQ0KPiByZWFsbHkgd2FudCBpcyB0byB0cmFjayB0aGUgdXNlcnNwYWNlIGNsaWVudHMg
KGkuZS4gaWdub3JlIGtlcm5lbA0KPiBjbGllbnRzIHNpbmNlIHRob3NlIGRvbid0IGRvIGFueXRo
aW5nIHdpdGggQ0NTLCBidXQgcHJvYmFibHkgYWRkIGFuDQo+IGFzc2VydCBzb21ld2hlcmUgdG8g
Z3VhcmFudGVlIGl0KS4NCg0KUmlnaHQsIHRoZSBpbi1rZXJuZWwgY2xpZW50cyBpbmRlZWQgbmVl
ZCB0byBiZSBleGNsdWRlZC4gSSB0aG91Z2h0IHRoYXQNCndhcyBhbHJlYWR5IHNvbHZlZCBwcm9i
bGVtIGluIEFuZGkncyBzZXJpZXMgZm9yIGk5MTU/DQoNCj4gQUZBSUsgaXQncyBub3QgZXhwZWN0
ZWQgZnJvbSB1bWQgcG9pbnQgb2YgdmlldyB0byBoYXZlIGR5bmFtaWMNCj4gY2hhbmdlcyBvbiBh
dmFpbGFibGUgZW5naW5lcy4gK0pvb25hcywgK01hdHRoZXcgQnJvc3QNCg0KQ29ycmVjdC4gV2hp
bGUgdGhpcyBjYW4gYmUgcGFydGlhbGx5IGhhY2tlZCBhcm91bmQsIGl0IGxlYWRzIHRvDQptdWx0
aXBsZSB1Z2x5IGNvcm5lciBjYXNlcyBhbmQgc29tZSB3b3JrbG9hZHMgZXZlbiBzaW1wbHkgbm90
IHdvcmtpbmcNCndoZW4gdGhleSBleGVjdXRlIHdpdGggbGVzcyBFVXMgdGhhbiBleHBlY3RlZCAo
d2hlbiBDQ1NfTU9ERSA9IDIsIGJ1dA0KY2xpZW50IGV4cGVjdHMgQ0NTX01PREUgPSAxIHNvIGl0
IG9ubHkgZ2V0cyA1MCUgb2YgRVVzKS4NCg0KU28gd2Ugc2hvdWxkIHN0aWNrIHRvIHN5c2ZzIG9y
IG1vZHBhcmFtLiBTeXNmcyBoYXMgdGhlIGJlbmVmaXQgdGhhdA0KY29tcHV0ZSB3b3JrbG9hZHMg
Y2FuIGNoYW5nZSB0aGUgbW9kZSBiZWZvcmUgc3RhcnRpbmcsIG1vZHBhcmFtIHdpbGwgb2YNCmNv
dXJzZSBiZSBzaW1wbGVyLg0KDQpSZWdhcmRzLCBKb29uYXMNCg0KPiANCj4gTHVjYXMgRGUgTWFy
Y2hpDQoNCg==
