Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2260C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 09:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F3F10E64D;
	Tue, 14 May 2024 09:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKTx9HDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2AC10E64D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715678079; x=1747214079;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aCHcF8FTRCEsUUcLsHiLaCclku55+ZfYMnUsYYu7uwo=;
 b=bKTx9HDGU8Jlb7C2Ua0HvrMXZ6QiKq1QotoqnygDBXoGYN/krWMpQQUY
 lj6bLqFlXGY9ESea1+C18BQaaGE6fv4hcQisx6U36mR9u7HbfGyy4L/n1
 dRufERyGSL+nBXAT7UcYL56W7g9ca6nzEeZdOiWj2Ay55tehjh1yreAGm
 rLqvp0CUDoIHDXG9nLTVjJ44kPhB5Rh3Gc/mszLCC8Y1OrTpeShBqLVKB
 kdJiyxoFGJa8LmWRVkd4IFPqqUzYlFQzsBHrdJHuSlAB4FzZckZBIaRpG
 eIW+/ltJ4Usw2RuFdH72CDNmB+oZ560n5l0ClXaB3g7vd8PQfHGcWDgG8 A==;
X-CSE-ConnectionGUID: xEKl2he7RpmWuFDXgTYvnw==
X-CSE-MsgGUID: eVJzawqFTia3l+d88bHowg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11520798"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11520798"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 02:14:36 -0700
X-CSE-ConnectionGUID: ssrx9dMuTPSu9XODi56Kbw==
X-CSE-MsgGUID: 85UTSONUQLyd3OZmBbwc0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30664150"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 02:14:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 02:14:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 02:14:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 02:14:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 02:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuF6wlcCeWT5HMmJYrSurMeXccRuCR80gCvJugxpp5Cp9A3NGtbjyRunfkiV9a1BCbGCIxo3jCkDCnYp7wlyyyTeEu61b93BAKkK9eQND5bRuHjw59tsapZMLYHgIDxK7jq1+Rz0OtM1815flRUyWSoxqzwn4oxFieFc/vrSLYHWPIu3zjL4ZUmsybfdWM3HtLY47tsCdU9ypuodlRUBEmsndW4rI/eAbVcZBOFrmB2FT/QTXs0Z0Qjz+/zBG8/LITf+C1Vf/upPeJmRkPRjYAz/1hcNWMUMQuiUFM6AOEFB5aMIQOfp4P7VUC2YC1c7xnyiONahOYnhpzym5vwOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhQIcmxt3g6PaRkYHCYmt3v9GEyXiO0oEBUlPzmRhaA=;
 b=KIadWLcU6uMd1YKbi7Yj+sZ8+DE68ZU8tNfQnip+K6t3spluF7jch4oO+NhzDbN7Z0Xbqq6OpZMxjOzAtKYxuRTXu7WhiPtRrj8UVcZiIjvd9L455lPZBjEY3C5WH3rBeP6AOgKBmcyB+RQlpwJ1jdQNaWCWYVm+0SjWpFfk6yjW8EAwjLICP4qn3VZuGeS2gY19MniVgzr9jXk4jGTkiwp15CH43tK6nIODVchqYmYkSWKHW5aJ2l2V6gbq7s8xIk6cSKUA3D0jtQdfxq/0lrpnzlhSwiROOaehM1R647CRNB0pSr3cUFaiy7tz3lVJuHUVzAgK9b5jCNz+eWw6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 09:14:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 09:14:32 +0000
