Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C053CEE01FA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 00:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686E010E9BB;
	Wed, 11 Sep 2024 00:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5CV7BCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0985C10E9BB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 00:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726016287; x=1757552287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4sP10hxj0bMlsTkSKpb2C+2xZ2c7twL4oJcEIaXBpvg=;
 b=V5CV7BCw54lsi3q6pmOrXPjBlsIqdjt5iewudHZQQKvi61XayuI6KCh4
 075tW5v8Lq6g8FZApjYKv5CbUnZI7/HxSsasnyV3ON/3U+Q6BjFJLbZ70
 y/dvC/eGaU0PYaQSZtNIMbInKL6nyWt11AHJFGBqdO9LSUpus1aJPSMWI
 y8W7M/Vm8Q3FvrvZYnlFV7nBPJvM2MbbQ+6+Tfc56JZ7p2nOIm6Kkz8Pf
 LRuhAb5x9ewRr2DP+nLhM/e3j+5+46yrKSzkoKBC+1BRgFX9Z8sJWgYPv
 KIGIxDwfPFvMLNtYJEWfCSzSna7siWOrh3WiKAqMmEz6qe6WoQMU5UgcQ g==;
X-CSE-ConnectionGUID: FNWjkgaZS7y58j3TESZ19Q==
X-CSE-MsgGUID: ga+348QLR4mCzDAMExQHcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24990977"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24990977"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 17:58:06 -0700
X-CSE-ConnectionGUID: /ZOHrbOeQjiy0SSOgKASRg==
X-CSE-MsgGUID: y4sowkW1RLS7SQu6kYAJFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67053070"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 17:58:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 17:58:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 17:58:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 17:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sns+WU2kZvoKnHJwYHXgADdEIK0TjvCsQy2atFC0KQiiAGKm3XXipYCoW+7CbYbp9Jn1Reu1lmdGdMsP2BjmQebVKgmXrBD+Xb5BIf2MQfSjdvL7PIK36UF6i9Sa7ePDhSI7JCdAFSrPXsA09ANaw2yUmX+ixD7F2z1j39Wg+2b0e1NykhVci7N6D8j5oBc4YYyeZFiYw6pWsKs3N+eBnS9CMc8G41ELpdLmgDyt5PGHUx6kCtr5l7gczxlfDvbpYa4bXfZ42MFoEatm8X/b5wRAUzNQ5EoWhI+IFIO8XtvKswYJ06euDdsskr2qk+cdW5FTxn9BhsUuLh694IMmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6eIu3LrBeK+vwArvNMl9S75p/cLiZJa32xLo4I86u4=;
 b=ECJv4rnNYRY2yAIuTaVg+uFEyRMgjSS5MnHTyBLulF2mj1jOG5R8YLE2E58CBZu0vje/G9M7pis6phYcPMTAASN1lUKALoPc2BhId6+bRmOZRiVz6WIYPjmNY7x6pJU1Ceknd20T0fdnk+1CdW122mU5WC62eAxbmpCLv3rbA7WaXPTNdi1sPaGWp9oHonstsxDnkzT+YyNWuNyASe2Wvoa7gXlHeLOIYsJ+r+ZbfGEIWWDhtajOjKDxmKmUpuI+pXNepTfboWLGufetuqZP4NqSJfyZhRtfWAkb5bxE4Btk+pv1isNLNcVzZ0RPLqq4HP2GlUKJVpX9UDCwVsnd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.33; Wed, 11 Sep
 2024 00:58:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 00:58:03 +0000
