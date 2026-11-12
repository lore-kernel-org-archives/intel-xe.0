Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E6606A8B0
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NgJsiANS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cKVIro4S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A341410E16E;
	Thu, 12 Nov 2026 21:46:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBED10E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794520008; x=1826056008;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=awjP+Oe/gR5X2PX0AP2GyWp6xW6IZNTpIw2wuyRGe3c=;
 b=NgJsiANS5rmpqEiqW5MpbcK8gBoM7FVtWBxkOqTQ/6aDznHvBIda925E
 w0AfkFk1JZyrJY8YS6jTLnE6K0mi9mXHPo2me0udAgxJOPwxzSSe8mYyZ
 lN3X6bszyrLxCG3yNuB8sA24hWgG/PxhWewXr9+a2kVZxuDZcizJ4T5bj
 N+0N6saJBz3Nx9RsZsq2+25B6tzoSNqptL0whCfbnvEGTDErXffnrGrRZ
 2egnwMy1zeu2raBe42F7BNlwoatuKm3EELzWgAO78EzlxiH4nxjsKRS0T
 yFFqgCEPHsnqLZirzu7EIRRnlANuol7P/5v0MXSPQNnKemL6PXmiCB4TF g==;
X-CSE-ConnectionGUID: sHpVPzz0SoGV6pq3Ye1eZA==
X-CSE-MsgGUID: 1ivEBw9QR+iIKbAwjpIYag==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3352536"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3352536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:46:47 -0800
X-CSE-ConnectionGUID: WH19LHNnRZ2+/5oNXrguDw==
X-CSE-MsgGUID: XTxT0O8XQ1aMziifH5ABNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8619628"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:46:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:46:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 13:46:47 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:46:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDAfW7lxtRFdSNDwBKMJu0mf5/86GGQaoCMFttnPSTWIvV8kiQ9obt7KLu7AWloXWFkc2Q8pOWWxXOtqW8pFKRUzE0aOMUvNSUkmBUC2CtFSwaubSBjWNWfkBizTm2m777IIebmBVQ4l0ZGBEPj0ojgD16WLZYvJ4mFxhSpQ/ZmtOOrvjqtdA9e2/T6oJIjgaa6R8CMvPsFm5oLMg4vAidmoWZYbK9ASDrj+ZpEfUlERHXv9e4xZhJFwPshNv/jHgmBzZ/WXqkVF0+ZTJb5rhs8C5LRQ/rVFppxYpt3pqjlixLZ3rLs3JA9H5NYW3vyhDLuR0Qfa/bvVCcX98c9z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKqADnDzqsX483GhHZ6Z7D2jtynETHrQyaCCz7OwqVQ=;
 b=qK8QWUqu7wXFQs9g8ETRVV2ehtBW9/dhJiF9aGpWOvQhelqU3VN9UIFrTzD+n9nnN79vi0231Lg8YNLK3DxLH4b9ChK3v5FjcKICF+MhsMoITVtas2CyWZvIOceoZCzK6eax3gCRY1ZEi/Bx8i2p85aFaOBUFiDXTP3ZwhrVZfr+UZb6+K1ViHC9chIpWybcSVZ/0l0lPrNhXvmQSPorvUw9snZ5CbFvYiH1nl5R8QK9Iofsm5qlJKAuoz4Ak7OyzvpAIxbbPs6bINv5mE0Wtxz6IzMZBl1kq/Z+s/EDe+AffGxnhcUXaKm4vlS4tKFfCD8evJ8CEhwwFUaNUA/eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKqADnDzqsX483GhHZ6Z7D2jtynETHrQyaCCz7OwqVQ=;
 b=cKVIro4S6G0YpoEPj+Khac6ATCy2Q0MzdL/COgV3yxO0t1tiFX0/9Jy/iDI8xJZaB2Wcg5CIwX59ieyG9TPbZIJX05AtvP+EsuhBE6W80KrbKGaq/i7YM/cwCHkOlg13BmuIaTZigyMF8ZHU2w976RBNBFrhNZty9QjQTmtDL0g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 21:46:42 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 21:46:42 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/nvlp: Drop force_probe requirement