Date: Tue, 14 May 2024 11:14:30 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/8] drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
Message-ID: <20240514091430.4lfol22lz2345xnj@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0113.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 90728946-31e9-4e78-0c78-08dc73f64432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTJsZTZBNmsrWGNZMnFPUlNIY2NnTzgxUG9oTS96ck44UHduT3k0aTJnRXVn?=
 =?utf-8?B?bVhrVTJiY280VElMVThOUXRUUU00R2xwMkJMS29GQXlObDNjdDY5U1ZLeHc5?=
 =?utf-8?B?ZTVHVlRiU29xOFZLbFZtZW9YU0s0c3l0K1BSck15cXlXUzJrM2l3VkRYZnZ1?=
 =?utf-8?B?K2VMOVZWRkUrV2R0MFVmbndCaE9laUJ0QWdzODdWdyt1a1hsMHd3MGNkSlJR?=
 =?utf-8?B?M1JwcGFaZDMrbXhKNGRqSERMb2JISXNESk13TnZmTXFrdzdySnZGaEVudEor?=
 =?utf-8?B?cFlZQ1FYR1dQUWFzelFvWHNDeXVIK2RDTk1IOEpmL2x0bUpTQjkyeVlTV0tp?=
 =?utf-8?B?OVc5Q096YlRnOW9LMS9LRWJqeDJDZ2ttQ3FBLzhvMXc5NkU2NHZoS0VPb1Rp?=
 =?utf-8?B?WmZ0VnVtVDNMZDNpdmZuS3pMU1cxUjNBM0szc1B1Yk5LdFlnaGVxRGZPNWdI?=
 =?utf-8?B?UDEyWitEL2tXdHNzQ281eE9ybFRpbE43M1JaeWhiQlJUVjd0QjBlbVV6UjV4?=
 =?utf-8?B?RmRFMjYyRTVWN0VzR1BSK1ZCRSttbUM0WE1palU4cHU2amZmQVAxRWxWY3Er?=
 =?utf-8?B?N0U2TzNTUzBDcU9MYWwvakNKSGdGVGcranhlZlcrakw4dlNKME9nTjdjUm8z?=
 =?utf-8?B?QlB2Nk1FZ0VnTzA1TzlTeGNwTnFsTndiankwcGM1KzNoUkkzUTdxVFBBMFdm?=
 =?utf-8?B?R0xrcSt0K1A5bmkzL09rbzhKZHNHN1l1THIrZUxGeTF2VlJUWTJKbFNPN0dQ?=
 =?utf-8?B?K2xYdytVSEQzRGpxZ0xjdmFnYTJGNERuRmRMRmd4N3MwSTNPM1hxT2hPc3px?=
 =?utf-8?B?U0dYV0dtVGd6NGpjNE5sR0ZCUWFWUDk2SXNRTzRrREhQYjY5bVBvRGVPci8y?=
 =?utf-8?B?OWdmdm9Mc1FMbnlHb2J2blBhQ2NRak93UjRBdW9IT00vUnlST01QYlJQcFM4?=
 =?utf-8?B?aXhVa3VMTkFsNVRoM2xwajNCT0g1R29OMkR1MFk4WkdLRUFHTGd2TkxYUys1?=
 =?utf-8?B?ZFJ1UWxBb3YwaUhnV0F2VFJGWHFkeWo5aXYrNnd1UGpWenFLV29CYWMxV3Zl?=
 =?utf-8?B?cWl4YjU4Y0tuL0tBOGtqOVloNzE0TGRJUkhhT2d2TTRQd3hjV25TbWxQSS80?=
 =?utf-8?B?Skh4alFLZVlnRHdDS1B0ZkJ1RVljOE80ZkQxamZEWDlORTRVVjQyUGtoOEF4?=
 =?utf-8?B?L2c0V05rVGVlZ0FJM2N2WGR3ekg5QnNaSWwxc2pTWVBYUTlnOE9lSW1uQnZI?=
 =?utf-8?B?L05XWWFsM05IdWc0MjBEVC9MV21SZWttZWZHSUR0Tko0YmxpODZGUjk4dWdK?=
 =?utf-8?B?TDVQVXJTZld4bE14d2txbndxQlZFNC9JQndpQjgxMFg2Tkcrc1YrVWdOVVNt?=
 =?utf-8?B?M3QwRjZvaGFseDN4MmdGS3lyV3k0WFBjYmdxZ2NIeDVOeGxmMmJ4Q3RFbzlN?=
 =?utf-8?B?UFcrdUtobWg4c0tRcEwyVVl6dGVic1dkeHNaKzZWZnlvOFp3MFpqNllGWDBy?=
 =?utf-8?B?YXo5Z2R5aWgzeUFmNU1XOTB3RDZYMWprVFUyRTIvN25YY1NCWHJ5clMyeU5h?=
 =?utf-8?B?SWVrRkdFSHRHQlZoTUFaVmUrOEgyR2RaUHBsQ2k2eE9kcEhGR1g4NXUrc1gv?=
 =?utf-8?B?Q1NGNkpyNURxTWJUK0ZzWTFoa2FtZ0ZsK3dtWGRZVXdKVHZYTlFOMWdmUHp4?=
 =?utf-8?B?NjhsLzA4L3BRTkI4TDVvWS9UREdhNUpyOG1nVDJyR0JsK1c1cWhWd0dBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlhDanBBYVp2UUlMazNoMUU1QTRnTkRETXFLakwyNDJUOGNFeUpZUHgxVkY1?=
 =?utf-8?B?bTVXYkdHSkI1dEVKOVI2N1g0OTkvWTJnZ2hjYzRmMnhEU0JobWdQTE9jaEpO?=
 =?utf-8?B?bENDWjE3Nkd6QXdHWEdSdTdNalg3SEtDNmpPRnZzV2lXZVpoS1VIRGxodFIx?=
 =?utf-8?B?UWxnT3lFaEtrcE15VjFrZTEwemhwc0J4ZFJtdkhqRnNPdHJHZnZVYzlXM3pL?=
 =?utf-8?B?QStXeXVsZFdpZ3h1alVNU1ZTL3BPZDFvSDlWTndRMWtNVnUwclJwZmVOMmQz?=
 =?utf-8?B?UHIxOFczWENkQjZiVktNNitzRFhsRjM5K3IvYm9wdUtiQnYvZGVKaEFtbWZz?=
 =?utf-8?B?dFdpQk9YRVcyWFVvc1dwSjUyL2paTDRnS3lVOVJJcDRDZDZyeWlOMFhNK3JP?=
 =?utf-8?B?bjdmckFFOWxRM1VLQUFXeDN6UzhmN3Z2VzhRWFh6OXRUb3kvclpzRWNUekMy?=
 =?utf-8?B?ZDNaOGNTeElPTXpaaEtod205VFozQStDZjkzSUlJWGxlNmRvNGhOR1BtQ2Jm?=
 =?utf-8?B?c1RKc2hqdzZrcjlheUJDejlFV2Vnd1hmR1grTGZMWEo3TzlkZ3FtV0VjVzFa?=
 =?utf-8?B?SC80eHR6RUx3cnRKZDdXWVNHeGQxcHIvbDJCTnNuQW9rU29ZVU9HMlZialQw?=
 =?utf-8?B?c25CUFoxdXhnVmZ3YTBCTFpqYXl1RjQ4ekV1bjg4RmFncTJmQWhtQVprYW1C?=
 =?utf-8?B?OC9sMTJ1ZzFGV1dLSTZwenFBSG5jZnkwTCtuOERoM0EvQWg5bGY3SkZpQzZz?=
 =?utf-8?B?WkxnTGtFMHcvK2VJZTVjeXhuVXhmYTRXeGowMEVaQVAyMWdid0V6dFVDdFl1?=
 =?utf-8?B?a2Y2SmliYmh4QUp1dExGVUFubm1KQTdyYnE4d0svemwwQXp2NGg0T01icTVF?=
 =?utf-8?B?TWdHc2pzMXFxMmxOanJqL3U4RlpJTVE0ZzFJOGhNWlU5c2RGY0hBMytmemxx?=
 =?utf-8?B?ZkgyQk1XaDd5OVdYaXVrREo1MFhPVThDcSs0dGptcGJLeGFzdkZtbjdUS1Qv?=
 =?utf-8?B?WmlqYmFha0d2SURVOElMM0JOMVVSMUJRWHNuamVSUW0raTdSWmo0YUhzOUNp?=
 =?utf-8?B?OWNwbFdhNGl4STRYclZza2xYSHhTNWhnbWdhWmVVc2crQmVrY1lGY2ZDNGRO?=
 =?utf-8?B?ajFHcUQxMkk3NHdKK2gzZkxXeWZVK3Vmc2s0SFU0aHV1U2hMekpvdU9VSmEx?=
 =?utf-8?B?THNYK2J3SlY1TTl3OVdDUndIK2ZqS0RrM1VlN0tqRFM4cjdkekFCZlQ3cWtV?=
 =?utf-8?B?SkhxQkp6NG1kWmhadGlaMDdsR0ZPUXduc05OdGZhWEFhK2U5YVRIQjBxVVRX?=
 =?utf-8?B?N3l3aXhsdVhOMVhnaEU0blMvOUxySEg4cTRmKzU0a1oybXF0aXd5OEI1TkhD?=
 =?utf-8?B?b1FoVTVsek52YmNId3F2dlJzR0d4MHBEcDZrNDBtNFRvMFZlaVFIV2I0S0sv?=
 =?utf-8?B?eW8zNmFCNnN1ekpuQTJHTVBobzNxSmJlN29YMk82dFRvWGptZU5MMzJ2czdl?=
 =?utf-8?B?Mi96VnVyV1FWOXZtUVZRNEFPQ2lNWktsbExPZEdFZVpWb1ZCbGZ1Mmt4Znlt?=
 =?utf-8?B?czJsVTZyczNzSlMvOTcrNWVLZ1E0dW1kNmZXaWFaMFFqQi8yaGdaek1SRHVU?=
 =?utf-8?B?Wm5tWUJ6Vi96K0NYUElnN29EdEF1dFA1WjRGZFYyUXY0MnpiNXVoNUFrdTRq?=
 =?utf-8?B?ZkZqa042RkxxV2ZPaXk3dlJuenhRejZ6T2dtb3dPZUZBY2pobDV1dFh6WVhr?=
 =?utf-8?B?cFVyYzFNTVh1dEcxZEtTa0Rkd1BIZ2NKNkNIZC9YdlBpdlZBY2tLQ0tRWVh6?=
 =?utf-8?B?RWdodzBoaTk0THhHYis4VytIQWJHTTJuMzhwSDBRWEdBb3RQc2hCejQvQ0Nm?=
 =?utf-8?B?S3hYb0VpTWY0cExRTWNkRUN5UlpyZzBlN0NrZ0lRbWNxZXFUS3BiSXg3UVAz?=
 =?utf-8?B?SDA4VUhOMFYwb0lnZlM5eXZJaFVhUU40aGNFMFcyWlJzVkwwdTZOUDArUnQw?=
 =?utf-8?B?TU14WnZSYS9LekNNeFRNWnRaNTI2VENwdW84TlZSalVKTmNzWUFZZzgrOXB1?=
 =?utf-8?B?ZEljSUxOSlUvMWVJcGNJVlZYQlRNMWZZVWZDSjQ2TjhOa1gyY3JwTkVsZXU5?=
 =?utf-8?B?SlV3dEtyL2dPRlpvc0x4VlQ5aXlWSlBTcmZVeGJoeTQ0ajFKWGVBc2w0SFNj?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90728946-31e9-4e78-0c78-08dc73f64432
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 09:14:32.4009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jmz3QMVymhrhqEl+l9cVl0Qgrzz3QtOy+FZveISkvokFM1GqnRtnm+0ofFAGlKUvYHapAZNuI7VqxHU99gp+e7RmqS8KMmFa6SxuYFdSBkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:12 +0200]:
> When thresholds used to monitor VFs activities are configured,
> then GuC may send GUC2PF_ADVERSE_EVENT messages informing the
> PF driver about exceeded thresholds. Add necessary definitions
> to our GuC firmware ABI header.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index c1ad09b36453..f1aa7f88e217 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -171,6 +171,36 @@
>  #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
>  #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
>  
> +/**
> + * DOC: GUC2PF_ADVERSE_EVENT
> + *
> + * This message is used by the GuC to notify PF about adverse events.
> + *
> + * This G2H message must be sent as `CTB HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_GUC2PF_ADVERSE_EVENT` = 0x5104         |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | DATA1 = **VFID** - VF identifier                             |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | DATA2 = **THRESHOLD** - key of the exceeded threshold        |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_GUC2PF_ADVERSE_EVENT			0x5104
> +
> +#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
> +#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
> +#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_2_THRESHOLD	GUC_HXG_EVENT_MSG_n_DATAn
> +

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  /**
>   * DOC: GUC2PF_VF_STATE_NOTIFY
>   *
> -- 
> 2.43.0
> 

-- 
