Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFAEC87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 18:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BD410E390;
	Wed, 30 Jul 2025 18:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoGQA60E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4B610E390
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753900072; x=1785436072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ntQ/gUGzilSVApJScDTURGtcEveguzOTiZs/JdTVFGM=;
 b=OoGQA60EFAohaQ5RnKgah9awkNPi5XFzp2Ietilgs6tlHNU1Nj2l7W16
 nvNxvkemo6FFXXa612GOPDY211501sp177hh7Y71F6Y05lp8Q/+knmt0G
 GykLrc7cwgnzDtqixMkYo1B7cpWoFDnZ2hyLuOt32Awid1x71IXxWPOin
 zzw5bPNOwm3Ymx1Ip9/imJth3vt7le7fo9ZseI0pn+Re4VhK53sSBtZ+4
 ZD42vnkrBWTLmD34o/CmOpke2dxG4KGR95CsZHmNyrK+XW5ggZJsEICLi
 BBRN7x6xgOdj0ChEk3vilXDixahwwL7/tzijJlFW7LgPXIEg9resbhkxG A==;
X-CSE-ConnectionGUID: kEzVi0+2RR2DdKET73BxcA==
X-CSE-MsgGUID: G9ZMF+pkSzGZ4ZxJd8USHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67574287"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67574287"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:27:51 -0700
X-CSE-ConnectionGUID: 6FN/IjtOS6yvVuqPm60pbw==
X-CSE-MsgGUID: yl8jNgo9RbudtCQVw9cmMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="168462059"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:27:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 11:27:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 11:27:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 11:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGmkvI+0/W9Z8tC3983vLpEcSHkEnsGBoNEDfW1B0RwqAkGFTB98+B2yPgNNGkRdSU9ty+MpCiTAC0QcjA9vRQzGoRT92YoemmVlRWGk0JndM8OQcjR7dcqXtyRrhd0TEws4w5nQe6o6pwtK1PJ0ulz1XRB63FQTKdr/SOaWcI/KZaQFGGdFu03ikRb5WB+eZB1P7wdz/Z8HCkz1ErcxNQnrOhCF6oOWNOyxOK/Nq4FQVw2mS2hg2urOMEiePZpXId5iDVcqo9awBojzm3aFlgGtFCopn6FC2kp2LNVzeimxTlmaEZ70k+10xQLMCfbq2rfd3tCd4lIosBlwxNOLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntQ/gUGzilSVApJScDTURGtcEveguzOTiZs/JdTVFGM=;
 b=MMnELVTA1hJ6vK3+E1D9UDF7zweDGMxBlNkJD3ejOAg8iroW/LuythpY6jXnXSkMoQIfs/vzsZb5gGR1TAXmF2f02eGqBcnbKmt0xD02A1ny1cYWzdz6w9E2L6n/cNbLp4qfdpAftVdp5JtRL9l75P65mAzE8WN9wlhTuhfaRXXLYM7v7BcrW8AAckYOxVnkuf6lV15DF4JnwEqYOJMww9EQ2+YwcJCHhePwdkWKKPm813NQIrQhfQCnNzfT41EvpPbWTBwAaxFnVXprpf0rlKDkdZRdvIrk6QsnLv0LerLAmKiyVwYQfGQL4qc4esI8fyhERU0OW6E1NqNHz8MdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.25; Wed, 30 Jul 2025 18:27:48 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 18:27:48 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/migrate: prevent potential UAF
Thread-Topic: [PATCH 3/3] drm/xe/migrate: prevent potential UAF
Thread-Index: AQHcAV8b77VQr6oBMU62AAjYucV74rRK/IwA
Date: Wed, 30 Jul 2025 18:27:48 +0000
Message-ID: <4a62d27bde8bdb6927dc32230e92b098c870a476.camel@intel.com>
References: <20250730143335.174373-5-matthew.auld@intel.com>
 <20250730143335.174373-8-matthew.auld@intel.com>
