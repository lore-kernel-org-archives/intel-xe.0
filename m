Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9388CCFA06
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 15:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04D10E420;
	Mon,  3 Nov 2025 15:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMm+wYS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B3710E420
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762183246; x=1793719246;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=luyyv2rTxwvAY1RBs5Fx0h+TI4F8l4B63NoSqKQY8ZI=;
 b=MMm+wYS60svEwoKqcMp2VsxteJ9+CkS95t+QCwvkoxh2vLwXqhCC+QbM
 /SD9SAo2/pMX2E0kD84dlJhDwTaOZv1E5tuo3jc29RXLxYyiCaubm6wAE
 guQk/vRSga8cJz5n4yvfBvvXD8NAmB73XfcWua2ROiJ80FpIf0maXc6Jf
 iWr06S/ywLrawb8mZnqXKVjJU2wqxFu6WmgT8xriV1jr09rPQT0L19Tx5
 Eydp6fA329TSNDrCMu2+fRt/7W4LGWc9XbL4SNPrw11/Rklmi8LkaG62W
 b6p17Ap+FZY0U4NqQfpboPmAK2Rk8a3ekZe/0NVJbB9ig7AX7TI3yOYd0 A==;
X-CSE-ConnectionGUID: Os73PY/rQzmCmKg8kLKufw==
X-CSE-MsgGUID: ddJzu9ZeRcGkGguMWBTtzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64147640"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64147640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:20:45 -0800
X-CSE-ConnectionGUID: 0rLZcNB9QVCjM0njeT/oZA==
X-CSE-MsgGUID: sWIzWGoATqusnlbDxST0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="217530321"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:20:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 07:20:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 07:20:45 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 07:20:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlishqmAgphLocN8rgvvsGUk8xyoChMRAD0PxDTa4YUM2wI6lk6TDDh2Nv34hd/Y6GwOnG9MkIoy0nT05e7rQSgfpnRiLjR0ONeJn4uB+zHzXAIa6Tr2hm7T4UXkj9oXnMcrRwCzDQ/e8Wc1h8NHmCV+Ctuu4JRF+OmKGJwhSbh7uAi59ktTX2/znTkGICGP7L+92n0rCGBWP9XUECRDdAYPiblT09yeTe/XqwwTeUJqZGYAaiWb/8+rmbbrs45asPVS20O2XeNorDYi+mBImj3tilQbZ7P5rE7A6pnqskqtKsUwRbAio4yZTARM2B5uVPWwVkXup2gfKDL/rIH7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOi2nxk8SfQa2QJV7YuDIb0RlNuvJDKr4EO1ygitPFc=;
 b=IzGzddhQPj9y0fZT62C8jeqTmHMluSLg1LwDZMGlSfj8FrN0HgY2nrKlTcvJE7BbX9sMqwAa65Pz/xEK4wWcjzZJe4rzmQKNaFEPUSUsQ2DjN20lmRMWrVyg7q3yIHkaAJjQ4oTJll1ycYTuzygubB9dGSYKhlp3LOmH0jKHS1/ShQo2uRkSNGyuuwIyHol4xUQ60cLkjJKDYMiHTyAwaihL+tUsaLr0ROlxiiePqsNwUDFSoD/+4K2vvTd2UZrZBhqU3luc64rc0JtMFJs4fOWwnJoa1Z6nVkjpV2tct65bNYx6LolNWafPxMdASj3LSjBOrT8SbxfPGEN/iknGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPF867D7FF5E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:20:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 15:20:42 +0000
