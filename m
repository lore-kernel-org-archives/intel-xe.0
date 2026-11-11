Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F959606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 19:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YAx5Bpk8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC9510E0BD;
	Wed, 11 Nov 2026 19:37:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA0E10E0BD
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794425849; x=1825961849;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KcAnDzDgZvqZ0JxBgOksGLvcAS7hCtey9qxcruBkKuY=;
 b=YAx5Bpk8W2/eea6XZnLrUWJZN9icBUPHqc0YPkwSSOXMU6dGQbulQNYi
 ZpXlIQFqYJPkI55DP3GqXbW43iRUXJQfscsc0GRQa+rEfg7OTvLTW/K1O
 u+CmQ6rZkVUOUJe0YSsmmHy8SlTgr6UpQ+dIntsB5x8olsTX8NCHRucuu
 LWtKWP+8D1UaznmXuELdjpYkaQoOvc4Z/BWOHkoourJ/tBI2T3ut+Jplv
 TtRc4X2/jVieCZqGornS8/rMmHIMRTnAtLttOWygJb2EVAH2tfiveRF71
 2Nn3Cx3rR0x7vsrhwyxvX1U+Nqu7p/a8RmKr0SW+f4mgnhEOrZZSfZ7h8 w==;
X-CSE-ConnectionGUID: FtuvRUWDTa+Aq2vWmV8Wpw==
X-CSE-MsgGUID: 0EdqDzzrTmyvVRFCQRc9Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3247830"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3247830"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:37:28 -0800
X-CSE-ConnectionGUID: kNahLn9VQWWxpOQXo0BWtQ==
X-CSE-MsgGUID: WqMBKE0FSbq9Xzbo9qEQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8448758"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:37:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:37:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 11:37:26 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:37:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueq2VP/NbbeAM+rxcWQ/MrhkFghdbepTPUAYlaORBl8cZA0YDFIcXHhPjJRBGTW9EyHS0Gq4ObVmsQUOf4bemFqWsG5aeyMQSSjy1GlVDU6U1gXc7Rdjz01P/oFD5mgIQOc07+LKltMrtz3ToqkH540SPXAHy4Beep51ncx1m8Ud/jSATvvNKAJ1x2YhYkb2t3k7DaatoTLWnMMe3rQS5TpTWH30WjZETL1y5OmYS6Jn76HrE0n9snDJIN7hkjsKXWYSq+I6O2x5IfpXprCErWDG0NFqOi+KzWXldilDn9Uxe10hj9MJdE1X+v7Lyi+PzpHr2lXPLtubCEYYOHfXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79fHhUqoezMaGVBNBGynyTBeeydJkOCVRmHQQJeZE5M=;
 b=y10E81dFDftVKc92rYOsLhtXcKmzORV7Ph50fAoI13FOXlLdLh8WYWZHs6fOTjygktpL1fKVUIzWBTY6AZ19fkeNgNTzUT5HFOKYB4jw/3jHvwpC2b6wdapo422QRz89PxjhmguxlIHOuRoOEsl2w41RL1FC1ymCmHirosjoEv+cuub6SFGRdvjMvOgsUaQQu8pocC+zXStPam6DiSMbEiwlsT2eW5fyVrLdBULcR/4QY21TdGOyKL4pWJ9cOt8JBA6LH++h5iZ0esCUivu0R14nKKlrNwAbr1M95fWCT6+rLcgFv4i1WHb/1dlReaYA+swPalSVIfq286YzpJB2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:37:19 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:37:19 +0000
Date: Wed, 11 Nov 2026 14:37:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <fei.yang@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/configfs: Allow overriding the GuC hwconfig
 table
