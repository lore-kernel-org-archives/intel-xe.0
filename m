Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034DFC282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 16:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37E810ECE4;
	Fri, 28 Feb 2025 16:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzHlw/zH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A95210ECE4
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740758579; x=1772294579;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=2zXTMx8nlrjlBBiyIiLUH5z/MHVwMLIiZDMQ7jZKmec=;
 b=CzHlw/zHWIwu3SO7A6QKgbxTGSDFiGrUrMnjZ/lPaSB2tp/IwP4drDMq
 4Ws/J+jOda5nZA3+KZjJkNRsqqzNGKnPwj6+RIWa1jVNWkaCnSb4qjtC4
 EBr/AJiBS+ERKItiC7nQVfJsIZXvoceuV/08JlR7yw5/Lt16k7E+nAI+Z
 SRy4D69ghia0K+04yVy269vA79G7WSO8UwXg4fBD9chtvioeF1sgdrVTM
 70+OLwM1QPAzYg69GXtI1sXiXwhOhfzjZtnN+UadvC6K5gI+Du03ZYImK
 H02Vc8KoTC33tv7tXHhVxSvvJ+RZZ61GadKXPz09tD+VFtomvgjzUA20y Q==;
X-CSE-ConnectionGUID: qmjGEuyaRO+wqIdoqOXypg==
X-CSE-MsgGUID: KKqd4JFUT1CNXC0lzOCKEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="64154384"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="64154384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:02:58 -0800
X-CSE-ConnectionGUID: Jzkh5meRRVuoKyyUsjNRJQ==
X-CSE-MsgGUID: twroevZmQCKCsh1bLDINAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117128798"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:02:58 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Feb 2025 08:02:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 08:02:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 08:02:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKza1Q5KDzxj7smdVxwg+O2TkJQfWhEHqa/zFvCPAnoZExMZQTObOL/gJOijY5vFJ3W9WIduQufvleCa2DcDfqo3kn61ST4b7Ojx3uK1fqBjpG8lOHXIHjMpiYsftRTlVw1p6g+qR1nO42///3Q18CH25YzwMGYsY75ut2lvns5VjMrQDX8G6cMkJrVlm3mkJJcDAhycnYHCgnSMyLbe+zicKgS2BKy5r/VbsZYVrtFQxgF/LuoutFa7TcRR6Kr3OOHdU5zVujPeNVl9zXnqEcWi8OKmMpeA28gDiNL+TqlOsD+MbqM8y4fPsShJiMFLUKI/Cqwrbj4UctodlQULTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koMNjPec2907ofVhzSKdqy60APjV/pUBJ/ToIrNIknc=;
 b=QJz94CMF0PPXyHZIFZXOSoudKW45ETyOM4Poo3/I108J9kbL+wfjudKip4pISBEzZt3Z8Qx0xH4OsrO+jSzBeldD2OzcdGEt61n/QRwFgxLehzctQP2xU1cFz821oOLSHjwwBH8vHzd0MjD9SHO6HbTx0yzjPeplJ5L82IgQAlW/EgwDxT7T2ilh032eK4XaNVZkOYi7RGZ9czSbgRL9j7TYNcVFjTcJnyOwPGymfQteDSoWu7rRU4giti2Mve6TQ/+dGhIngK1UwIO+bPdu9BNLCsbQ6IQiD2eG9LSZKutjRc5nvc9MajZq1+IFQ9HJOPJIreb9B0s13Xk4lJehGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by IA1PR11MB8862.namprd11.prod.outlook.com (2603:10b6:208:59b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 16:02:37 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 16:02:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174071787466.3042998.14533074930593599228@b555e5b46a47>
References: <20250227-improve-type-safey-power-domain-macros-v3-0-b6eaa00f9c33@intel.com>
 <174071787466.3042998.14533074930593599228@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for Improve type-safety on
 POWER_DOMAIN_*() macros (rev4)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 28 Feb 2025 13:02:31 -0300
Message-ID: <174075855176.17587.15136957201847826883@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:303:6a::28) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|IA1PR11MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 378238e5-26a5-4753-db89-08dd58115153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmFwTGhFTVlYOFF1Mk9OVU0xaHVGYUEzd0c5UTBWdXcwUmVTaWRHTjJlcmhq?=
 =?utf-8?B?N0pzeTVMOVJpZEt6dGd2eEVBeXR2U0tNV2pHRzhRQXlTaWJmMVJuV1VHYzAw?=
 =?utf-8?B?RzVzbm9qWUFYVXh2eDl2bnpoQVU4dGhpSDB2ZnVGQ2xCTCtOWTJWQnR3R2VP?=
 =?utf-8?B?VGVtRTJzd0JpN2MxQ2xEbnloalo0ekZTc3ZBNys4TTlkWnRjYXVNZVJUTWRX?=
 =?utf-8?B?VEI0S0ltT2tXQlZpQStGaFFUdGtiRGtLVTl1N1VkcXNFd0dudC96SHFwSVpM?=
 =?utf-8?B?ZmZnaENjSGR6MlZlWDlSSE5ITmVQaG9HNXhpMEwvRy9sRzIzamg3eFRVQzJU?=
 =?utf-8?B?aTh4ZHBWL0Flc0c4amFXNjk1blFQTUhwMXJoS29XWFJRZFBFVDRiQzJIY3lR?=
 =?utf-8?B?Y1NwYk15RHk4blMxNXVMREdCTVBjZnpDUGtDVGxIeGJscTllTDlFSWZEUm5i?=
 =?utf-8?B?dWczZGVMbzE1ekdzVFNIRHJuUkY4eWdjU2s2ZkVzd3RTaG1vb3NxUVNpd21a?=
 =?utf-8?B?UTlKZmU5dzBnZld5eVBhRlBOQmhMaUgzUldKbUtlM2t0eVpYcHI0MTRRZmZ2?=
 =?utf-8?B?NStFNDFOYU04dFExT004Z0lkNVhWbXpJSytpNU90bkdKeUZlUml2NWhyNTBu?=
 =?utf-8?B?YURGM2cvanVPNzlCeTMxaGpyRGFXRkRGNmxidnIxeFZLQVFDQTI1dDFDN1ZS?=
 =?utf-8?B?Z1hPUk5pU3VzRURzYnBkSTJWNlZMRGxDNW81Sm1WU3NxN24wellwYzZKOG1H?=
 =?utf-8?B?QTJRc2ZGemJIeFlKL2FoOUlvS1JEWXNsVDArVjIySUxwaXF6Z2dIZEJyaGov?=
 =?utf-8?B?NXNmRkpXWXM0c284N0FGWGNUdGZ1SEYyc294RjhOSFpWaXlJdTBXKzIxaUNy?=
 =?utf-8?B?WU5FdGlPVWR4emhnRWZ6N2ZGM09DTExVRi9VS05IRGFidzA0R2d3RWhFbkV3?=
 =?utf-8?B?ZFpEVHVEekdCL0w5Mnk5SVF4SDA4KzExdGtSWG81NjhYbVcrVDlXSFNiNXVT?=
 =?utf-8?B?TVVVb3M1dGhoZVZpYWlsazBpV0JZQW12V1dXMk03ZVJSdHpwZ2dBMXBDL25p?=
 =?utf-8?B?Q2NpNjRZVTlrVzRjU0xONlhhK2NDZkF2NDZ4cGdXN2tMd1RGTHhZNEszZDI1?=
 =?utf-8?B?M0tmZ0ljd3N0ZFRFanM5QmR1QlhEUE9xU1ZDak43MmRrUlh3eHhPV25MSzEw?=
 =?utf-8?B?K3JmTmxaOWxKRWZCdUc4dTN3MFZKTVcraGY2cklDWDBPRlArOVpUWkZYRVRH?=
 =?utf-8?B?NHZ6bXdjR054aTB5OVFpOVZvTFpRa3ZIZWt4YTBDamtGaW50b1RJMGQvMk5U?=
 =?utf-8?B?YWVLNzJGM21lL3BnVFYxNmx2Y0pTOXlUYlZQOGRIOEh6U1VzOCtCNDdLcDdC?=
 =?utf-8?B?NFB5RVZGMzRud0QrMzdUbnJJcWF1dGN3K2RwRUV3MDljKytPQUNpK3NkWTZn?=
 =?utf-8?B?dFVEUDVRV1c4bWNJWWhnTW1RQlZBVzVvRWhseTQxVkVUdTEyQk1mbXc4dDBj?=
 =?utf-8?B?Y2h1ZjVKMWlVYlhhcXBXMzBzcENYRi80Z0x3Z3dtWlVFL3BQeDMvU3JjZzVH?=
 =?utf-8?B?QnlicUhBTzRkaGNuajFaSWUwRDJNd20xZ3VhSERCN0ZPcHoxMWhCWWh2bFRt?=
 =?utf-8?B?T3dkS3VFbEw3M2RWRHhyVTdIWCt5QzVXd2tUZUMxK0YraWs4aFM2MUcvSGZI?=
 =?utf-8?B?ank0S25QTFdLQlA0bmt6WDRFVnp6WWo3N3FFTG82cEVBYS95Um03NEgzaFdo?=
 =?utf-8?B?anBMWDRUbkhBYVNubWZiYTVuNjAzYTdqNlV1elBZb2pJMUU3MUsyYStjZ0ha?=
 =?utf-8?B?ZHpHZXErOUNpaWZnZzY0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q081YWpVWFpvUVRpUjgxazArZnc2c0Y4YmZkaUcxd0ZDTHFnWVZPMExuV0tz?=
 =?utf-8?B?bmJSdkk1UlJHRUZqUnk0R2NjKzYwVVVBTUkvVlpKekJOdVZ4MWVpeDltaWhw?=
 =?utf-8?B?bWJwUVFmOWtnNklPb0pKemhOMXg5bVVZRTdCYkltS1htUDZtWUhmRWxubjlt?=
 =?utf-8?B?eS9MYVF5NUNzY0tnSEdTeThqQkx1elRIclZBK1hHTzlJL1BLdm5pckxkUFFU?=
 =?utf-8?B?SStpSUJJRUtSallBTDNKNkRnajM3cnRLbW5lTXFmRDlwSi9XOC9Nd3JFM1Nj?=
 =?utf-8?B?YmtuckZFUmJ3eU84QStYS2kwVVNhNklFdzFlWE9BcEpkK3FXM2hEalN3SEZn?=
 =?utf-8?B?Q25mK0lNVkpjUE5qbGdGSmJUNlRvNmlvS3lUU291blNweVFPaWh6Y0JSUE9x?=
 =?utf-8?B?ZGg0RXM3L0tuODRvellDcU5KTmI2K3NVMjErN1BVekxxK1pFd3ljdUx2MERF?=
 =?utf-8?B?OGtxTWVzcVd2cytqbVhGdE9KUjEvZTVMT1pwblhraXBEeU4xQWtGRFRoblNH?=
 =?utf-8?B?M0dEL0NxN0hmQ1BhMnc3K3Z4RHdIeFdaNXVHRFZ1cjRGYUVuQ2Y0RW1xb2ZE?=
 =?utf-8?B?aFBoQjJmd2FhbmR0Mm5FR0hhR2theGFRc3UyRHdSR3NBTmJyOURGTjRyR3FF?=
 =?utf-8?B?V2dpS3VaMDJHajZ2bUtZRHhrcTB5cTJ1SGthVEhybXI1aVBUQWZGdlF4T3A5?=
 =?utf-8?B?QVRvSzd6VFhCdHVQM0tJVUgxMUl0SFJQOS9jMFRnRytDZW14VmJnQWZTRFNu?=
 =?utf-8?B?Q2ZzaVhVazBONk14ZHJKSkRCYUJoRVl3NU1saEN3TGxqUmNMU2RMMXZjL2Rs?=
 =?utf-8?B?ai95ZDJuenRqK0YvcEU3ajhLSjl2ZjN0d0o3TXJGNWxiNnFnU3B1TmZoRzhT?=
 =?utf-8?B?ZWtncFg3ZHhOVVMyYmIzZWJSbzFPOXE1cnZlZitoaXkvczhOZjhPVEVJUVdI?=
 =?utf-8?B?VjBQcVZaY0JURGY1azlkRVlOZWc2bTkzSDllSWovQXZiUlJvMTFZRklNYXdB?=
 =?utf-8?B?c0htL0Zkb0U0SS9UMGdoUHViaGI2RzlzVmVlU3Z0Q0lQUVZxRkU3NE1sZHMr?=
 =?utf-8?B?bEF0d2g5dTF0TGVXOGI0UHlxeVY5elZUMU1EbjgyUVlNUHN0RnJVVWZIclhW?=
 =?utf-8?B?ZSsrQ2tSOXgvcHZxMGVFVUFweGYxVFVKOW93bDZZSWdjYkVidHhTakZOSURF?=
 =?utf-8?B?eUNpcWRuMlJ2by9WY20wcTE4YUI2NzJhUTE3YVI0Vkh3aFllK3d0cThLNDNr?=
 =?utf-8?B?Ujh5K3kxNUlrOEZiQ0lUblQzNFdMSlVuZHM4WW9ZUmk1TUFkcUJ4WFc5dVRQ?=
 =?utf-8?B?VE0xOW5uTW1tM2JMQ25yN3JVQURadTF1TG0xeW5kY1dtTytxWkVGTW5TMXVs?=
 =?utf-8?B?cnYwNDQwbk1wcktZckkvaVM3K1prRzRVQm1rNGZ1clBKMllzTWczeVZVc05Z?=
 =?utf-8?B?aUFCMnZPeGlCSUdkMmtoNVlXTUNSSUp0djV5SEJyQUc0RkQrdW5sODBsdzJS?=
 =?utf-8?B?YVNSbi96UVN4c3JNS3BYL0MzREZlVmhRVEpyWHlXTHp5b3RaUGIyUFh3ak9F?=
 =?utf-8?B?SlFKUnlIVmwrK3NrQ1FnR1hsWnVieHJIS212UlNDLzZvYlBkYjB0VjlOdHZp?=
 =?utf-8?B?dFVYOHBvbld4bW9EcTBhQnZGVlU4K1ZZUjN4WS9TSE44bytGQ2dpQXd3OVdP?=
 =?utf-8?B?azRpYXhXR0pQdDkvTVZmVHpWNVVNZlZwcWxvRE15VStuSXp4bWtiZWM3ZXdK?=
 =?utf-8?B?NWZrd0w1SGEzTEFYZXZPUTh1SDlBS1FVbUQ0SUdONlRoT2hGL0FYYWEvNmJm?=
 =?utf-8?B?c1N2bUhuUVA3dnFFZFQ2aE1tYk1VMEp1VnloZm53UUlVOHNlQ09aRVV2MmFU?=
 =?utf-8?B?dkNMd2FGK25WRFFVREtLcE43VERreEs5Zm5RYXRhQTN1TVR5K1pESVNLZUVG?=
 =?utf-8?B?SWR3bU5EODQ1dG1aRHZ0dlV6TVRPY2xpZlR3ZGI0cFdKUmlQcU13Q3ZsSzZ4?=
 =?utf-8?B?TkxUVHd1d1hHdW5GS292VnI5dldmSVQ0aDFXTklueG9CNzZSbFhhL2NCdktl?=
 =?utf-8?B?TWo4dmlCRXRyS0YyZU5PNDVVYWxmRnF0UllBdE4rbVpybUFOMmd0aG1YYzRx?=
 =?utf-8?B?K3M1eTRMRDN5RHhnN0RxTlBDUUZsVG1pVGg2amJMVU9QdmpOSllZT0ptczZ5?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 378238e5-26a5-4753-db89-08dd58115153
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:02:36.0193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxuILXSWIBTWRCdHTYG36wlIwYycJbBVvB8eBWIdzTa2jsjSSz5mNITGn4qx3BvOjTetqtUlSep7vVlJE2a1VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8862
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

Quoting Patchwork (2025-02-28 01:44:34-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Improve type-safety on POWER_DOMAIN_*() macros (rev4)
>URL   : https://patchwork.freedesktop.org/series/144727/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4=
_full -> xe-pw-144727v4_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-144727v4_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-144727v4_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1447=
27v4_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_vblank@ts-continuation-modeset:
>    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg=
-warn
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3=
df6fc7bb0c6359f0ccddf9d4/shard-adlp-1/igt@kms_vblank@ts-continuation-modese=
t.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adl=
p-1/igt@kms_vblank@ts-continuation-modeset.html

This is possibly related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4173 .

>
>  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class=
_compute:
>    - shard-lnl:          [PASS][3] -> [ABORT][4] +1 other test abort
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3=
df6fc7bb0c6359f0ccddf9d4/shard-lnl-7/igt@xe_compute_preempt@compute-preempt=
-many@engine-drm_xe_engine_class_compute.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl=
-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute.html


This is possibly related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4278 .

--
Gustavo Sousa