Date: Mon, 3 Nov 2025 09:20:40 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <u5iaqtgrobvvzal4t7mjnspuacswc6ul5etk23toitrr7e4wdd@zkwdz2kvsfxf>
References: <20251031-gt-throttle-cri-v4-1-b4691ee9ebf4@intel.com>
 <aQWqyJD6n45ufeZM@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQWqyJD6n45ufeZM@black.igk.intel.com>
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: 4388f7d3-01fd-4749-1fa2-08de1aec8da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qg1kVWKPQe7eYL+JJEWztKnw7QvXVexp/2FPrrhcNv2jZ+V7Fkk0O0IjqjNv?=
 =?us-ascii?Q?UOHWM71Qy7IARlmQwte6zZFY6yuPoH7ybBePu6cBG53HWjRQ5pbJDaXF7i6v?=
 =?us-ascii?Q?sLghv9nFICDH0ZudxCY4n/NObaZAzqBolmJt+P+B+32+rJcMxCC149xePMzx?=
 =?us-ascii?Q?dDizKhN1iSO220SUarIGpk1pCbH23Zoz8cmGCYJPvuovSXzV6pkgb58AMEar?=
 =?us-ascii?Q?QoE61bs3JYAysKsMt5tgqcUP9ZmNMLxhtMEQgpnUvzHDIWjUHbLyTmp5bKt2?=
 =?us-ascii?Q?D/sjiCLVEkvsITtZnALjsFDS9BgwNRTDILQlx0MeB4oe23WPHFmEUUeitlgy?=
 =?us-ascii?Q?lLoRQGp9t+eZQR/HzNNy1TYkjvgcf9zksDjVAY+j/42zwC70Zp6qBOUzm4jq?=
 =?us-ascii?Q?SaskKAlU9FtEPIG9B23v3Z9eaVruBJoC2ZDecZj1VVzIuEIs95Vxf2/o0NKR?=
 =?us-ascii?Q?UJ6i5+Jp8345myWmKQ14EF3nZBqLTOipn5I6e2aROOyO6OWp92CuhufZvO2j?=
 =?us-ascii?Q?znLlmINBv/xGcXxVMSS+aomI/3yO3qPOoTvDaQKWYs6xxG4GmXaBVtjZ8NBE?=
 =?us-ascii?Q?5zPJ/IHLTsyj+5Z6VesXgQTJ5DgG4QRAfKxzBxRfP9pshUnI6s6ZdLJtk2tW?=
 =?us-ascii?Q?cnTaiihQ32P/OlMOEbdYu6jKCz7a97Ytq/+At4Y01WpHlUWsIvMMqmHfKQe+?=
 =?us-ascii?Q?rwjVkzHJGQM09WACm2QpipHoZmbZQOdW8b5/MAP2ck+SGY5Zn6Fd67S5NqJL?=
 =?us-ascii?Q?wMk0nBeeFMOKVu+D6TUkqzb90hxw5UPWc/hGu2K6BWlfR1RLdmLu4GtX6hIU?=
 =?us-ascii?Q?iUn/ff8aZ/dfMa93kNIScwFwHn+ucN5Curlb5IcNgG+x4D7wEVlvAUnrVpho?=
 =?us-ascii?Q?6NcCzbVpioAY4gtYQsqG5AWJeKBDDzv65HjDvRIBKu8u3VkwZMQ6NvR1OxLa?=
 =?us-ascii?Q?qcm0fPimPIlPPhC1tec1OxYjLMsGzlv5nXBAIS1WSHGRII3p6EFggH+UckUj?=
 =?us-ascii?Q?pVey19wUirdOscCnovVsVehHOjy/93k5PXmjsU24KW7YsdsJPx24rymNRhiw?=
 =?us-ascii?Q?EElhG0UO+a2qhL2zFOI8m1iGRcuzPe7ucij21wSWTroYaUhFxMN24R3QGDnb?=
 =?us-ascii?Q?Qrq6wHUXzlrJnc3wThuAsaUudr4Ge95DG6ArE1X0Y6cMwW+92617arZ+otnf?=
 =?us-ascii?Q?tXv0hUGvBLd1ljtD1EeJ9tbexxluTCTsVkVFTCp4BlJtLirAC7VTwuJXuSHb?=
 =?us-ascii?Q?mU18mlV31s1Mylj7HJV/jZ/PyrMh3kl5i/X/4TZMxJuX6N/4Dt1ivNQS+VSA?=
 =?us-ascii?Q?lIM/PGJhBf7L030mKgpCoWOaWA8aZOovillYlDntR7qnSY1u55PfJ5UhPIo/?=
 =?us-ascii?Q?5Yam/iqN2WuFeojqX+iWUf/x9CATAhJjYaYtxh/X8w+yijc0Gyv+O5YfC4hK?=
 =?us-ascii?Q?Q80Q74AzKfo9kwI0X5EvlBJof/M0X4XyrkOrgtVTa16Y4vYOswhtKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVgubOdliRnu1EjZ5DLqgjk/nUvdxws1PhE8v4UyswzHp8EeY5ZiuNXXkpf/?=
 =?us-ascii?Q?ueFzdjnZsEYa6lCDNacplUX2JL10QIKjyuQaPHWs4FdKTx+6/cePfFFq1ixX?=
 =?us-ascii?Q?sPbAAPegC5VvTEJ+gKcgdGdn8lQFKpbZY9MF5quT5wnSUdgKF5p0XKNS8bJR?=
 =?us-ascii?Q?svmCLtog2dqg8E+glH1mMJ/a94pQW0Cs/ftk2glspc9vc9Vmor537WwNfrLg?=
 =?us-ascii?Q?LcrpfdM5jMmnul/n+hgnkC0wPpMoalSl9jLf8sVdZpascXRpNNKDYG6lt2Q2?=
 =?us-ascii?Q?elGMUVy56oaBpZ2NBtlyKd8UyGLgAbo3fk+0w2w3cHqDMfccce0RbPdaLH6W?=
 =?us-ascii?Q?dTWPH0OsHUKeyjVOXdFp8S1Waftt8GLgJg4Qvlxin3v3dY+l/y9/b5WzZC/x?=
 =?us-ascii?Q?gqyHBCqlr8xf6FcVdzf94YNR+GRlzOF6jd5xvfOHyVBHwWf4r2f+Xvqp7of8?=
 =?us-ascii?Q?gjx/2ei85vQZv1o5MN/y7NahvS0bBQs44N+NnAjvWyxIsBbxtsXSHKr7B+pr?=
 =?us-ascii?Q?h+GhYjqEU5Smd2PgctktxZt5FSgdCRDH7vkzSvMX9mLPYEvtFITzDA7Uq8OU?=
 =?us-ascii?Q?MEFEHtIC4Om/FNxJMjZyvF+Kfz8vgJC59cr12JdHPORwuQ0/XnmThqEYSue4?=
 =?us-ascii?Q?8mi8oEWfFEUE5LkpuymhhjI/iSouylfM5Js5Sy/rBtRn5gI2ZxBMh966gxzZ?=
 =?us-ascii?Q?xTedKbTYNJr9vMQui4gCqhLaT+5n46YQ0+raYmXEGd/7Inyu4eOy6VQxXzLQ?=
 =?us-ascii?Q?2G0icHutE+7T9F33RLSB84wNiKP9F57surkSGuO41bCaV7DSio8Z3+XbX1Cx?=
 =?us-ascii?Q?HkXgwKT7WJC2gIHOQOYw7cLAyOgRQHPaSbkac5/75u3wcVvn0F7AwKF9W+XZ?=
 =?us-ascii?Q?AMtoK2I04rMQScthIlxGKAq683y7DQauPKw9SQwBhE4/kG5+0A3WN26lO7DG?=
 =?us-ascii?Q?UhHv5/OcWkZ2dvO2tF/POm2FuPM1dQEG0tkgYCX3F4mpiX7wIyb7b1isaA1P?=
 =?us-ascii?Q?hvGYVt4y7yeQeYdV1icLZrU5UtASIhmD34B39Xt4Z3U42O8KYUzIJfTQR7hU?=
 =?us-ascii?Q?QpCgBEWQC47u18mvEVcsW4YypCF2USHw1J/M54QR9avwsWotzbrK2Q1h8Yiz?=
 =?us-ascii?Q?jukqL01VpdSTnHLI63+gtWHWV9W6LbtJTW5tgU5N87Ev7NwzYGbDEPZYJp2o?=
 =?us-ascii?Q?WNSZMJ7ebu+CczvXzKjNLZvOqzJucl6R4gas6vzMdDwEqbH98INwP31yQ42U?=
 =?us-ascii?Q?jrQof7+Qfspv5/R1ZuXKD3lQRFA4wKdtHr88S+nytjmSPMp8tpKGxaH1CCPP?=
 =?us-ascii?Q?kX+8b6ZGBkvy0fn2C77mr93eD/b7LT9fSSSfGqA29qj3Eh2sz92d1eyHscWp?=
 =?us-ascii?Q?bW3chxwDiuAwdF4Z5H+TP/+Iam5cKTfR3vsHv7mkQqHyzbg2Dj8WtIz8HyVR?=
 =?us-ascii?Q?26EXhIfu7zwdJT+Uh96jmTGte+wU5S5dpX73O7Qa20I4QK5hd0FckGL4nCR5?=
 =?us-ascii?Q?MVEmsRARI1Hy302o+wPNDobG4QnALPaau3HBnSVOHbtiZNqni7uqQ8UZdws7?=
 =?us-ascii?Q?xMD3gVXEz3fdCtVmFScNShOeJ43avBIjXc20GLLVGsP5nD6vrS4uer7263+I?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4388f7d3-01fd-4749-1fa2-08de1aec8da6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:20:42.7363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQfiiWwfzGOi2bXR3YYcirG+ujgAFc3MuCpRSp5TN30VlCMHuAEyStA091DA1nsLWL2G4jIwsnm1xWXCZiz9HI3xvPhQU1+lqYjtrQ4AHb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
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