Message-ID: <avTD6oXFiZcjPmAg@intel.com>
References: <20261111000818.238585-3-stuart.summers@intel.com>
 <20261111000818.238585-4-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111000818.238585-4-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 773383d9-8ba0-457b-5829-08df402b32eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|3023799007|261022115727099003|261022075727099003|261022105027099003|261021130227099003|261021123027099003|261022113327099003|261021121427099003|261026130827099003|261102123227099003|261028144727099003|261026135527099003|261026140227099003|261026121527099003|261021135927099003|261021133027099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Gl200PEyB1LKYnBsUV+Ktp3x3siqiKU0BYSfVMMKcWczwCcATXXUr6VnV8uDfosGsfRXUE5vIseVYS4VBD4PLetlW16VQiyMtwMGH4WWhl5mq4ANtNmvhKh2+GQ3mmEZzuM34YYJhx2bjJ0xvQgJ8m/DeLDEzr2mmrOiufcX8bBrx8GAqDGLGTX+nGzlZKdqkxxJcYXgaDovZ6S6cyy+T5Nmf0SodzUXUJr12xFmXIyBzqS1HNQpUP4KfNly2iuUR+XvUqAcRHeDpLt9fuWI8E3nO9QXAlQ78S5XHPu5Y/pdl++cQZFrYgzxEn+TYrN1741lmLI8tA81QznTIIoeP8TVrUwoM+sq+VyP8yXQuw2rHNqBKRG0ZrcEugif2dpeUcdvltpwfudFgXgW+5wnTyT4J5UpKCAXS38nJjV/Q2l5KWG1s4u6h23FJjRRnrLPTdv0FIDGbtusrRaKGTiPgezuTsvp4B79lLpFfaLdasYIUeCkfmiB7m+u16mYi8yRB1rBDoV2fA+N2KzWOk+t8wNCYap0W+V7MnADhY5W4910qT828KIivBhsnD4eamL98iBWpoMuP4frx0NMG3hsNBL5QG1tEf0NieY26u8lQmnCuScREVylkvFmqejPp50e1K8M8spxMunPUWB7N+8SNUzhzD3FArGSk7x/TBn+LVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261022115727099003)(261022075727099003)(261022105027099003)(261021130227099003)(261021123027099003)(261022113327099003)(261021121427099003)(261026130827099003)(261102123227099003)(261028144727099003)(261026135527099003)(261026140227099003)(261026121527099003)(261021135927099003)(261021133027099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STlYNXNtOFR0bVV3Vm5lelRLZTNYOVh1a1F6S3ZUUlMzNUdoSGtLdFRQbEYv?=
 =?utf-8?B?RFlwTEVvdHNTTmRCd2Vxci80NWJkUXF3Q05KTDlqRnplcG5jVyt5dnB3b0I2?=
 =?utf-8?B?NFB3NzRWTVh1ZWZQZEVUNmtocGJpQm5QRFdOMFZBd1JGbm45UEhJbjhXMFFy?=
 =?utf-8?B?TGlXK0hLTnprL1BEd0VPbGIxY295RjBBU0h4RFVVeDI2aXFwcktWaXFBdmlR?=
 =?utf-8?B?b2grQnhYa2dqM1N3VHhhb0VPZnNRSU9lelpPS0RVTHBmbFUrbXc2SS8rY0VK?=
 =?utf-8?B?VDFlY09xVmx2V1JkaStSTTNqU3h4Y2Zna2ovaktqVmdyN3VhR25CM3hiaDhj?=
 =?utf-8?B?aEpLZjFWSkNIclFoZmo0WGJna2NDTGNTb0tVZ3NjUlQ5MWtUUHU2ZTEwQitB?=
 =?utf-8?B?WG5WUVVIb0FINnpmTWJ2UXZ6YS9Ta1pJQ0djMms3WTlnT3RaTFhGa3RrWVNh?=
 =?utf-8?B?aDBuVjZ6WXBvRWp3Y283YnVUNWxiZVFsT0RXdFA2RDVKOXhIVzVQdGd4Uzcr?=
 =?utf-8?B?OGNCRFVmMHlobTZXZWdnMTMwTW9LZFpPRWZMWXlJV1RTTDR3aUFzVnp1ZFBm?=
 =?utf-8?B?dVBZdEV0QS9VYUc3M09BcmlhanlLa09FL3pFRkVlaHdBbHc3ZEJBUkF0OUdT?=
 =?utf-8?B?bUM4djh4TWpseFZhY3Z0czhHeFY5SmVYYVIwYnFhYkZneE1rMGplQXkzc0kr?=
 =?utf-8?B?UTYyc0xQY0gxeVc5MDQ0b2dpMXdsY04zaWcwNVFlSVdWZE0wV2RWYzFKWXho?=
 =?utf-8?B?OWdaWThybEJxQ1h6SHJBMVVSb3ZRamluSytJOVFFWnUyYjBDVXJ4UWUrTXYz?=
 =?utf-8?B?MCs1b0JaSkQ0UUptVlRlMVRwdEhLZCtvWlJrUGV6dmt4N2s1cndUc09jZ2U4?=
 =?utf-8?B?N29nNlVxdUNJSzQ0VG5GeGRWMWtMNzlKdWhqcHRqbEUwWjJYK3ZWSWxqcXgz?=
 =?utf-8?B?WUoyN3Q4R2VJRzlXNWloU0RleFFNQjhTdkxyNWpmYnpqbkhKU09ZNFpVbk5T?=
 =?utf-8?B?dFBsTzNjT3k2QWUrWGw1a3pacU5uMGxRMDk1RW1VbThtOVVnV2pVNHdVa3RW?=
 =?utf-8?B?Y0dlSm5nRHI0NjE4Rk5TZkk1RkkwSG1XZ2V4bjJFODRZMTdkZXR4ZmwvSFZC?=
 =?utf-8?B?eDdMSmRSOFlSOHZ3UG1DNTZQeDB3UDcrV1phc00xVERUSmFKSVcyT3lNSlU5?=
 =?utf-8?B?UFVHcHhmTG0rWktVQkRPd0Q1TWpReDh0UUU4alRIT2VEb1BGdTdaTE83NDBH?=
 =?utf-8?B?NVh4eEJSNk5FWVZmaUN4ODhaVFRnNms0YUdnakxsRzhxdWczZTczT1RTNzhF?=
 =?utf-8?B?WkVtOWdEUHJaNDRzY3RySTVMQitlRVVlRzNkZGdIUUdiN2NwYVZ1aUlwWVNx?=
 =?utf-8?B?allKOGtRS3E5c2dsWkd2Tk1TTy8wUkpKSUtKbldCWUR3Tk5ZVXRNNEZKUElU?=
 =?utf-8?B?STJJV2NKV1lGL0NzK3lneHV4M0laSEtXZUttYjU3dktjblorMnVuOTJ2NzNj?=
 =?utf-8?B?N1hVcGxRekY2T09sTVRWRDI2ajJwaSsxSStBaGNXeXZLR1J1dGlEdzlKbVRJ?=
 =?utf-8?B?aU5zdkY3RmQxM2JtaytqMnJ2bXFyTVA1bnd1VTN4NTd5c3M1L2c4WktBWVZY?=
 =?utf-8?B?UFpoM1AvNkhFbmd0cHlSRUdsV1dBL2FwcUZiblNVYUNTL01pSTgrSnN3Wkk3?=
 =?utf-8?B?clh0RWhkbUR5VHJMdEl3bDZNbmFpbDM3U21SaFJtMVJ1cDVyeGhqYUduQ3ZW?=
 =?utf-8?B?cHhXZVgydjBHdFpuQU5KMFFZNjArRy9WWlV6bE9kWFhlSjB4bHpoaXZRNE16?=
 =?utf-8?B?azBzSE1CT0dyNXkwdzhRNXNwNmsxOFcwaFgwV2R6UFVrQzd3SktFdWM1bkNo?=
 =?utf-8?B?NFJQZUtKRmU0SmVGU0UrV01YclJoZ2ZXQWNEeGtTOEg4Tk51MXdRS3V0RnE4?=
 =?utf-8?B?S1JYWWhHZnNOR0ZQY3ZPYnhJWHhoaFBJNDNLUmlRNFo5UGJoWm9aZHFGdjJW?=
 =?utf-8?B?Qnd2L0hTNmdDU0dhZlFwM1IxTWI2UUxTNXloemtXNUtSeWxXNitWWnREMVlU?=
 =?utf-8?B?ZDlFTlFRK1I1OEkvMWx4aGtSYnpLREtKUHNjUGhFTVlJWUl2VU90SE0xNCsy?=
 =?utf-8?B?YkxmRE5kU1ZIelBNdmhoKzFlM3FQY1FZUDVNT2daQ3F0M0ZyWW55aWtWQzVx?=
 =?utf-8?B?VjZPeW9FSVJEUlNkMVRWeVJrYTR2UG1rQVJqVWdMUkxuMitCYWZRZUkrckk1?=
 =?utf-8?B?d3JueHZOL0gxTWt5UDNqNWJneVp3WFRpNDJvRzdDSm9vQitEOUFkbGZFUXph?=
 =?utf-8?B?TU1vY0RIK0xTZElaWGpIQ1dkdDZFNjJ0REc1ejlWY3JwV0k1ejRUQT09?=
X-Exchange-RoutingPolicyChecked: 5QS7mP8hlpJyfrYEgkZJMURkM+osstSkId0l47gZaxHK2QWqZJZOOc5GHIZlSo2XfsRxqCsJfJjZfjG6cxdq3y6byjco0j2xCFhBtqlaGP8Gyv/iRVgJZI7OFh8ubE0T0gQ5ckK2i2RQ/MjYBOOkChp/1meY1R2+hnowiyUW0xnPkcp7g15FhT5F/QsVybNiVpyik1G8TF9iGb2aeju68gGyy+mAlLXcT4/Jrc5v3RwKWqyuJNYIF1sUwcioSb1HedgRbA4IZ2aLxO10kTpYuoUOnISpW+R+AQrRsRBwYtlSIabU13NRUqQ+Z3l0XK1RhnoPPZ8CXieCNjtjooE1TQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 773383d9-8ba0-457b-5829-08df402b32eb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:37:19.6688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w28ELZjtPbHMvUCmhv6bHq+9l3fwY2xoj3UIyGo8gmBZDRKkqcdOW2fkEeZvWte3nIU8udyTbln5mjKGgnd3tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:08:18AM +0000, Stuart Summers wrote:
> Add a binary configfs attribute holding a raw hwconfig blob. When set
> before bind, it is loaded into the hwconfig BO instead of querying GuC,
> so all consumers - including the DRM_XE_DEVICE_QUERY_HWCONFIG IOCTL -
> see the override. This also permits supplying a table on platforms where
> GuC exposes none, which is useful for testing userspace against
> hwconfig data the hardware does not report.

we should only put this in after we get that series that make most of
configfs as debug environments only...

> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c     | 119 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_configfs.h     |   6 ++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c |  36 +++++---
>  3 files changed, 150 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 2ddd707a6dbd..6f810b33e12d 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -63,7 +63,8 @@
>   *	    ├── engines_allowed
>   *	    ├── migrate_ulls_period_ms
>   *	    ├── enable_psmi
> - *	    └── disable_vram_page_offline
> + *	    ├── disable_vram_page_offline
> + *	    └── hwconfig
>   *
>   * After configuring the attributes as per next section, the device can be
>   * probed with::
> @@ -277,6 +278,22 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Hwconfig:
> + * ---------
> + *
> + * Override the hardware configuration table normally obtained from the GuC
> + * with a user-provided binary blob. When set, the driver uses this table in
> + * place of the GuC one everywhere it is consumed, including the table
> + * reported to userspace by the DRM_XE_DEVICE_QUERY_HWCONFIG query. This also
> + * allows a table to be provided on platforms where the GuC exposes none.
> + *
> + * The blob is the raw hwconfig table, so its size must be a multiple of 4
> + * bytes. Writing a new blob replaces the previous one::
> + *
> + *	# cat hwconfig.bin > /sys/kernel/config/xe/0000:03:00.0/hwconfig
> + *
> + * This attribute can only be set before binding to the device.
> + *
>   * Remove devices
>   * ==============
>   *
> @@ -291,6 +308,12 @@ struct wa_bb {
>  	u32 len; /* in dwords */
>  };
>  
> +/* User-provided replacement for the GuC-provided hwconfig table */
> +struct hwconfig_blob {
> +	void *data;
> +	size_t len; /* in bytes */
> +};
> +
>  struct xe_config_group_device {
>  	struct config_group group;
>  	struct config_group sriov;
> @@ -299,6 +322,7 @@ struct xe_config_group_device {
>  		u64 gt_types_allowed;
>  		u64 engines_allowed;
>  		u32 migrate_ulls_period_ms;
> +		struct hwconfig_blob hwconfig;
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>  		bool survivability_mode;
> @@ -937,6 +961,50 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>  	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>  }
>  
> +static ssize_t hwconfig_read(struct config_item *item, void *buf, size_t count)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (!buf)
> +		return dev->config.hwconfig.len;
> +
> +	count = min(count, dev->config.hwconfig.len);
> +	memcpy(buf, dev->config.hwconfig.data, count);
> +
> +	return count;
> +}
> +
> +static ssize_t hwconfig_write(struct config_item *item, const void *buf, size_t count)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	void *data = NULL;
> +
> +	/* The table is a sequence of dwords */
> +	if (count % sizeof(u32))
> +		return -EINVAL;
> +
> +	if (count) {
> +		data = kmemdup(buf, count, GFP_KERNEL);
> +		if (!data)
> +			return -ENOMEM;
> +	}
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (is_bound(dev)) {
> +		kfree(data);
> +		return -EBUSY;
> +	}
> +
> +	kfree(dev->config.hwconfig.data);
> +	dev->config.hwconfig.data = data;
> +	dev->config.hwconfig.len = count;
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_multi_queue);
> @@ -946,6 +1014,7 @@ CONFIGFS_ATTR(, disable_vram_page_offline);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_BIN_ATTR(, hwconfig, NULL, SZ_64K);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_mid_bb,
> @@ -960,12 +1029,18 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	NULL,
>  };
>  
> +static const struct configfs_bin_attribute *const xe_config_device_bin_attrs[] = {
> +	&attr_hwconfig,
> +	NULL,
> +};
> +
>  static void xe_config_device_release(struct config_item *item)
>  {
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  
>  	mutex_destroy(&dev->lock);
>  
> +	kfree(dev->config.hwconfig.data);
>  	kfree(dev->config.ctx_restore_mid_bb[0].cs);
>  	kfree(dev->config.ctx_restore_post_bb[0].cs);
>  	kfree(dev);
> @@ -1001,6 +1076,7 @@ static const struct config_item_type xe_config_device_type = {
>  	.ct_item_ops	= &xe_config_device_ops,
>  	.ct_group_ops	= &xe_config_device_group_ops,
>  	.ct_attrs	= xe_config_device_attrs,
> +	.ct_bin_attrs	= xe_config_device_bin_attrs,
>  	.ct_owner	= THIS_MODULE,
>  };
>  
> @@ -1243,6 +1319,10 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
> +
> +	if (dev->config.hwconfig.len)
> +		pci_info(pdev, "configfs: hwconfig = %zu bytes\n",
> +			 dev->config.hwconfig.len);
>  }
>  
>  /**
> @@ -1479,6 +1559,43 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  	return len;
>  }
>  
> +/**
> + * xe_configfs_get_hwconfig - get a copy of the configfs hwconfig blob
> + * @pdev: pci device
> + * @blob: pointer to store the newly allocated copy of the blob
> + *
> + * If a hwconfig table override was written to configfs for @pdev, allocate a
> + * copy of it and store the pointer in @blob. The caller takes ownership of it
> + * and is responsible for freeing it with kfree().
> + *
> + * Return: size in bytes of the blob stored in @blob, or 0 if no override is
> + *     set or it could not be copied.
> + */
> +size_t xe_configfs_get_hwconfig(struct pci_dev *pdev, void **blob)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	size_t len = 0;
> +
> +	*blob = NULL;
> +
> +	if (!dev)
> +		return 0;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		if (!dev->config.hwconfig.len)
> +			break;
> +
> +		*blob = kmemdup(dev->config.hwconfig.data,
> +				dev->config.hwconfig.len, GFP_KERNEL);
> +		if (*blob)
> +			len = dev->config.hwconfig.len;
> +	}
> +
> +	config_group_put(&dev->group);
> +
> +	return len;
> +}
> +
>  #ifdef CONFIG_PCI_IOV
>  /**
>   * xe_configfs_admin_only_pf() - Get PF's operational mode.
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 327b648944ff..526250e9fdfe 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -32,6 +32,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  					enum xe_engine_class class,
>  					const u32 **cs);
> +size_t xe_configfs_get_hwconfig(struct pci_dev *pdev, void **blob);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> @@ -54,6 +55,11 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  						      enum xe_engine_class class,
>  						      const u32 **cs) { return 0; }
> +static inline size_t xe_configfs_get_hwconfig(struct pci_dev *pdev, void **blob)
> +{
> +	*blob = NULL;
> +	return 0;
> +}
>  #ifdef CONFIG_PCI_IOV
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index dc667a71b438..33abfdfcff41 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -10,7 +10,9 @@
>  
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
> +#include "xe_configfs.h"
>  #include "xe_device_types.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc.h"
>  #include "xe_map.h"
> @@ -55,6 +57,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> +	void *blob;
>  	u32 size;
>  	int err;
>  
> @@ -68,25 +71,38 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
>  	if (gt != xe_root_mmio_gt(xe))
>  		return 0;
>  
> -	/* ADL_P, DG2+ supports hwconfig table */
> -	if (GRAPHICS_VERx100(xe) < 1255 && xe->info.platform != XE_ALDERLAKE_P)
> -		return 0;
> -
> -	err = guc_hwconfig_size(guc, &size);
> -	if (err)
> -		return err;
> -	if (!size)
> -		return -EINVAL;
> +	size = xe_configfs_get_hwconfig(to_pci_dev(xe->drm.dev), &blob);
> +	if (!size) {
> +		/* ADL_P, DG2+ supports hwconfig table */
> +		if (GRAPHICS_VERx100(xe) < 1255 && xe->info.platform != XE_ALDERLAKE_P)
> +			return 0;
> +
> +		err = guc_hwconfig_size(guc, &size);
> +		if (err)
> +			return err;
> +		if (!size)
> +			return -EINVAL;
> +	}
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_INVALIDATE);
> -	if (IS_ERR(bo))
> +	if (IS_ERR(bo)) {
> +		kfree(blob);
>  		return PTR_ERR(bo);
> +	}
>  	guc->hwconfig.bo = bo;
>  	guc->hwconfig.size = size;
>  
> +	if (blob) {
> +		xe_map_memcpy_to(xe, &bo->vmap, 0, blob, size);
> +		kfree(blob);
> +		xe_gt_info(gt, "Using hwconfig table override from configfs (%u bytes)\n",
> +			   size);
> +		return 0;
> +	}
> +
>  	return guc_hwconfig_copy(guc);
>  }
>  
> -- 
> 2.43.0
> 