In-Reply-To: <avSKcvEXGAsoJLEo@intel.com>
References: <20261110-nvlp-drop-force_probe-requirement-v1-1-3dd6aeac38fc@intel.com>
 <avSKcvEXGAsoJLEo@intel.com>
Date: Thu, 12 Nov 2026 18:46:36 -0300
Message-ID: <87y0axn2o3.fsf@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PH0PR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:510:4::11) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c1871f-8900-4395-ed9e-08df41067028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|10067099003|11063799006|261021123027099003|261026121527099003|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: csGEEdJd7Q3afogw8FXug60fOMP6SXwPfhu7ZWzEAvrowVoqIFBNH43n+mWtzIKA6fjQNfSo6Hk+q/xDhw4dJbeiGMHClHmaGSm6JZ61R7XgMzUHaHFb4aISMLDp0MTcdgC2Xt5B/H+hoJfnlpzgFYD4GPc0U2TriWcZylbaC0D4J679QgfGF/Bl1F4fGE33WGEyyQ7IM6x7V0XNesblEnInNgcM/AX+OnBUy7JKl+ADE3RPuhT5j4H3Q43GzyZxTQqHA+SOgGKPnQ/K2rjWM6LbIzzvvoZIRyNdfGWNPxNXZhluPZlT/Uwjg9HU59IsgHjAu70YygNWp+9UODjyyI2+wEQoRt91C4YHbF6hcoQTE9NmxROAl9zg2FXf+Xbh9M5OxiKFXVGSKv0Rb5jKk/k5CjoMeiflCSCQRa2SnbjSkCUVmb8mQLchJiGyzhdTO0vxqCUuUR+hekh1rR/CIPspl8KjwVVHl1aaO9C9JQtHsP6J+Cfsaztb0ZYeVs4Msw7n8GeFs09Fw2OEBdF72RgbOYfLfI2sjEbX3BHHD8sG0RXESlXbc09bWcNx9TP1DAzGyCCh875cyIBD08BQukd8iqQqIMwB3Bt6Xs4HSVjWmxfQKzQPE85vMXPTbi/ji/pnBct91h5PMrtrj/XiyFhGG42V+XttraoB7ujsIf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(261021123027099003)(261026121527099003)(56012099006)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1FOZGZXSFN2WHBxWWtzVzh2K25sZkh5aEd6UVNrSXIwLzVCUG9UQW5hSXVq?=
 =?utf-8?B?N21xcC9nV2dZQTgwVEE5TlZuZ2ZRQ05ucmVTZWlPNElrU1d0enFNYldrTmkz?=
 =?utf-8?B?a1BURzFiYVR1bmNDYklYQW1GWXdNUUNjTENvam4wQ0hqTmFTaUQxcjhsWHR5?=
 =?utf-8?B?anR1QThVMW83ZmJUMmYvY2o0NU9wOThiK2M4VmJvdlpIN1pUL0tiM1RTc1BN?=
 =?utf-8?B?Uks2eHRReTFqaHZhUXZyNzZFcDlkV1lobHJsU0lwS1RJaHRyNUdCUC8xWWsr?=
 =?utf-8?B?OWErNHQwMzNUMVJDdDRaK3RiWVQ1WVVGOFA0ZW5WZTdDSEhSbUw1aXFUQW9u?=
 =?utf-8?B?V3gxMmZmOWpqVVJCdWQzMlRZQ2pWTzl1Y2ZJQ2M2Z0hiUjhYeDBodGV1djE2?=
 =?utf-8?B?bHRsdXlLamg1Y29UWWJiY0tuZGRjNVpsYi9zS0J3blBRUTNURmk0bDZTL1do?=
 =?utf-8?B?dWptdGhTTzBsSmIyNERtbDlHc2VGdDdPcWdabHFMUHlydFZadVBReXVYWHZ2?=
 =?utf-8?B?OHJUUnpaMUFtcUVaMnVlOWR0d0NvTkUrQ2ZySnhDUVFzdllMaGZtdGhKejND?=
 =?utf-8?B?R1ZXam9nT3lKQU9yZ092L1ZFQ3IxeDBub3gyYkdWY3JPc2VtYjFIczRRNDFy?=
 =?utf-8?B?YXdxb0JxNzQ0SFRoYmg3Qml3VUpYK3kzT29rK3Z6anJIYURHWWJ5Q21hNnkw?=
 =?utf-8?B?UThXMXI0cUpRaU82MFlMeXJnb0lvWHBKSzJxbTlZMU9BZlVSa1JrbUR2Vi8r?=
 =?utf-8?B?cVdiNjMrekFnYW1Ec2VVaFlDVlFXeHc0NnpPb3lQWENFTmloTlN4bEpCZzR0?=
 =?utf-8?B?S05Sd2RkOGtIZjIvdDVUT3FJeWJoTi8yWFNBV2tHM0pyQ0d3T1pQbW5rNzA0?=
 =?utf-8?B?bXIwYTV1bXV1c1dtaHdIeFdCSVg3aHdESEI0UHloRUVxeUNPR1BpZ3c1MjhZ?=
 =?utf-8?B?anhmZ1Z1OXBrZVdHZ0hZdDFKTCtQVkYyL3hTK2dKQ2Z4NWE3U2Q5RnhYMWpw?=
 =?utf-8?B?WVZaL3hjNnEvR1l3Vzk0UHpYaXNzbTM0bFo2L2JxajVnK1VHVUEwL1VTUTQr?=
 =?utf-8?B?ZmdWb0hDOURaaThPU2V5Qk1SUGpVRzR0Zmpid2o5V0xmanFld3Bwc3lNT0Yz?=
 =?utf-8?B?MWNlMGZsOC9VOTFldkcwaE9WQlIyRGZQMjBBN3Q2bDdETUJHSFg4MzlQdnZB?=
 =?utf-8?B?N0xwcTdGdU5MTnF4UklVRTVnVW1YMTJNdERDM1k1VVE1cW9sOFZlV2tSdmJh?=
 =?utf-8?B?VHNIdzFTOXhVNTE0bE1KMGdDVnZOaC8yRDFLSVlxK0UrK2FveEo5KzcrZXIv?=
 =?utf-8?B?TWxpdEhCT3IzWDVqSllaNHJSMVU1UUFmcDkxVng3L2FINEVFWCt4c3RJUFN5?=
 =?utf-8?B?dTcvdUxqNmxoejJuTEM3dGZBRVhpT1FMYzNBZEhpYjdYN0dGRkJSWDFkRC9C?=
 =?utf-8?B?dEt1S3NvdmxRYkh6UXl1UzR3RlAzOVpDU1JtbGtCSlJ4Q1JFYTZLNlczWlc4?=
 =?utf-8?B?L1RodUhFTGtSTW1oOGFhZWpXQWFlN2xjRXJ1bGM4K2p5ZnBvelhQbjlwRDBM?=
 =?utf-8?B?bXVkUGdHTkhST2RmRE5yVVhaa1kvUTZFZjVCN1hqY1dLdUJDL2RCYktBSkZv?=
 =?utf-8?B?Sjlkd1o2dWpSRENOcFUwcmxzOExXaG9xQnZLYW9oTnR6ZU1TTWRqczdIa3pn?=
 =?utf-8?B?ay9lQ0hkTEFFc1pabzlaaGptNXVEVEx0WFNyVnkxcmhFd1VsZWpJVWlZb1VZ?=
 =?utf-8?B?VitoWnJOZytZbWE3NXFybmxKOTNQcUtYbGRkNkhIT0FjQlFVSTJUTWkyUXQv?=
 =?utf-8?B?R0JSOGRmeGhnM1J1cTBWK0tzNHJnYS90emtUNTBYRzdPU3k0aVlkbG1nZkRz?=
 =?utf-8?B?S0tpS1ZVS0hmcWE0TGsza09iZ2Q3anZDZHpBQkt4QzVUSUlOTEZOM21FRHVl?=
 =?utf-8?B?NTlWemxMZVRKclcxQXNId3U4OWpaNng0MWNtWVNWT1dDaDQ0RWhxSElmN2R0?=
 =?utf-8?B?cnpVTlpWeTlObzB3aFpKRFAvOEc1ZWg2MDV2d3VQUjlaMVZKMUtGTE5mOUN3?=
 =?utf-8?B?VTJVdURkK1M4TENSVmdWc1pNR0M4aEpkV3huY3hBZ0V6ekRhenZ5UVhrM2lO?=
 =?utf-8?B?ci9mT0hmaEUxV1FvNkdDZ2RneG1ieVVvWUsvaUdESXZTQk5pdUwxNUxHUlRW?=
 =?utf-8?B?cDE4N053R0o0TWFDNC9UZHBzQnIxRUhvdUJLaGpNU1lFZ0F2eWdYeEh1QmdP?=
 =?utf-8?B?b3BQSk1VaERQUm5uK0xBTjM0T0VZSUVMck1GZ1lTRUdFcXhHRi9YQ2d2Yno4?=
 =?utf-8?B?MzVyZ0F2bllqQ2JpbTFDeUFLejNRdXIxSU1xWmZPS2d0ZXFtSnphUT09?=