On Sat, Nov 01, 2025 at 07:38:00AM +0100, Raag Jadav wrote:
>On Fri, Oct 31, 2025 at 09:47:25AM -0700, Lucas De Marchi wrote:
>> It's currently not possible to safely monitor if there's throttling
>> happening and what are the reasons. The approach of reading the status
>> and then reading the reasons is not reliable as by the time sysadmin
>> reads the reason, the throttling could not be happening anymore.
>>
>> Previous tentative to fix that[1] was breaking the ABI and potentially
>> sysadmin's scripts. This takes a different approach of adding and
>> documenting the additional attribute. It's still valuable, though
>> redundant, to provide the simpler 0/1 interface.
>>
>> In order to avoid userspace knowledge on the bitmask meaning and to be
>> able to maintain the kernel side in sync with possible changes in
>> future, just walk the attribute group and check what are the masks that
>> match the value read.
>>
>> [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
>
>...
>
>> +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
>> +
>> +static ssize_t reasons_show(struct kobject *kobj,
>> +			    struct kobj_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(kobj);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const struct attribute_group *group;
>> +	struct attribute **pother;
>> +	ssize_t ret = 0;
>> +	u32 reasons;
>> +
>> +	reasons = xe_gt_throttle_get_limit_reasons(gt);
>> +	group = get_platform_throttle_group(xe);
>> +
>> +	for (pother = group->attrs; *pother; pother++) {
>
>Shouldn't this entire loop be inside if (reasons), or did I miss something?

it could be an optimization, but should work regardless.

>
>> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
>> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
>> +
>> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
>
>With above in place this will be much simpler.

why would it be simpler? we would still skip the status attribute
(conviniently defined with mask == U32_MAX the status attribute) and
still do a & with mask

>
>> +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
>> +	}
>> +
>> +	if (ret)
>> +		/* Drop extra space from last iteration above */
>> +		ret--;
>> +	else
>> +		ret += sysfs_emit_at(buff, ret, "none");
>
>I find the lack of '+' a bit more readable as it guarantees that nothing
>else is inherited here, or perhaps it's my needless paranoia at work :(
>Upto you.

Keeping the pattern is good IMO. If we'd change then it would be for a
sysfs_emit().

	if (!ret)
		return sysfs_emit(buff, "none\n");

	ret--;
	ret += sysfs_emit_at(buff, ret, "\n");

	return ret;

Lucas De Marchi
