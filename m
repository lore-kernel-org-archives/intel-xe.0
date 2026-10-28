Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C380606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3MfAMdQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D378210E0A6;
	Wed, 28 Oct 2026 15:56:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2610E677
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793202978; x=1824738978;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F1E0bh68eRuzXzxPTE67LLaSV5TysI291JCEjr8t718=;
 b=l3MfAMdQ+hd3naEptY8p1Xj5BW8QgvsbCDnDhZPy8rqadzN2BS9D3gHt
 /4JuTYKY1Gy76yDLt2p6ETi3mMdvLxwG3d2HbBTOg0f/mf/lVfowtn3Q3
 yq7pyW8hsMWvhGKXTMgR07WkvXyKggzZSunxza4UjPAXAbby9sYiyqHdw
 fD8N4X6mXDbCk8BBzcU1fUzKapuZV3EK/aNY9dzsmY+t3PBL5GUpN+2iA
 gIPWxKfSazttIpXK4ME5Qw6R071Zfy/iwibr9EPhb0cxU6m+67qSZXlhw
 6yccRdvG4r8pGuenha4iAX1pOvYKgHkktra4rTzelSYvtpSdwwCZJq8g2 A==;
X-CSE-ConnectionGUID: AMyRTVG7Rbu13OC83bggug==
X-CSE-MsgGUID: 4XMK6373RdqpSFJ4lvbHqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1810229"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1810229"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 08:56:18 -0700
X-CSE-ConnectionGUID: e4KbiuTBQteIgNzuWDimew==
X-CSE-MsgGUID: WRjn74KDTdSJ2yz69j1eag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5011097"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 08:56:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:56:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 08:56:17 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 08:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOBs1DJxoCz1d7VIx2k6bj2AuMHOVt5zFlCpRkzNB6eYxxqnGAfto1o/bKjGOOHHfZeOsMvTHRW2GtDPHMH9WSBiYT+BxJoKLG636thSoQjyaU3pIovMugbBDUVsVw2CupaohvBzS359KFuvMT2vrp9Vxc3b6jsYmYGcBRKtJBKSuGhkRfdkXR3aAPMYN9BQ7UqsqZ16jdfO+2t4wWqS4obn4yWObagFx67WeBRzFg2cOz/8SnaKfMiFHe+Y1Lt4nVbWHz3rBjEBbdaRjaIwS+suYxUtYKLf+cXz0+8lGeI5WzUGFIm1kPll2oJCXBhx2BMAe1OrZh0ycpordzKdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9iifanJjQZERcpSIDYP+5NY/ya1aslMUelE0wIpZ6k=;
 b=H/7cBfvCIx+9XPa3dv/EJ9/rtOHLFYEHbylU47iDLq+2RQWD7pFzorqp5WO/k0e8dBgTx/0OYjog1PUl25+32ovRN8J2HvZuCbbfS8sWkbVl1mrAigA7uJ56mCm/jxitd4gZl3tZdWJOIVm1ag3cdg2TzzHmnyX5k1IJSurVaT9aA5WCxKC2qA2neJ3hJbhswqSvHrwG+w9Nr4SZqu7B33LXe3T9q7Dx9mYCO5MRXwe9pyue0B3XhciPrvHP5YDxUKt4BS5LJ2cj+9nh6Ji93ImAKbRHUDXmI26J+8DJaWbNSNd7qzbEG4/hx/8v0tbzJ7QXbgE0jKmeRaIf0pCvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM3PPFCBDC4B878.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 15:56:15 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:56:14 +0000
