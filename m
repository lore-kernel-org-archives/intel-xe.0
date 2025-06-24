Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B57C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 11:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC848825B;
	Tue, 24 Jun 2025 11:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtVLK2eF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FBE8825B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750763721; x=1782299721;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=sWk/h7xZlTV79ZPP2raKyaan/xJG6x9qOn9zc+wk9EQ=;
 b=YtVLK2eF8essQzflhOQtBzSWDwhWjZ/39rDLBnWKiflbHxpUZflREEMr
 g6PCycsDu/Hz3Ol5mTKzepxM/U1nvI4VeU13iI9tj6hI7D8LgtMX4FR2A
 ttn6CAna06LUkDlAh880vwAoIWRaDnGfsi/89wGmkDodlZrYkRs85AhIf
 e1coTxnNxDwv7+OFElxm16kRhE1VUnhLGYi7eEr2heO2BiZKAbIMfGIQ4
 Lno0dz1e3dGzSdI3i23b5BhuF4668IjVSsV5N9KFuTBt1aYWULVlb2gUk
 jI+8MxVsKFAL28wJllxHqNoASRa/NjTPi8GcuaxjlEvF5Nz17x6V9R2Tv w==;
X-CSE-ConnectionGUID: /3qZmoHHQbazv0L0aBBH4A==
X-CSE-MsgGUID: vdAZo8seR2euKYuhH/6rIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52967696"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208,217";a="52967696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:15:20 -0700
X-CSE-ConnectionGUID: Hgn+UOW6QUaKCGvgeFCSww==
X-CSE-MsgGUID: 6mqPjRdhTqulzDrEQpYOlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
 d="scan'208,217";a="151635854"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:15:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 04:15:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 04:15:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 04:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErxYwRyl6scwPx1Ba/b8Xt4tnGZrAcvNSEGEauXIa693B4xhg4oCgR/op+/zvGgyGsf+ROuBClac28pBjmxXOyBQxycGSlXAo2KTzUexfuPRZZteXaw56ZZuXwUM3dkcW14mPt0DvoJAkMagaBkZIbT5tjqxZ6h5qH4oy6UjjpivP8glV8tKuYNMFBw0y/geucLHSzKwf41SuOT/WPZdAoF8FmHtkmphRbl1CAjVflsF+2puBl+R4MYHqSfYl2AIPEMLOU2DRPhA9IZtS7Wh9sW77IlU710tHmWXCKUf0SKFqV2bpCpxn64L50uvAclgd5/PFE4MFU+DZb6pklFdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ6VgJpTSoCTdryeRKj9cEyPMfobq5FxVUWoDhbzBEw=;
 b=QEN6VPdwhDycMdaI6pdZep7OF8imHQHLmqqSe+md7NN1FOQyijekzYX8LqyKdzatN+B/hGq1GGq6NJQtijs9T0PKKRxYo0rQD58hlGVkC3zBfaRxttjDBjmwrHmAM1tw9iqQlrJoJW8GDZ3NBIC+yXtbxiVBChbDxWudER6C5E1WFEwZtFoncID/BcWCJWZIg8NyS+zjqzIGtZdi7dRo2we62tD9Bl0Mb16JgkwCp0BeYDcoW5VZyJLebdWOuM6uXbqVOAv4uJBjSOhomphAkXzmQ5iBXHs3uYZ9JVfllwgymdP1xxSwucJ5MPOrsoGqiLChgOxC4KeS9nATXYZtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM4PR11MB5248.namprd11.prod.outlook.com (2603:10b6:5:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 11:15:04 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 11:15:04 +0000
Content-Type: multipart/alternative;
 boundary="------------yub3gZ5qLfhTvQOTAvevzsZm"
Message-ID: <d2042a96-f8d6-4d69-81e6-a4c6990b99c8@intel.com>
Date: Tue, 24 Jun 2025 16:44:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,11/11] drm/xe/vrsr: Introduce a debugfs node named
 vrsr_capable