Date: Tue, 10 Sep 2024 19:57:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Enable Xe2+ PES disaggregation
Message-ID: <slkwdfygztw67triuhz4bihzqke2yrmgyfptbw43tanx5x5c3d@rcz36pcnshap>
References: <20240909165933.2638765-1-ashutosh.dixit@intel.com>
 <t7zip5kycyg2rtnzesno5rjlkdfu35idee6fk5sn2purbif5wm@2qxutmrlwj2y>
 <87wmjjyqe5.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87wmjjyqe5.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0234.namprd04.prod.outlook.com
 (2603:10b6:303:87::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0e87f3-a701-4b01-a1b9-08dcd1fcca3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m+cXz9KfF0dnW3RDiGzkz/CCXVOM+2nGSDttBpm96vLu+mLXE7Fjk2gwMYrz?=
 =?us-ascii?Q?OhSe9JlKBkQfx1m0TD5leUQYSKWYEQCXZ+L9CCxyRfOA11sRxBCWLZKtTpSv?=
 =?us-ascii?Q?sOUyYjqKC3SoqMsuSpj+4f2cvR49aQuBsGi3Z/sLPqiXuFADwQqTwH0ezBzM?=
 =?us-ascii?Q?JqTraNTqQk9nkw1TzzJb04Bz9fj6CgzhOBBfvF69ARhwch9ql4kNKO6XwZuc?=
 =?us-ascii?Q?y+c4hBDoYIQDZFhRbHfDnfyIxt3BhXTvzK/Gsj9O1C4qaXaV7KmXTvYat6kf?=
 =?us-ascii?Q?mgR/kmnN4zUpPY7DzyFomqvVrRywdfICGg8hVNiHj/v3UGBqjHnWdInrII8I?=
 =?us-ascii?Q?DVD049vl6sMz/wedvRYo44stc6VDW7Wa16SlakYYo4t8/vchkMOjWlHE33t3?=
 =?us-ascii?Q?kFjpD1q9n/iP28Zwn6GQMLZIK6NYr640uh4N8UcntqtJLdZpPIEk+0syXH6W?=
 =?us-ascii?Q?3iX5RxfHAwV9j8AX3H6+vDwsemNfaXR09uv5M79ofCRn/8ivrKxr4U46yzEt?=
 =?us-ascii?Q?4ggkEsoNIWu/IkX25FG/mkItcfN+qnZ1nwoW/VoT7nTFyxSeiCK/7lPYlg0p?=
 =?us-ascii?Q?KvvnCZKVg2TFmqOlm/N5vSA3jPbn5YuWlre8IhXmku/cXJSyoi2nMNrPjLdb?=
 =?us-ascii?Q?GZ48Kz3mT7FmLBwAXustb0bKUDAPPKJoKJ7Sdr6CB+t70Q0FPcCwZ+7HCzz9?=
 =?us-ascii?Q?Fo/7N/Qs0K9gagL6/cOIuxVnoKfg+X7t5QQ4N9w7UdB7jmvI0NT9jvOr/TX2?=
 =?us-ascii?Q?8T7D6HpU1x4g/IyPY7L6P6GhK2KXvcA0Z8hoFJlSKoaqD3BebocItWIBZiit?=
 =?us-ascii?Q?b0RVFvkgcaaQDeBS5f9BxL68zFZf9TfKyqA1LRANqqQ3NNCDzio+d+/tOsMT?=
 =?us-ascii?Q?33ARfVg9aC1yA37YViJqzzSUe10D8FWzapD5KBj+unOXRGd9SYXQwgcerFgK?=
 =?us-ascii?Q?wSNw4w/8FNbJQqzS2rPr9tS/+FDQTM/7CW2LyUF6njXKMLW8MzsX7Gv6eY0W?=
 =?us-ascii?Q?xDzjByQmqGOtyMznieXYCDW/ThJFLO6fOccfGoiUUz/pzngh4ai/+YZW4UtR?=
 =?us-ascii?Q?ic0UVdLcPxoDecS6uxD3f2Pf5qvLA3TYKPtMuOUG4Mr1/1rNQEcxLXiKtiBI?=
 =?us-ascii?Q?ScgqWsY6nl/1mCQAJzfGgVpNcqz4MoenhjCOtdofjhVdBPHuDkbnLS82v5B8?=
 =?us-ascii?Q?HhRM1wH1tf8rQqhIa9M17SZL8wrgcMJlpqzN/phPEjQT9M/OYIiSfArckkUD?=
 =?us-ascii?Q?VzPSEKy0sDwfhZO6J05sZ/2i/LSWQ6KQTuTHPcNc4B8Cjqs6EvB0nha7cOm4?=
 =?us-ascii?Q?nbOGu/IZ6B7ynNwyAAV5kRmRCQnsQCbp2TEVEbxZHpPN8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sTCULxs24HTYGj0HoEhgDi2kGqvJdOhGNPFC5BrDq1/FHW7+TDJvycwoa2YX?=
 =?us-ascii?Q?dbe9JI63+O4jnFKy3nSxxf6eRpmvJfAG0OXhJ1yN5S3sSJFeqlTSdTvdiLIh?=
 =?us-ascii?Q?6AwJDZ2rg76nYobSeXdDod4/ttG1ll9khoePjfBWBm/7BQ75RzRzMXAcTMe1?=
 =?us-ascii?Q?DgppvCto2rwFhold0Ycvaxa3sTQmCqEL0flyUHNGS+TdU+IJ+Y7KcLxrksvJ?=
 =?us-ascii?Q?iQB4N21r/XcfLQy2t9bT5C5Y7Z7M318bXO4rTJLZYqnnh4sjROXcU6i8hq1e?=
 =?us-ascii?Q?nwP2pZneCEOe1f+M6kOtGhf6BmdXtnYU4E1XFSnHeTWVaj3b+JN09cCPivNc?=
 =?us-ascii?Q?vrPW26SWxSliiPKo1KV48T8PNj/hp31iE7kw+IeEL6rwn97dqdCDc8KipmHQ?=
 =?us-ascii?Q?7kIE5kHOIfTliEc9tDsLspWTxvqoUOLXib/L7K+wbIsRcp+54TTWJIbSbyUx?=
 =?us-ascii?Q?JeAm7E6pFsjuXpHCb1jBxgHak0h75drXQQrH1uTrq66UQV+PeaSj/qigb311?=
 =?us-ascii?Q?77d019F4ObxnovxGjAUHbBSI49YZEMvUc9y9dnkFV0ouKsX/Pj/CQ8TozRFJ?=
 =?us-ascii?Q?YfswzCJIVondstOzYcW4lH/b1B1AO/pznDMSxbDU0XBW9fuDTb1vK+gwt1/X?=
 =?us-ascii?Q?t1NcsOW5cnrwbOYNZuuAgPmv1El3kGqTz7n+Y8/Jo3dEjyZCRuf3Sp3G7fm/?=
 =?us-ascii?Q?ANipqbmwKQDiMsXsXoST7OBxFeicYBXaRjO2mQENFYVdIx8+FCn8smmDhpp5?=
 =?us-ascii?Q?8gnguoZWh/APRarKQRnxl46SOk+sX5jZghuIuUiapjUXDeyzhXG8lf6OjRFO?=
 =?us-ascii?Q?7O54ecNd8GefSEl30WXN7IB7CwQ0HdqkRZhnPUnghmFNTc1oXdCoo8fA0tkn?=
 =?us-ascii?Q?UlCjvqlgIovz8dzXhiLdMRqeBzRCpNvEg1ek7Jo0R8LdlaECW3628JN05gPq?=
 =?us-ascii?Q?KcF8fSwc9RqT//DCaPxbaWTF8fWHm32auog/NL57j3VgwB1/EUMvDiH1CAwB?=
 =?us-ascii?Q?Da5s/YCv7yRlChBZP1WJ7p8YexkwYrKszWiVMqIPQMD7E3ikZim729k0AnyL?=
 =?us-ascii?Q?w1Tx32afS5dVD9QAo1KS09g6kt7lqZfmaClsCAGzAJGaHt2QKTmqeI8F5cjO?=
 =?us-ascii?Q?C0UrOXarTMpHYEO7+bIGsKmkjFdzAlZVjWUTQxjnIK9jRwVmzWmL0p3ijXoD?=
 =?us-ascii?Q?t3UtJE/R5uhuQPbNGlGxX2ji+Gb3cWC32i0vj9ikgYcHy6Nj9T1vduSzRBTX?=
 =?us-ascii?Q?iEULUNkuFVF4asoLeo2554jCTsdGPFaTHx+2duED4Rs+TB2W7vE0H/n9eva7?=
 =?us-ascii?Q?y6fvxH9KCTVXvbMV+GEZYEb+4FC100gdzgRZ8+mUfAoGPBXXnNt/gO9EwuJR?=
 =?us-ascii?Q?2k2QB9oKeHHwUf+CgibbaiVENvu0yb7u7KmpxS7MhB++NQ9f8haQZulD+51Y?=
 =?us-ascii?Q?mVmOD+SDUwlcKRqTBvVYRBddLMv1Ji2qKd4X7OgwbOxCTeAt6lsEQO56t1uA?=
 =?us-ascii?Q?0aCApPybFAknaEVfT1t7Fk4Il8NzIEQnq7mV9JL57eaayGDM6KRj4ciGAy2B?=
 =?us-ascii?Q?/7G7dHRdR9pRkmWZpzmbqcOgTvO9v839ZOcJx/D3Nu5vryL6XR3mbd7wviI/?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0e87f3-a701-4b01-a1b9-08dcd1fcca3e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 00:58:03.6564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LM1otqBCmV3CpixUqDpAeKSoXhhOBongi4riCCr1xcxPfj0FNOukdYuvj4vrBNlvCkjuYEZrNLc0YFLjjAa3RGkdXg8zd2RJ8cszOq4YjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Tue, Sep 10, 2024 at 05:40:02PM GMT, Ashutosh Dixit wrote:
>On Tue, 10 Sep 2024 10:04:32 -0700, Lucas De Marchi wrote:
>>
>
>Hi Lucas,
>
>We had a whole email thread to figure this out :/
>
>> On Mon, Sep 09, 2024 at 09:59:33AM GMT, Ashutosh Dixit wrote:
>> > Xe2+ PES disaggregation for OAG needs to be enabled to obtain disaggregated
>> > metrics when disaggregated data is needed. There is no uapi impact of this
>>
>> it looks like the *control* for disaggregated data is only available on
>> xe2
>
>Correct, that is why the check below (also this is available only for OAG,
>not say for OAM):
>
>	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
>
>> and we always use disaggregated, right?
>
>No we don't, please see below.
>
>>
>> > change.
>> >
>> > v2: Minor change to commit message
>> >
>> > Bspec: 61101
>>
>> "Note: After enabling desired disaggregation mode/s using this control
>> field, PES MODE_SELECT field is used to configure appropriate
>> disaggregation mode of corresponding PEC."
>>
>> Apparently MODE_SELECT == Aggregated is the hw default for xe2. Don't
>> we need to program anything else?
>
>So the code in this patch only enables disaggregation, this additional step
>(PES_MODE_SELECT) is still needed to actually use disaggregation. However
>this second step is done via OA configurations which come in from userspace
>(using add_config observation stream op). So userspace can request either
>aggregated or disaggregated data depending on the OA config it programs.
>
>The goal of this patch is only to enable disaggregation so userspace can
>use it if they want, otherwise they can't, they can only use
>aggregated.

can you add a paragraph to the commit message stating something like
above?  Because it was not clear it was intentional to enable it in the
control and not in the PES_MODE_SELECT.

thanks
Lucas De Marchi