Message-ID: <477540b8-b229-4062-a6b6-3bd9d338f9d1@intel.com>
Date: Wed, 28 Oct 2026 16:56:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] drm/xe/ggtt: Introduce full GGTT range size
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
 <20261021085716.709503-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20261021085716.709503-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::11) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM3PPFCBDC4B878:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4b763d-7908-40e6-05b5-08df350bfede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|261028144727099003|11063799006|56012099006|4143699003|261026140227099003|261021123027099003|261021121427099003|10067099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: vDcWKbs8u8A0O0fyYNDv6B9mAYr+iYgJ67Ccs0L6jZzorvAaPI1gKcXsgGYUYli6mNTG+2aMyxv/mVtCfgaWzaXVzATMoHwQqTf9MgOVttfIDrnmgdtle28ZToc5MeDV5eSMI/HMCteFchyWebiC5oRDtdIsQYb/B1LgeoMjVKXB+lNX5cDgmn11I+uQ6vUj+2tRC4P+wA+W7+hk3mIPW6OLtNhuLF5e2xzAypRY28NvaHSgkyHrw0cbmW4zmZGVtZcXFBzzdy2nX6y2veVXqAX02E4rTlegw0TVV32P4KEtY+CgfvE+ggmtC1KKnw+yh9aMGr7B8cH/P0PudCuzMLXISlkFU7Y/cSQeUMmccp7TIVW3WyZ3IYPOg6qNWkAyMtsISRDuG9a8vAdZ16Dk0+tqGvUkkVtdiSGC0ESFUpkJtSc4zl7qP6us1EDKmTM/0BS3WqurJqRfrNtucTnXB0K7ctzWTTgmGjiHUVMluQwJWIGF4vEqih/Kivqzc6NcgHAHK/B9mRhX+cpHpxBmpqwRCy+eWQndSsBQCGx3LmsmjRU4rsdXKV6juRfzHGqFLU2vJcp0T5jDj6DBNKUAvrCGIW4oz9rlN8FavGl/TkC7VMblETk/jCIafFpgzwv3ENLHvBsYnOkhUePeeBWTRkhqcJ1uDbNH+bPQKGpo4i4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(261028144727099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261021123027099003)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStjUmxJMTU0aGhoRGhncXB3V1hnRWlWVW1MejhPazVlTWU0ZTJQU09SRWJD?=
 =?utf-8?B?R2MyN1l1SlJ1alpJcElvK1ZvY3NpdGVrem9sTWltbTBTS0JDZHo5VDhla3M0?=
 =?utf-8?B?NDRwN3RRQWFEaFpJQXE1UGpwc3F1RElNV0dIbHpIWUdHVWtxcm42OGUwWHc2?=
 =?utf-8?B?cXd3Mms0TVo5LzF2SWhSaTdiM3Nqd2djT05GZ1I1Zks5UU9CSDJuU25EMk9T?=
 =?utf-8?B?TUo4UFdIcWhIZGFDRGNGeHU2T3J2V2laTVZIWTJTMG1UM28yWkxObmpIcmVa?=
 =?utf-8?B?Q3hhaERKYkVKcVkrYllsL2xMUEQ4ZFhNR1pzSjdFUGZFaHBNUDJWVjJXeHdX?=
 =?utf-8?B?UFlwMGNSZ1BKOWpCRm9TWmorQ0pWTElxVUE3WVBkOUw1Wlh3RkxFdHFqK0hv?=
 =?utf-8?B?cisyNHE4NUZUdWJGY1loOXNlQU9SUmJPeVl0eEMxeEFQVFB2WGd1MGRyWDdN?=
 =?utf-8?B?dy90QTBSR0dudXA3K05rc2c5Ym5oRmQxY2RuckdqZmZ1L1psa2d0ZEtpL0Z5?=
 =?utf-8?B?aDBOVjBISkl0VHlrdW9ldVVvRVN0VHJZU0xveTJmbG9jL3ArOXFDQmJwc1Fr?=
 =?utf-8?B?RVZma0E2N1R1UXNUWExlWGxWNmdNcGJ2em03aElpNFhOdWsydUdyOTBYbWJx?=
 =?utf-8?B?WkorUGJ0Zmx4Y2ZGMWFqcnltbWthKzRNY2V4ellYUTI5OUh4TThzdzBWTGxW?=
 =?utf-8?B?TzJieHB1VGZYSlY1Yjd5cm9semhVT2M3amZJbmtONXpLTFgxdzRYeXpvU1pQ?=
 =?utf-8?B?MUFLWi9Cd2VpOGx2d1V2dGdLWHVFL1BGWTRoVkl3dVJ2UDlYMU9XOTNMT2Z5?=
 =?utf-8?B?bElqTEw3eVpEWjhHejcrMlpTWE01S21yNW1HTy85a2Q1TS9NRDkyRnVsTGs2?=
 =?utf-8?B?RTV1dmFDUXNaTktjeC8rMUsyMUxjNVJFL3lxMktmOE15QnVuOGdyTVpLWVBv?=
 =?utf-8?B?d3pYelNNSm56dHo2WGFRQTI5UXZyQjVZRjVYZTNWTjhzQW04L3cyaE44d21H?=
 =?utf-8?B?MVdYTitEMFFlSEQrYkpyaUFEdFJvOGpiUGxFelNkbXljSUx6WmlLZUFsVGxi?=
 =?utf-8?B?RUdoK1NTQm5oOTRWdVVndWpGZVA5ZzBiU295YXlNeW9yMm1FRDVpK3E3MGNq?=
 =?utf-8?B?Uk9uZG05c29CUnRCQTVDR0xOd0hmdG5Jb0ZtSE9Hb096NjNpaklFdWsrUEls?=
 =?utf-8?B?cTk5c0Vla2VGRjRyNWFJaDZ3NWZyWENkTk5xTmZ2UzVlc1pSRTI2OFlpYzZj?=
 =?utf-8?B?blhkemxXMjNrY2NZMjJ5ZHBDQTd1ZC9WR0RSMHlNMzUyMmF3Qzc5bTVneUF5?=
 =?utf-8?B?QmYyN09zT0FzbGRVOEY4NmdiLzB1QmxVUHJVcFU2YldFN0Z2djJXKzA0RDV0?=
 =?utf-8?B?NHVaREYvbkNjQ0FVWHVrOW9lVWh5UXhka0dKODhTcHZLdmJITVZFaHpyZDEy?=
 =?utf-8?B?czVSRDR6WWtnVEZrZlZkaEdLRjB3WFdXd2UyUWJIZ3hCY2tqZUdXR3o3QVNZ?=
 =?utf-8?B?enFzdWFqWXFJejd6c3diblhONUZCTittcll2OERKSFZGUkdIcUxHUVpVNTRS?=
 =?utf-8?B?SVoxTEdaQ1lQeEM0K2VwUzFsR0FQZDFYUE9vWGtKTFJmSkFJdVMwekVzUjRz?=
 =?utf-8?B?NUU0aFNWVGFTdW9QY1NVUkhHbXVydVd3RTNxTDd5dGtIU2loenRSMEdPVElO?=
 =?utf-8?B?QjdJRTIyRWZldFVqZkNIWmdLT2hxR2UvTm83RUpLWHVxYmlwTGdleFZJbDdK?=
 =?utf-8?B?b2tKdVhuRjNwYi9JUEV6MjM5dkFqRFNNWjU1bWdUdGJsMWtPUzJoVTA0cG5F?=
 =?utf-8?B?ZGtMd1FNbDRkTmtiWUMxdUh5RUtPdFZ4TG4zbERQdytFZkllTjJvRXZtVGMw?=
 =?utf-8?B?U0JUMWNkc0JLVFFUVWJsdzF1MWQzbkdXSi9DemJVbGFGeVkvMU9hQW5zTllJ?=
 =?utf-8?B?dzg4dmpzeUtZNk5qT1htS052QmUrb2RFZFM0RFFZam9qUU5hSHduMTFvUDYr?=
 =?utf-8?B?RER6VkNrVHZ1TllmcUo5YVZOTG5aY2VIS2Nha25uTTVMMEJxUVpxSE42dWE2?=
 =?utf-8?B?Ykdodm5HTjdzQzNPOW5SeUZFdE9yTjVBbnFuY2kyUC9mVElocUUvNStKRy9G?=
 =?utf-8?B?VXFUeis0M0x0Zm8vUUx4dFlTZnlhR3phNWVkeXk3UXVLd2xZNGorVnh2ZWpJ?=
 =?utf-8?B?U2tDQzM5a1U5OEFxU256bnl0aitDSVloNjVZcndLL2ZWYmFGNmFVZzdWWFJK?=
 =?utf-8?B?aElCdnVYdXBVeHl4eWJzam1VblNWdXRrOEJJdXlJaUQ2dmF5RXpwMlJQazJO?=
 =?utf-8?B?V1Bka29LVmFIcHdJZVBhVDg5Wm1LVng4VG9LdlJlTjJnMnp6eW4rdz09?=