In-Reply-To: <20250730143335.174373-8-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB6756:EE_
x-ms-office365-filtering-correlation-id: 5811c24f-8685-41da-f525-08ddcf96c932
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WFgwYXcrMzZmMjZ5YTJKZ3ptRTB3LzI0TVVGZEVLL04rZU5nOFBySEpZN3Ir?=
 =?utf-8?B?RHNaczRIclluU2tzRTA4KzQ0UnhyVWNVVlZzTm44cGFXYklCdmt5d0I3bVhY?=
 =?utf-8?B?N2FsS3lpYXUxVmZXek10VEljcUtyVVZhdUZjejFNU2hSSWw0VjJ6UzVNUXJn?=
 =?utf-8?B?eUpiN3RZOWU4eFd5cTIxb3FNczZUTmkraGo2YzBkV1J4ZEVId0JSMElYZCt5?=
 =?utf-8?B?MnBYT3FFSElYcFk1bzA0UkptWEhsM0tRdUJnU0wyR2JTcHhmeXRGSEIwcFZ4?=
 =?utf-8?B?L0xFM2t1YnVjZ2xsM0VBZ1FpQVFiUjBSYTE0dDRmYmQ2eENBOUpjbkVUbDFv?=
 =?utf-8?B?YmJmbDd0ZWJ4TlFzMjNrUVY3eTNRazBBbFpFcHplcXp0YXVqNkpKbndCMjMw?=
 =?utf-8?B?U1B0blJidCtpdlY1RnN2Y0pvTi9sZy9GcXlONVpZL2NoYURBcS81ODhQYzVI?=
 =?utf-8?B?L2VaM241UVlKeHI1NzJoQVo0MFVQeFo5MXVGc1VJNDh3UTEyM2lrWlR1QytI?=
 =?utf-8?B?dGlXdkZSN0kwNzlxMlpIVGpRd1RSYXVVNEh0NFgwejZBbW9mbzNGQ1VqRnVZ?=
 =?utf-8?B?QUU4cjNYZSt3Sk1rc3RLQkE5NzZVcVFjUHdTVUFnRWM5NFlzRDVjUzBBcDFu?=
 =?utf-8?B?Zks4T1AycVBxOFF4eGhFbkROSEtmS28xdjlaeit5R3VLVG5oY3B3OHNFNDZ1?=
 =?utf-8?B?cWxoQk9uSXM1eVlyN2NmU3FmTjZIMjBmTXB5bjE3RUdhYVZRUEl0cmgrOGEz?=
 =?utf-8?B?YWVOSW9kZEt0UWxGbXV6MU40MHFDY1RwRFZiRlBJRktLelIzQUQ4d01kVlE4?=
 =?utf-8?B?QUViNlhGNlhqK2huajRYV3FnUEc0VzRVd3hzMW5jMklhUWRxN3NrWEdyRXB4?=
 =?utf-8?B?ZEtaWGEybCsvVEhTdldhTXNTYXoyOHlFbFU4cDFyOEtydWhFUVdqckRFYlJN?=
 =?utf-8?B?bzMyRWN0ekRxTWdQYXBnVG9yY25SYzBGc2FtbkZ3Z0srQTZMcHFCV204K1hH?=
 =?utf-8?B?dERwdmw4TldBUWVtK0NyTEh6UUh3RzZhMExWcitrVGxZdmpVYUM2TnJCbyty?=
 =?utf-8?B?K09vSzBTWCt2eU9iRVdSZ3EraC9zYXFKUGc0cVp5UVRpQW53RTZOdWtLWlVm?=
 =?utf-8?B?c01PUjFhUXc1VEw2bXJIN2RBWjJJWFlHb0lMdDNjcDBhcmdEM1U5bkdiQWRl?=
 =?utf-8?B?NVZ4VGR6TmRJYXgramVMUUgwTXRSWDdwM1NCL2ZhYm0wL1huZ1ZHLzJvd1hZ?=
 =?utf-8?B?MmNwcXh2L21RbG5jZFJRcFk4dk4xVGpXcjBVMUF6cXkzcklFbFBKOTlNSlZD?=
 =?utf-8?B?S1VFbUdINXFiZ0VLYjduNzBCdVliMjdYd0tXbHZZV201elcwNGpjd1poaUFE?=
 =?utf-8?B?VDY2QU41RmZmbWdsNFJkSy9yUnZoQitGdUxTNDZyVEtwbldLdWZrRU9wOTMr?=
 =?utf-8?B?ZmYxVDFCRERNSW5VMlpBSVpWZzVySTc2NldnMG5OUGt5L3BCVTZ2Z09rZXFW?=
 =?utf-8?B?ME5Ba3NEL3g4d1M4UDBGbG1oTWF3SE9BWmN1NXVIODJ1eFRrTlA5Um1CUjZT?=
 =?utf-8?B?Y0xqbWxGYk5MUDRrU1hFa0Y5WVk2eVZLbE9FRm5NYjUwRDZFNmFJQVlYclRK?=
 =?utf-8?B?dmhzSjNuZmEvSitUN09Md1NZcXNEa2twTG9kSUVDdHZLZWdjVzBMYktyTC8y?=
 =?utf-8?B?ZE1ZMllhZ1owOEdMRGNrakEzdjYwK2ptem9VQVl4UXdUSjFnTE5KaUNwNUpM?=
 =?utf-8?B?cGtQbWVTY2dvYlN2V3RRZkx5NEE1Y1k1a3dPeStxajNENEN0OWpHUkxkMFZr?=
 =?utf-8?B?M3p3aVhQWFVqNzFqSUtEbUxMNVJyWEdGWVhDWndOMExlVWtJQ3g2dTVVUlJ0?=
 =?utf-8?B?TnhaVU9PdmhaL0ZWYmdHTUMxOFptZElNVWxrdUhWUmNCNERLNk81Ly9yTiti?=
 =?utf-8?B?TnovSlFhT0R2Z25LRWEwWmJ5dU9aK0pDZEd1U00yd2JuSWRyVmRWV2M4ZXhE?=
 =?utf-8?B?RklOa01qN2h3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjdDNFNaVGV1OG1SZnh5V3J6M1JmZmFGVnlQbTdiTVgrV01VaVgycWZLNWUy?=
 =?utf-8?B?Rnc1S3hRWVh4dEVaVGxGb1JOK3BhUW5Nb1IvMGxBdDlJZ2svU21sOUNFNjl1?=
 =?utf-8?B?NmtKVThJM2VDM1EyclJiNTdMcldGbkp4SjdseVl5TG9LbWJvdWZHS3ptSG82?=
 =?utf-8?B?Z3p1YUg0L3I1YUdJMWpmNXJwWElXNkZ1SHpUbHFYaGFkbDFoS2lwS0JPWlpi?=
 =?utf-8?B?RWVNSTVOVVUxaUNXdFRLS2RmMlBFbE9IUkQ5MlBweFVWQ09YYXhhWisvVjR6?=
 =?utf-8?B?bWh4cnBvdVMwamhSTEdrZkFHMCt0a1Y2RkUxNlh6MTFsd2pieEhpN042ckRM?=
 =?utf-8?B?NUtpbFJqT001cFRxZ0lXRUZSQXpPNDVScloyYTI4VFQ1aERmMHNaVEU4M1Ry?=
 =?utf-8?B?UUp5TjZhekNSWUM4T2JaZFZzMWw5VG1JZGd3ek1IQVMzditLM2NDZ1g1aTBm?=
 =?utf-8?B?UGk2UHhSRmJ1d0EzRjAyYjc3RVgzdXJud0NjVEJXdGlWZUw5UHowQ0N6Zi8z?=
 =?utf-8?B?WHg5MHkxNEdMY1NRZXlKV0ppZVVzcWZvMUNIalRITlVNL1h5S3VwV2RCNTFl?=
 =?utf-8?B?eVRFVVZKd1F4QW9Gdjc4Yk50QjR6UVRKV3dpRmJBd1dMWXNEOHY1NlhBK0N2?=
 =?utf-8?B?ZlFZakM4OUNiWW5IVVNLNjBET2FWb3BRSTF4UDhGbUphbHJreVdoVVVIeHkv?=
 =?utf-8?B?ZzZMLzVtcHJMSHI4bVZ5WCtVRENrMzA1ZG9GR0ZrbVBmZ2FSeE5VU2J2SGxI?=
 =?utf-8?B?QTdHbno3SUt3ME90QU9qYUF6dlo0Ky9vOTNqejFhTDRxVXlvZzFSUkNmZTAz?=
 =?utf-8?B?YzBjTFpPQW5yWDFONnkzNmNlM3BjeUNPVVBkdmVWWkErQ3A3Q3VncUZydkho?=
 =?utf-8?B?TktmcG1rZHlUS2xNZVN5MlhKTDZITjMzUGR4WDZ3cU1RNFNWa09HYThacUY3?=
 =?utf-8?B?VlBhNnpFSExBYnoxWGVlQ3o1RE03enNnR25FS293bW9nVjh3bTdhMU04a21X?=
 =?utf-8?B?cW1YYjNuTk52RkxkS0FhZXZEVm00Y295V0FiTGcyYmtwVFR2RmJmUUlHVU02?=
 =?utf-8?B?c2ZZblJKUUdBR0U3dHpTcEUwSUIvQXNNWFZkbzdsNm1kR3hjTG5Lb2sxVldB?=
 =?utf-8?B?TThsdk5ZMFRyV25RcVJHN2JvOHFDZC9jVWdEK2hXNlhCdVBtVFlhaUlUNzRP?=
 =?utf-8?B?akhlMDdJb09wYU5mTUVZK1VuSFY0djUzY1dackFEQUZ3L3B6TFJqNFQwcUtL?=
 =?utf-8?B?bWEwTTE1REFsWFZVS1BKd0RpQ2dITVVNd3pmR1AvSU9xa1p4Vk5SWW42bGpo?=
 =?utf-8?B?YjNDWWp1WVhKeWNHaUl6blM3dWcwcjA2YjA3NU1YTlIyRlpmeFpwVzh4K25j?=
 =?utf-8?B?Z2xTWUNhUzUwMWg2a2dOSFZEU0NqajRjU0ZuQmhoc3B3TnRvY0ltZFh1eFRK?=
 =?utf-8?B?UlZrTEhjTUpOVlEvZEo1bkdhaEN1OFAwelo1NmZYTXNmTWdoUG5WUWlDZUQ5?=
 =?utf-8?B?SVowYTdhRlJlTjVRa1B4UitWQnRzbVJWUFpPQzZVUUYycmd3MjIwMnEwNk5m?=
 =?utf-8?B?R283cUM4VFljNDhZbXFHcjRVOGhVNGR1Y3hmRWFWalM4TExIZ2hBSzJJNFp3?=
 =?utf-8?B?eEM0VHY1Y0ViUXIzenRTRFhrSDdWRmVrYXIwVDNkMXJPSEpndEZXQ0FSQU5l?=
 =?utf-8?B?eFBqbjFYRE14T0dMcFdUaXBrbkZnejBKek1lRlpUQy9tOFdFVUZvODZoYVZj?=
 =?utf-8?B?Q2VYcDFyTk4wR2p1d0pNb05wU0g1TVJLdUxSK0IyRko0SWtYeGdZOWxNWTNv?=
 =?utf-8?B?ZkNOZmRTMkx1L0xpMHNWYk5xL2lVYjdKcnNtOGE0WGJtZjVwSEk3d0ZNUDY5?=
 =?utf-8?B?WkRDRk5uRjdnb0pNajZDSzlqamgvUVBGcHJram1BSlpaSU00L0RKQjNlY1Zr?=
 =?utf-8?B?SzZ4SnJaUzFtOGtWbGRNQzErVGFYcDk5UWlpZUg4NzJUU1RERE5QM2Y0Y2FJ?=
 =?utf-8?B?US9ybTMvZU9HeWxhQUF4aXE3Y1RjQXROS0JtcUpoMGNQUkQyd1dIMWs4ME9L?=
 =?utf-8?B?bitad1N6c2pkR0QzYTFrTXdLVXJ6dk5zdU05WDRQbkNodDZYVTFNajE0SkhJ?=
 =?utf-8?B?UnBmRXFuVTVNMU1mbkFMM0RpeWlOVnVNSzJLSXNqeksyRklKWHJ4TzdUaCtO?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AAEDD7B37083A4B8D1C717D08B8AE42@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5811c24f-8685-41da-f525-08ddcf96c932
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 18:27:48.4061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0hb9p3P3ULUaCnthDlkgAid+ppU/ahxCvPrcg/2gs+wn2BQBwps7QQzeCJIvRgzcvKpkWBOI7/D8D5+orEMEZYG2w/7F2PfoXGki+i8/scw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDE1OjMzICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4g
SWYgd2UgaGl0IHRoZSBlcnJvciBwYXRoLCB0aGUgcHJldmlvdXMgZmVuY2UgKGlmIHRoZXJlIGlz
IG9uZSkgaGFzCj4gYWxyZWFkeSBiZWVuIHB1dCgpIHByaW9yIHRvIHRoaXMsIHNvIGRvaW5nIGEg
ZmVuY2Vfd2FpdCBjb3VsZCBsZWFkIHRvCj4gVUFGLiBUd2VhayB0aGUgZmxvdyB0byBkbyB0byB0
aGUgcHV0KCkgdW50aWwgYWZ0ZXIgd2UgZG8gdGhlIHdhaXQuCj4gCj4gRml4ZXM6IDI3MDE3MmY2
NGIxMSAoImRybS94ZTogVXBkYXRlIHhlX3R0bV9hY2Nlc3NfbWVtb3J5IHRvIHVzZSBHUFUKPiBm
b3Igbm9uLXZpc2libGUgYWNjZXNzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1h
dHRoZXcuYXVsZEBpbnRlbC5jb20+Cj4gQ2M6IE1hY2llaiBQYXRlbGN6eWsgPG1hY2llai5wYXRl
bGN6eWtAaW50ZWwuY29tPgo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT4KClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwu
Y29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMgfCA5ICsrKysr
LS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IGluZGV4IGRhY2ExOGI1YjQ1Zi4uYmQzNTZk
OWVlZjI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gQEAgLTIwNjIsOSArMjA2Miw2
IEBAIGludCB4ZV9taWdyYXRlX2FjY2Vzc19tZW1vcnkoc3RydWN0IHhlX21pZ3JhdGUKPiAqbSwg
c3RydWN0IHhlX2JvICpibywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjdXJyZW50X2J5dGVzID0gbWluX3QoaW50LCBjdXJyZW50X2J5dGVzLAo+IFMx
Nl9NQVggKiBwaXRjaCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGZlbmNlKQo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2ZlbmNlX3B1dChmZW5jZSk7
Cj4gLQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19mZW5jZSA9IHhlX21pZ3Jh
dGVfdnJhbShtLCBjdXJyZW50X2J5dGVzLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHVu
c2lnbmVkIGxvbmcpYnVmICYKPiB+UEFHRV9NQVNLLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZG1hX2FkZHIgKyBjdXJyZW50X3BhZ2UsCj4gQEAgLTIwNzIsMTEgKzIwNjksMTUgQEAgaW50
IHhlX21pZ3JhdGVfYWNjZXNzX21lbW9yeShzdHJ1Y3QKPiB4ZV9taWdyYXRlICptLCBzdHJ1Y3Qg
eGVfYm8gKmJvLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVfTUlHUkFURV9DT1BZX1RP
X1ZSQU0gOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVfTUlHUkFURV9DT1BZX1RPX1NS
QU0pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX0VSUihfX2ZlbmNl
KSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KGZlbmNlKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKGZlbmNlKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV9mZW5jZV93YWl0KGZlbmNlLCBmYWxzZSk7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZmVuY2UgPSBfX2ZlbmNlOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X2VycjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV9m
ZW5jZV9wdXQoZmVuY2UpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmVuY2Ug
PSBfX2ZlbmNlOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBidWYgKz0g
Y3VycmVudF9ieXRlczsKCg==
