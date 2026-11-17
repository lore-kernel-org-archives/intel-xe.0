Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB5606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HqlLBw7b;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RTqUq0kA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0049510F676;
	Tue, 17 Nov 2026 12:00:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4FB10E445
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794916801; x=1826452801;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6iKp+xBvhjtekAR+8uAr/QV4ZkTrfQAdzezErAeotxw=;
 b=HqlLBw7bhb9avAXN44tdO/ICSKEbq6ZAGwvm96H0H7AWMFuXHH+/N5SM
 1Rj/EA1eF/PcKFkUKNpdsztUI0IBsFuOJ4jYiDZpDutxWa0gfA7BF3xLR
 PyylQR06Hj0EJulX4kIi6o6ze0x7OaoEqdJasOR4Nara4Ed7bXKRyK2aE
 iS50hJkJQbttFxw0KQtRWioTvXIf28dyE9SEpPgrZhMBy9RVwv9Gkdf37
 eXMkxCOOA9eMMEV+czFIJ/SMQrqF8NfCBhGGWTpLyrwpLVcgPj5PU7eNG
 H+I8sVi+SVuWwEHq8D7jE7YtfbNJe1aJJSWeerjBNS2jYB/SpGNr33WHH A==;
X-CSE-ConnectionGUID: lO40S9MwSey5FLyMUCa6jw==
X-CSE-MsgGUID: CBtSXnm/TvuAoF+rb7a2wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3701128"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3701128"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 04:00:00 -0800
X-CSE-ConnectionGUID: ZPHJVbnYTROWqCJSo0577A==
X-CSE-MsgGUID: Jnw+3PauSFeTeV9Ty3NpVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10078458"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 03:59:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 03:59:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 03:59:59 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 03:59:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=si8SPIrIZSwP1YJis5LJMCZ9MF0Cw18d3kJSfBZfB61W4GznIYic9jkzMfKG4A4Q8YexNp+jNglXvb7ftazRNC19mEoo75elb+3hPsWK2hk6xKqEVkKPKqso+wFIbLVsCFBH0q2ddp3bTkC4Yt5TmbUTLa+J6q0JfX6KKXaudJIIz/qZ1lU6TRTFhMO0lb06fDr3/24z+AxzUkaJU4eTvyMMF8dPQX1gh5vUq7hjhst2y0s/KVku/e5IBLxG19l91743Mumg0SC2jDFo63DoRS9+q0v/QP2iq0MgsbH7+GlMwq2px9W+xPumG4y0b9G/JESGDpn7Vruk81y3gEfFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5KlKVSkrd0BAQiTT912omJ3EwmFJ01FZvOjbgkfljc=;
 b=PEcAnWUROsjjOwGsHzXVRRLfDB/2J6pohM9CYby1i1FYAoj2yxFobsI2XwT2f9vYQg0EBfvJLb4+2hQ8tW56TuHV/bG97pdgLd8VD7SxSHwukZ6gJACEg++UCxbjkcPRw2i6SpVjIeX/I2a4arb6lhPxi/fqgo6qjMmXSeCOA7cvCq4cU/RC/hXtr9EHYb3XQ1HTmCLvso5Q13US0ON0B0LkKq+DDkKoMtJKewA9SslPsg4vM2vOfS+XuKPHz9v4zibvJ9+IxVwyDByJlPkKTqrjxZ9KOj1Xqlcg755wPGh2mMc3oGLw3Hg5EaEZS2Mpc4G6ckYvVBm+fcW6q7STPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5KlKVSkrd0BAQiTT912omJ3EwmFJ01FZvOjbgkfljc=;
 b=RTqUq0kACLY37pUPp4lgINQ/yRBa27Rgru7MyJAyaM3PZoEOoZBbskC6Y/ysqTflkkRGI4oXe4gLLtgRkReVecuzlEfOvGYaVofqUTVfP9zloS2et3SH9rLk4xZrCR8womsLw8wxGveiWfQag7yEs7MhPAi2ayh3TUHN+rZIOyk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9715.namprd11.prod.outlook.com (2603:10b6:8:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:59:52 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Tue, 17 Nov 2026
 11:59:52 +0000
Date: Tue, 17 Nov 2026 12:59:48 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <satyanarayana.k.v.p@intel.com>,
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Reset PF scheduling defaults on auto
 provisioning restore
Message-ID: <20261117115948.dizqirj2jbjgpe3w@intel.com>
References: <20261110162609.41234-1-jagadeesh.rachapalli.bandi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110162609.41234-1-jagadeesh.rachapalli.bandi@intel.com>
X-ClientProxiedBy: DUZPR01CA0195.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::26) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: b2616259-911e-42cd-f3c6-08df44a2499b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|10067099003|261028144727099003|261026121527099003|261022105027099003|261022075727099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: SEX7whPzmUSu5jFC3PCq6NbbvWhJhEorKftxbsmY8AWtJp8nEXvxbuV7fyEfjJSgZbtbS6+IuXnNTPyDzQVzxNeA+qLkfVmxO9kO4HKUbiJkGEkTJmsMQ0Tavcj8Zaa44UrsCo4zrJu89GsrPDjkqQYR2KHynj8C7hCp2abdg+kL2BXYkir1OkjpWOINFG883LQmHyu/7H/0rTS/4g+R/A8mkEYaOythaizd5dWzlaZhrLOdzFoqCQ485siiXBz1vNQu8+dmRnt/ppm0NIiij3DJHrJTH1OgsNuZB8ciJL8CK76O8RhhYgqg9mVtiZ9sHNXHVzvyDBm8X4ONYDYydigq0wsbXHmzQ6VYMvd08OwJrR6534A5/JeTsk0A3CjHDcw1PdDr6DOKXz8gQAKv+EBs8t2QRD4+KL2yZnU+bRXUSULvVGRsryPGP0crm97YVi/uQiX2cWg3pWZIRJlM9KzIytKmd0OgG/qxvQGlHbp7TAtP4UlcrKEkNcH2h8j1OPZrw3MfWFEfOxJBWoql6Of38x15QWvjASJRG/0rbFQsddx1Q6LaBPMlASxvXo0kPsYRcV0FOXM4CQSy18eNiyGHr8rXCm+T/wO9rZgXfWCkXyDSrAfLM/y5mqXNrg237JtVeS9ucu006TD/oCu5ePLG85agAET8ugyvlnywL9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(10067099003)(261028144727099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUsrUDNmbmNlQlJ4YlpKQkN6NjVXeUNiUWpNWW05bnUxbXc2czQ2WXYwam94?=
 =?utf-8?B?S3VCcEl5M1RNWWx3R0RZRmdoenJ3VzYrSmpCWjM1YXN5UENrSXA5eldUc0My?=
 =?utf-8?B?Wk9IZkJ4WTFNbHhKRHpsdEdTeVczUm1IV1VnNkFGQkFrbnBHbHdLUU9qZGhq?=
 =?utf-8?B?NU9BREUwYzduOUpPTjhpVmp3M0FsT2pYaUM0djlqNytKQ2JlRERmQ0VENTFS?=
 =?utf-8?B?WlFqNU5Qajk0THhSd1l5S3lwYnVROUhZVDJVaHI2OTdVZzU2VVByMFNHQlR5?=
 =?utf-8?B?YjZmb3ZtWmlXdVc0eE5UenVFT09GSTIwakVaYzZwamlqUWhWcng4MHYwR1FG?=
 =?utf-8?B?a1ZRdnNGS3JEaVlQdjBDVWR6TUQxN0dtNlNhUjBFS2taVzV1SzZHVS9RUUQy?=
 =?utf-8?B?cEpUZlFyR0FYdkJaZkZKWjhyNDEwdjBnS21oc25kN3hFNnJMSytjK1N1dHI0?=
 =?utf-8?B?YStOVWliRmJhaHpZMm0rQlhoeDFjNFJ3UWtPSHpyeU5Pc2VCd0Q5dGVKMnJE?=
 =?utf-8?B?SkE3NHhwS0lSVnpreUJEZ0tneHd5ZzZ3Mnd6dlczaXVuQWFTWm5ITU80bDEx?=
 =?utf-8?B?VkJETEZIS01VU1dueWd0bHV3M2RieitsL2ZzY1RZNWpXcGNEazZiMFdyVGtu?=
 =?utf-8?B?c2l0SDZTL2lLWVF1R2hheTJpQmtjbzhCVlRtOTg1ZTNaVnVUb0FKa2czSExj?=
 =?utf-8?B?Q3Q4U2JtWURjYVkvdHQvRjhBYjV4Ris1OXNGc3ByK2JueXBjUGU0UWxsVVBT?=
 =?utf-8?B?WHdXYnRLR2Y4T0Y0YzdVbXB2eXpyU2paWUNtVmpqRGVFbzJMQWt5elhrVFFQ?=
 =?utf-8?B?ZmNkY0EwbWN6Z2tEMDBpV0U1UVdodnBCQmpFU2p1YlRvSzlXVm9LTEFWNFhy?=
 =?utf-8?B?UXVZaEhuRndDbzhhVkkyOFFwenFCVjgzRVJVZkIyVXlPaVVTNjJYRTdLSlJu?=
 =?utf-8?B?bjdIU3hlZllhS0k4SS9sU2tGQ2V0WXBZa0dQZG0wdmV1aVNUVFdVdjkwNzA1?=
 =?utf-8?B?K1QrMkF0cFFMcVNqU2NnZzByZGZIalhJck00Y3pvU2lVTHBKb3NxSnEzOUFy?=
 =?utf-8?B?bm1SWU81N0pIaGw5VDJDa091VEF2cVBidUkwVkhqRzhvSlNwS2NoNS9lOEVU?=
 =?utf-8?B?azZEVi9KY05qSTF6THlCUmMzUndIclBKeENOZFhJbmRUOUNMZlAxd2tqUnJh?=
 =?utf-8?B?U1BLUzBGbHpOcWRsdHFQaWxFbXFNL2xWbUdLWGpKM3JHVTNDWFF4V0tyQVNt?=
 =?utf-8?B?QlA5Zlo0eVF3Q1krdngzanF6cWlsaWlxb0hONGcrTWxLSXVtRGVWMnR5QUhS?=
 =?utf-8?B?SXJLTXM1UnVNMHk2dytKamZoTEJoZlhWdE9VUVhuZE9Uc1JjRVZGY1BTWEZP?=
 =?utf-8?B?M2hIM0VBV0FGS1lULy94ZlhId09CQmJNYjM1dW1xZUVCU3FoZlJSb2R1N0k4?=
 =?utf-8?B?T3oxelRYNmp6VzRhcXdKYURxc0dGeEtLUTNGZFFJOUQrSnVCK2R6bXYyekhG?=
 =?utf-8?B?aVNyVDVmOXF3UFp5Vjhiek92RjJLWGJYaGxBVVlTQk13eU5Gc2RDSzR4OHBB?=
 =?utf-8?B?aEc2ZnREbUpXRlY5dnVyQmhEU05CU05CdjlSbkltNnpNYXlnSnc5ZVhMNzJO?=
 =?utf-8?B?am9FdWw1enZJWTdqWlIvVzJJdHFvUTMwbWdIbmpnY2NvOU10NkFuQXM1d1lp?=
 =?utf-8?B?ekYwWlR1WWpMcXhUL0VVMk50ME1uRGREUWd5WjBHMEdQbGlEN2dDQWNxRERu?=
 =?utf-8?B?eXdmUm8rbkRKRkdIQ3MwOVppUkszZ3NTWU85azJJblJHYWVPU3JxeXZ6SHZV?=
 =?utf-8?B?WkY2Ky9MOEF5NkpsQXRzQVZrNHpHb2U1Y2w5TmkzNGlyV091L3czOWdzMzdP?=
 =?utf-8?B?TXZIQ3NqNmJKN1lsVDU0bEtyRTlkdFlXNHYvanpZbm15Y0NHYWc1ODdWL2VG?=
 =?utf-8?B?aWpxZnd5dTJSSU0vK2JVWXVOREtIMUlTbFE5MVJNcGJRSTdYZVBxUlJNUnpK?=
 =?utf-8?B?VGZrbGtFVm0rT213dGxpalU0MTY4Q2dxcHY5Q3pKSXFZMTRQRU5zUmVIM0ly?=
 =?utf-8?B?MUhIcmlSelhHVzhkSFZuZlpGQ2ZqMllsTU5zU280NUhoc0trbVVRM29HRHlX?=
 =?utf-8?B?QzY4a2FYWVdoWnBEVmdPZFVlVVJVNEJ0MmFSd1p5RnRrWjRBbFZyU3JTOXI3?=
 =?utf-8?B?eE5DWHlydDJFSDVnMVQxTGkwdmlNRDIyNENCcDg0U2c3T3ExMzJEVVdvMGx3?=
 =?utf-8?B?VXJVNEE2bFFwbjMwaUNKY1pJSGVlL3dCNjlSNDgxanJhQlJnSTdXR2pKVGVB?=
 =?utf-8?B?RXFvOHlaZ01zdnR6ZFM3dFEwbVloK3RhVDVHTkVIdFRrU0FKSTVCVzAwcUEv?=
 =?utf-8?Q?UPGCDKs8uksAnFps=3D?=
X-Exchange-RoutingPolicyChecked: yKW6QjcOkGCQQ/gk5D0XgSZltD8CtOEtbTQlc+SWDIC2UKbOXcEpqVkybIvS6Dpu1zfcK4wdSce1cWi5kbB6CMZlniHftuNtAYGfbwnFJ5ee6usDzsEiBr4yoYqXZV7RWH9O/08afVvrhNssHBI1c6LCubD75zDhZhphOTSBRR25zArY086wStZ9kwMI66jhnpHO/c2cWqKHsamhWBFOlklfbIPC0+1HafSq6HiHzNWZIUB13sIbBdyf5HipOKVTiCw/FMgr4vnklciyC4Jy/KjcPFG2rIhXkPkWLkI4vcgau9dH8eVfpdtdt1+nM0iczU6NMmPI2d/rBpBIh1f9Wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2616259-911e-42cd-f3c6-08df44a2499b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:59:52.2113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rA1ec64OJIaEEVw0rzp94A9gwZhFTNtTql/+zT53+HTdwP5zCh2ORLDax69pZdH2YdcyyWRidI8rdlwx+Go1F6F+Z2lIi9qBzqGL7bT8XCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9715
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

Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com> wrote on wto [2026-lis-10 21:56:09 +0530]:
> Restoring auto provisioning releases VF configs, but leaves PF scheduling
> overrides from debugfs in place. As a result, the next VF enable may skip
> fair scheduling reprovisioning, leaving VFs with infinite EQ/PT and
> causing VF probe or FLR timeouts.
> 
> Reset PF scheduling defaults when switching back to auto provisioning
> so subsequent VF enable reprovisions PF/VFs with fair scheduling again.
> 
> PF: Tile0: GT0: VF24 resource sanitizing failed (-ETIMEDOUT)
> PF: Tile0: GT0: VF24 FLR didn't finish in 5000 ms (-ETIMEDOUT)
> 
> ERROR Tile0: GT0: hwe rcs0: emit_wa_job failed (-ETIME) guc_id=1
> ERROR SIGID=101 FATAL (-ETIME) PROBE: driver loading failed for device
> 
> Signed-off-by: Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>

Please add Fixes tag


> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 7357b9369522..7d8dfce5b268 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -162,12 +162,18 @@ static int pf_change_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode
>  		return 0;
>  
>  	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
> +		int err;

new line here
>  		if (xe_sriov_pf_num_vfs(xe)) {
>  			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
>  				     mode_to_string(mode));
>  			return -EBUSY;
>  		}
>  		pf_unprovision_all_vfs(xe);
> +
> +		/* custom PF EQ/PT/sched_if_idle would block fair VF scheduling */
> +		err = pf_reprovision_default(xe);
> +		if (err)
> +			return err;
>  	}
>  
>  	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",

That looks good, with a fixes:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