X-Exchange-RoutingPolicyChecked: 0WKWapDCVVW7R9V1PX2b3bmNj6F6mGgYdwsgbXU4t91uEsRZm6Cx0ZxKQNASQPf3XaiItNjWALbX6NHCFV6/up965VKjSYLFDiMJk+3puDsyHIrxOC9Zfo9pSDZiEFwYhQk52unOr7bkFvj0puT0rddfv6uyZ+hf7w5nO5Riiynnezu3Qe0aniDZE3M1Lq/Zgr+0Pc0I0r1Goe50s5PD9vI2EMweZxORb62fF8WguUd209MxghKijcizfvVnkIE7Jt9YZetswzRFhxmAPB0P6+aSfqsmWfy7zrkJpalTsZANHyZQ5QuYzTF0t6PG3uSq0a7nQdJB56G9llbIf4wubQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4b763d-7908-40e6-05b5-08df350bfede
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:56:14.9234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+3b1BKvHjKibvxfbyEQiCS8fOfSSiYoACtEW8t/4OccvplSGl3Cbp222aUaeXxh5FJC8Ghn2hgc7bqTXoPy0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCBDC4B878
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 2026-10-21 10:57, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Separate the full assigned GGTT range size from the size available for
> regular allocations.
>
> For now both sizes are identical. A subsequent change will reserve part of
> the full range for VF provisioning.
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2d890fe74c1b0..533c60446aebe 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -113,9 +113,11 @@ struct xe_ggtt_pt_ops {
>   struct xe_ggtt {
>   	/** @tile: Back pointer to tile where this GGTT belongs */
>   	struct xe_tile *tile;
> -	/** @start: Start offset of GGTT */
> +	/** @start: Start offset of the assigned GGTT range */
>   	u64 start;
> -	/** @size: Total usable size of this GGTT */
> +	/** @full_size: Full size of the assigned GGTT range */
> +	u64 full_size;
> +	/** @size: Size of the GGTT range for regular use */
>   	u64 size;
>   	/**
>   	 * @flags: Flags for this GGTT.
> @@ -241,7 +243,7 @@ static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>   {
>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>   	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
> -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
>   
>   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>   }
> @@ -256,7 +258,7 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
>   {
>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>   	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
> -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
>   
>   	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
>   }
> @@ -361,6 +363,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>   static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>   {
>   	ggtt->start = start;
> +	ggtt->full_size = size;
>   	ggtt->size = size;
>   	drm_mm_init(&ggtt->mm, 0, size);
>   }