Content-Language: en-GB
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rafael@kernel.org>, <lenb@kernel.org>,
 <bhelgaas@google.com>, <ilpo.jarvinen@linux.intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <varun.gupta@intel.com>, <ville.syrjala@linux.intel.com>,
 <uma.shankar@intel.com>
References: <20250529111654.3140766-12-badal.nilawar@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250529111654.3140766-12-badal.nilawar@intel.com>
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM4PR11MB5248:EE_
X-MS-Office365-Filtering-Correlation-Id: 01397387-aa0f-4d12-1d36-08ddb3105e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0dicnZDL25YQyttM25HZEV3bkl5ejRRZVFtbFJSeUExVlJGNEZjTlBCak4r?=
 =?utf-8?B?QUVVYlJFVjNlRmc5a21tT0s3b2lMeUk0RkFRR2dZYnMvdnZBbDlWSGM1S0M3?=
 =?utf-8?B?Nmo1ajZUY0tIenZKRUh0TDBXSHJkZWRKbm4rb29iS2t1SkIxemxOK2U1UXMw?=
 =?utf-8?B?d2RoWlJJNGxpTEM2L3U3V0wzMkk1ekZSREI4djlOZFhZaGozUXJCd3FSOTZs?=
 =?utf-8?B?OVY2eEJPZzhNMGZ0OVNOMTdVS3RMeWI4MmllWm5adElITlpJeEp6Q1hiQ0tC?=
 =?utf-8?B?R0VJQjNTTlcrV25FaVhWamwxYlVoUlF1YjJQMXNldHo5bW5vTnAyUmVIOFpw?=
 =?utf-8?B?UzM3MkxHRWxDNmpQUkRHNFJRbll3YTU5bDZuYko5MGt2ZkN5dGI2dDB3ZGc0?=
 =?utf-8?B?bGFTTTBjS0pvTVFhKzhhL2pPcGxYKzBXT0ZFUmhxWHdnWTZtSGxYTEZHWVMr?=
 =?utf-8?B?cWJOTmtoMmdhNWR2alhjTFJURlZPNWlGcEwyOHV0dFZxU1pPbjU2OUxTS1h5?=
 =?utf-8?B?T3lvbHg4Wjc2cFdqSkZCeEROOW9pNWJnRjFtaXFNVFBybTBQWitnV01MbnpN?=
 =?utf-8?B?QmM2MVRTZTZmRUdoM1pETVdwQ3BmQVNma0FJcjhPM3pNR2RrQWV5Q2xGaXc2?=
 =?utf-8?B?Y2NUMFpFTGs0T3FRZ2ZzTUgrYjZqQVZqdjVTKzhHYU5BTTM2STdQQWhzYzQ1?=
 =?utf-8?B?SGlvd1JGMkhodWxVMzhzRTd0dmFuYlcvOUVtOUwyK3ZLemZsTTlTb2lsNnZW?=
 =?utf-8?B?ZGRRd1E1TUh3d1NGWTNIQ3B2UVZOQXEvSnpqSXVrbGNkdWJkRWtJbXdKMDZs?=
 =?utf-8?B?am5kYkl0dXBwMVN6NDZFV0R3K1gxcmlIUTNwMHVHQ0ZRNlY5TlFIdWNDVGNQ?=
 =?utf-8?B?TDU1bnFxWFFOL3NNZ2NrMm1LOUZPbWp4MTl0UTd6VG5aVS82ME9EbGc0Tm5j?=
 =?utf-8?B?YWRLSVVSZ01wMmRLZVgxNmkzNVpucnhBbXo0VkV4WHRUUXkzRkRtMzNlUmR2?=
 =?utf-8?B?cFd4R2pVcHEraGxkTFFFL1JJR1A3eWdFRDV5TkVxOWRlZWs1SUdESTVMZHpm?=
 =?utf-8?B?ZzYwVk1kZWFMTVdOTW5WaTByRjNJMVVkbCsvcklDckRPeXdPV1N4d2k1UUN2?=
 =?utf-8?B?Z0pWOFdGNFFLZlJTelhvN3FzRVZwNmFrREJEMW4vd1BVeDJFYnlkcnkxdkNv?=
 =?utf-8?B?V1ltcnhkSnRENzk4M004WjFBOFNEb0wvdUJMWmltNHE3aSsvUG1OQnMyZDh6?=
 =?utf-8?B?REIyYU1yWGNGMXBCcWwvQ2lMWDQ2ZUZrWTFRaUo0dFVaWnh4bkRLbkhqNTRh?=
 =?utf-8?B?V0EyZDhoc0hSNkJDc2kxMnM1aCtzRytEQ010MDF1UHVWcFhWN2Jjbnl3eUN5?=
 =?utf-8?B?TXBrWGxvN3labHEyL0REUCtpNGY0dWU1RjdYZXZMdTRYVytwOFd3Q1JPK1Rx?=
 =?utf-8?B?S2tEaVovblJIK00vc0N6ZmdaU0N3QWdzMVBiMVVvclhWMlMvenVmMEp1TDFh?=
 =?utf-8?B?TnBIaDl4Q0VjeGxXWlp6eU1BTjQzZU9wN29FRVREVldGNi9HSkhwMjBXeWpI?=
 =?utf-8?B?MmxPTUtkbzVkcWRpWVk4Wm9qTG5XRWdadnptMFdoMDE5R25qSVRqZ2xLODls?=
 =?utf-8?B?UGRTT0srMEV4NTExY1JFajd3R0hYalpmQ3R0TjFsb0pLVGJVa2J1OWFvcSsx?=
 =?utf-8?B?S2prQkRIOUlKTEZOV2pkelQwNEwxUFc3TE51WVBkMFNiRGtzUXpXbUk1N2RS?=
 =?utf-8?B?V1R6UVlMWVRCK3IxblNKb0V5NkJnMFM2K2didlU3Q2lNNUtqUmhsSkJXRGcw?=
 =?utf-8?B?cTgvOTVlbmlxd1JtcDlEMnpGTHVMZVNBdUlkYU9XNDNtQktaV2tXNmdHUjJ1?=
 =?utf-8?B?TnlNeXl4R0lYZHl2ZFBmUGY0bElOajRyWUxzdk9wUi9MQmNoYXRLeVRianFC?=
 =?utf-8?Q?twlAAXfCq8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDRPdFBNcERhNkZHU1haa0tDRmlXRWNuTS9VMitLZTJrb2pkN1kyWHhUOFFM?=
 =?utf-8?B?WSs3bTYzbHZEY3JlS1J4eVNGNmIzOWZsTllzUGt6OEFvMDhJQUdlMEEyR3NH?=
 =?utf-8?B?cTV1cXRZMDgxQ2h2VnQ3Rnp1TGIrR2VlOHJ4UlBDbTV4azA1c01kcitlKzc3?=
 =?utf-8?B?eVUwVE5PTERPYVVHbHRWZVdsOGUrQXhqZ1d6ZEZITkNLbnRsMHl5WE05bXVt?=
 =?utf-8?B?UVVIdTBRMkhjNUpWMGc0WmNNMDhBcWVuK2RvdUQ1Ukx5b3RxZlY4WHFONUJz?=
 =?utf-8?B?TlRrTmd6Z1lueTRvU0dPdXYvS1hmcnRENWFjRkRQYkF4QUgzZVpyV3NtWDJE?=
 =?utf-8?B?VFU4QytoR3BOWVhtZThDbWU0VEFpUFlIUm45Y1N2UnBNc3JvZU1xOGlPR09Q?=
 =?utf-8?B?QU5iUGpITWpMMG5Vc3BZS2pVa292NmZFM0FzcjVGWmFnRVpGM1BVQWd5TnRz?=
 =?utf-8?B?SXNKUlg4NEpoNDhmWTR5R3NlNjV6OUJRU29EMkxDTktvTGlaWjRoQUtaSjgw?=
 =?utf-8?B?dFU1SW1HOFpOam05Qy9ndFNGbXJRYmgzNkFmNGxTeGlMK0thcWR6QThjTXlK?=
 =?utf-8?B?eDlMUWV3T2w2SCtPQW9QTXNLS0tONTE0MlNydnVzaUxkRUdoZjFicFVmdFFt?=
 =?utf-8?B?N2FKb3RWalRjbFhaNkp0aW5DdDBJYnQwWEtpT2tjSnlBVktIdXF0aEN1Q1JC?=
 =?utf-8?B?QmVZcHplYm84cEhDdnRKQ0tMa2VuWHVzSGhUSE9BanNsSTBzWHJWR055V0RS?=
 =?utf-8?B?L0NxcHIyMzJhc2puYmNaQnZlUnNmdEJpckhtR28xOHlPSW5hd2ZVVWpMeDlU?=
 =?utf-8?B?THhSd0hMQjlvS2FaV3IrTlpMU1QwcUMzemFOU0V5TWZoZXorUitocHBzRTBD?=
 =?utf-8?B?OTRsR2t1T01kdTczaGJldXJoNmlnZEkrbWlNNkNkbGlSTmdhQko1RlhRcE5j?=
 =?utf-8?B?bitucDE2cVovNm5IVHdiSmFob0pIYnNLT2p1Wm9Zano0Zk0xdExiU0ZxdjZV?=
 =?utf-8?B?NjNCNXdGVkNaYkc0TlozcUN3VXVFdXM1UGxOSGhHUkZNUW1ZOHU2THM0RXpB?=
 =?utf-8?B?dll5NEJSWEd3S3FnOVVNU2JXMlh2akN1V2dmaDlBWEpESEg2S0pSNHZBOHRv?=
 =?utf-8?B?eC9ldkJZNTlXczNuSHAxQnNMUjdrTnorQ1BMWjJickE3V1pzckp6dWIxdXAv?=
 =?utf-8?B?aTg2STR0alVQeGFDTU5OZmhNOTkydUhYRjRFREd6RkNYNi8vZDI3c08zT2g1?=
 =?utf-8?B?OU1OMGNqK1plMU9VWjdtbUlWV1EwcVN1WWdZak5oYVAyMjVUeFQwbkRreFZY?=
 =?utf-8?B?SG1GaUlZRmNtYnl4VzF0NXdnSjUvZ0l6cC9YUExPdm5GUHk4eWFwNzc3cWJy?=
 =?utf-8?B?NkIvRmw2STFBRVdEQlFsN3FmUGpjQWVTS0FVd29vU21UVDhoVU9IcFUwdFlo?=
 =?utf-8?B?NHI3a1d6M3IrREJldzFaZ3c5VVBUUXFielpvT1dmZlNLL3hJbkhVVVBGK1FE?=
 =?utf-8?B?UEh5bEROU0Q0cnJvRnNXcUJWaDREYUFQdnY1SlU3TlMrMzl4cGhYakFVVHNE?=
 =?utf-8?B?Rk4vWUU2RlZYRDZqRHR0TU5LQzZZck9QWTZKVTdhZGRDZUF0OHQrVHpsSmpr?=
 =?utf-8?B?WUgzZWNrbGk5akhZcXdnZzFrbGh1cm15UnVLRnFlOW5VcWFHY21vSHhIRTN3?=
 =?utf-8?B?WDJFT0RhL2RwMHZXVUVVWGtxazBXSlllMDM5N3RnUThjaEJBTVZOSjdiSXhM?=
 =?utf-8?B?akUySElHWGFwbzJVNm1mNVZWOUNDdWh0bmVOT3BKTjZxUWdtYnNrNThRRUoz?=
 =?utf-8?B?Si8ybVJWSDZhTXBIelhzUXJDYlAvSTlzU0tiMXBrcFRhS2Q0WkIwQXRFRXln?=
 =?utf-8?B?V3hUL05OYW1GaU5ZK3dLVVBSbVcxTVlDaU1CZ3BFYWZDWUg0K3ptUmF5MCtP?=
 =?utf-8?B?SnpENk0wSmthZEdqSWpDdWNZLzNCWmtiVjcxV0xQc3BFWGNacW9JMWZFT2hr?=
 =?utf-8?B?K1plaEpQdVoySzF0V0V4NUduUzd3T1FqbzZmcEhNd0tySGhOVUx3NTRsTHlk?=
 =?utf-8?B?TG41Wmk3UnEvZHlJcUxwMFhPTlFxQ2xKVTYxT0g3UXUyckhvN3JxbnI1aEs0?=
 =?utf-8?B?RElkd1g2RTVXYXNKV2p0dEFLcDM4T3BTbEdpekdSZjlIYkJnejNPM3BQWTRM?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01397387-aa0f-4d12-1d36-08ddb3105e71
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 11:15:04.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcfNbYaE3x2uKuYkV4cP7j7V03JsbCgAMP9Fr7eozEckipm0GmpqI1uVJeZzEmPaWmIjMxU0Nm4G+CxkYK1DaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5248
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