X-Exchange-RoutingPolicyChecked: zMScsinppzTalwoN/kkVWn5095M26kdyNTdXrT0A531KOzbiBJaXhcC9vRpOaShMqfneXEW5/ScfSYnsXe/hesWnlX/Bt0bjmf+gpmUYRR1WuOIryudN36h4r6DJxM/l9zdmxAXIdom7bk58KOIGjIF5okhQZ7YpeNkMMB+YhV1Ulp9QhTFUU1JpOISNuXJLiOdJWh2RZNQibH5Io2/HjKo1AwKHLhZiEGwp84DeJEZ4q684AIcfp1HdbgVx4YGoYjelqFp5blnbXJsqBziPsOUf5X6IOpVzNSsQ7h32TCXnxJe5MIK0ss3TnkbtpSf9a9LBpYIqViVAA2q2jgHbdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c1871f-8900-4395-ed9e-08df41067028
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 21:46:41.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNamsIpCEVn0VKlAY+c+GlL/S8vlJ8SfVSAEdzPoAS5OWxqknRcqZGzFPk8Cl7BJsA/MHdTbZ2PJKIZo0ICdXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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

Rodrigo Vivi <rodrigo.vivi@intel.com> writes:

> On Tue, Nov 10, 2026 at 07:52:23PM -0300, Gustavo Sousa wrote:
>> NVL-P is stable enough for us to drop force_probe requirement. Let's
>> do that.
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Applied to drm-xe-next. Thanks Rodrigo for the ack!

--
Gustavo Sousa

>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index be1b063cb68d..fefa600b7ff7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -508,7 +508,6 @@ static const struct xe_device_desc nvlp_desc =3D {
>>  	.has_sriov =3D true,
>>  	.max_gt_per_tile =3D 2,
>>  	MULTI_LRC_MASK,
>> -	.require_force_probe =3D true,
>>  	.va_bits =3D 48,
>>  	.vm_max_level =3D 4,
>>  };
>>=20
>> ---
>> base-commit: a6a3cf6cc0759788b1b0ce63f9cfd855d5785449
>> change-id: 20261110-nvlp-drop-force_probe-requirement-7deab7e4e3cc
>>=20
>> Best regards,
>> -- =20
>> Gustavo Sousa <gustavo.sousa@intel.com>
>>=20