--------------yub3gZ5qLfhTvQOTAvevzsZm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 29-05-2025 16:46, Badal Nilawar wrote:
> Add a debugfs node named vrsr_capable to check if the device
> supports VRSR.
>
> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..d969a8f6d430 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -226,6 +226,23 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>   	.write = atomic_svm_timeslice_ms_set,
>   };
>   
> +static ssize_t vrsr_capable_show(struct file *f, char __user *ubuf,
> +				 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len = 0;
> +
> +	len = scnprintf(buf, sizeof(buf), "%s\n", xe->d3cold.vrsr_capable ? "true" : "false");
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static const struct file_operations vrsr_capable_fops = {
> +	.owner = THIS_MODULE,
> +	.read = vrsr_capable_show,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -249,6 +266,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>   			    &atomic_svm_timeslice_ms_fops);
>   
> +	debugfs_create_file("vrsr_capable", 0400, root, xe,
> +			    &vrsr_capable_fops);
Instead of debugfs_create_file, you can use debugfs_create_bool here, 
which will simplify the code.
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
--------------yub3gZ5qLfhTvQOTAvevzsZm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 29-05-2025 16:46, Badal Nilawar
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250529111654.3140766-12-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a debugfs node named vrsr_capable to check if the device
supports VRSR.

Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..d969a8f6d430 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -226,6 +226,23 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
+static ssize_t vrsr_capable_show(struct file *f, char __user *ubuf,
+				 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)-&gt;i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), &quot;%s\n&quot;, xe-&gt;d3cold.vrsr_capable ? &quot;true&quot; : &quot;false&quot;);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static const struct file_operations vrsr_capable_fops = {
+	.owner = THIS_MODULE,
+	.read = vrsr_capable_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &amp;xe-&gt;ttm;
@@ -249,6 +266,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file(&quot;atomic_svm_timeslice_ms&quot;, 0600, root, xe,
 			    &amp;atomic_svm_timeslice_ms_fops);
 
+	debugfs_create_file(&quot;vrsr_capable&quot;, 0400, root, xe,
+			    &amp;vrsr_capable_fops);</pre>
    </blockquote>
    Instead of&nbsp;<span style="white-space: pre-wrap">debugfs_create_file,</span>&nbsp;you
    can use&nbsp;<span style="white-space: pre-wrap">debugfs_create_bool here, which will simplify the code.</span>
    <blockquote type="cite" cite="mid:20250529111654.3140766-12-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	for (mem_type = XE_PL_VRAM0; mem_type &lt;= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
</pre>
    </blockquote>
  </body>
</html>

--------------yub3gZ5qLfhTvQOTAvevzsZm--
