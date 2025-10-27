Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA489CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 13:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0410E499;
	Mon, 27 Oct 2025 13:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lq0nEDJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F0F10E499
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761571573; x=1793107573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=haaoZLV2XwQ66KEqZth4YkAvw2rTHltsTp6CrL+dbQg=;
 b=Lq0nEDJTswU4wR+OfMjUUs6ayFHydtYcDWQrbSZ5pHp4HBwIGOQR9CO3
 9zNjRP7Z9+U2Hn8Ar6EPNTD8NwTqTn0iA4rq7s1CQivsYDsKascqKc4Xo
 UBfNqFayrhOM/zKeDfxWst+bS7OfbXaDluF9jBOLln4mMcUR1vl5w8Ltr
 QgHLF2Xk3ImDJ+xsKtQzpphqkJb7/4nYSd2XbSXCotn/V32JZHvUqYCby
 bCMSJyxYMqrK6FaQLNEI8oPn3GIBTsn574IEl+QY4LMZ4nImjjyGuW+Wc
 j4dTnU7YwTDVtrrRbEAEI4+S/b5b5TcfcTl0FUz2v17e7W5+CIhuqS6qg g==;
X-CSE-ConnectionGUID: Jo0Y+LgKSo61ZAWv2jpPtA==
X-CSE-MsgGUID: nhEdYuQATxyfT718jOhleg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63685724"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63685724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:26:12 -0700
X-CSE-ConnectionGUID: 7ggPlNC0QPuBT6/eV3tbqw==
X-CSE-MsgGUID: rv/XZENOQDa/xBapAyzPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185390340"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:26:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 06:26:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 06:26:11 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 06:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXL7t+7af3NYwLtQZPtZwzzHtJAhYCu9IUOimslwulHvtZiuUdoZzhSfZwPYcL0PPQd5wz3YAYHz72OT/lN9B8tc2Wl7z+XPIQUiHmJBhS+n4oeJml3AqtL6irvrCiDr0axYzS68nBRMyB2HqpVE+w5pPN7exuBkYBHpBFWFgmXI9hsiE/j7mKzLyU5KFk5dEEIK5wQ6pcriL8/4RC5rhL5b6sxruIm5oCTeJB6jcji04l0D5cFpgPj0JEj6DRKvlZyNo4DUeM+Rz4tzOps2RrJlcL3ruN5Lrpl5YRgXQPKyKH0ge0sbQ4mVof0N5ypHpBVjiANVOHPoQNHTMfHMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhMA+0SrSV1nAU2VEjQZGdogOfyGSYGJLFtQpXtfPBs=;
 b=RFh8KR7f1nXHJfy/SpYz3iwO4WseLuBXxhiw/A+Zkn7CjqPErLMtMXDRkU1ZMRr6aenm8KtXkPlgaO8vZnkvjFWW4bBhnOO6+dIU1fLD8BXMEM0NyrUa1pphwV2PsOK/UHvyG6pZACpBVatA10R89brbXlruXYqcACcx7iZELNPrFp0K/l0wfYcmtxsYK7GvXY3YQCCfONv9GVy7Eucr+Pv5tu95PEt0y/YJzkfRL9dWmfol1jNWJuEhcVqRyoa3ejBieV8gF1qJfeDXPFKnUi8vjIbw64MC8++Y+P4B78vGPkiGs6GfmmWznMa3HdUQ73Qr/iNjYtQDFyGq0ogKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 13:26:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:26:05 +0000
Date: Mon, 27 Oct 2025 08:26:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <dkdu4cjrsavnqrt2p2idxa34ujcfpglovnx5fwgd7fjb4d5zos@lwbh7xv6mhrz>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
 <aP9ckwuSMtXlzSpd@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aP9ckwuSMtXlzSpd@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 2275770b-64bf-4a5a-5a38-08de155c6110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Guz5ji7vZ7blbs596MNB7BlXswSiYddvmFnXb6sv2Rl6WVEcVXrgI0wCT4gv?=
 =?us-ascii?Q?Q76jzfmQf1wUIDsUh2G6W605hQ4h+sotSaBykyO1n+rtG1MlzdWYLInCv7Zb?=
 =?us-ascii?Q?jlkf26ERs2rkgP5Xc7hoOQ7nmOCA8TirV0ZRW229XNFhNVWr1IMeJTZwlPyr?=
 =?us-ascii?Q?zrV1hcMJMDUqXs7wO0oMQM/mmrAmd8VsY2eACD++XeD7hrIVrRxEDGeGapQD?=
 =?us-ascii?Q?kkdgRdrCY41yCup3MJ2akiLEqB9QoU+C6XTnLUkhvQrUqs4pBxZPISQURXn3?=
 =?us-ascii?Q?9156I5nP+iSZurUw0pDNm27L9MYec3rV6E3ffaBIuZ0OUx+60UepvvRxpW8p?=
 =?us-ascii?Q?6KFbLLuEdymqRRgTip2Cjjy3cqXjnrP0Wxx1dMlb4C0GP0ET5/0kLynaBjIo?=
 =?us-ascii?Q?1CqHIiZkrcZueLR/oe0bNVrT6Ynft0b+8W5z52IyArRxpYNv9Zvm9AkkXE6y?=
 =?us-ascii?Q?ki9BCxBU5P7NJ9fVEZY1MOzB60N5SuAnpLEE3D1xq0mJJozcc6jLbXDdYA0k?=
 =?us-ascii?Q?Np2xPS3Ew3iYXIoNYNmSqIR49dro1TA4VyOPpqdMdwSrk11TsP2LWvCC/ofK?=
 =?us-ascii?Q?ewtTGayeYTOg9QRF1wPV0/U0KT0nu6o8EJBgL1ZIdiD1TgaNlMq5zfQeRRzb?=
 =?us-ascii?Q?ZiKSNvrMVU7bQSk5xfWmSCkgBGUW78caX8bXLjO3BUpVlS2pN+r+pcVGtB96?=
 =?us-ascii?Q?WikdXmOnk4dgwXNB6/K5C1PkW1jv3FImnoKCGn5ekeIOx4Rsw9IdC5BF8DD6?=
 =?us-ascii?Q?c7n0cYm0qzMUlMVB53sYGy9PQOSv/f6od8xkyphp9+HIOmSIsxCpFlM4ucEA?=
 =?us-ascii?Q?kIFPWCQvmB5bhRGT8TJVh4VtSd73k1kg4KNaccOOg2Jt4VxVax8zJnc/C1a+?=
 =?us-ascii?Q?fg9PGohtJuMnXjevSdgerLqD8y+mwtLx8+3bkxKlC252BNAsNMdY8WaPHjWN?=
 =?us-ascii?Q?E90dwAEy1wkYrluMMmGBwvF1hlUVwHarQkkQQLahJSNzXA1OoEGXNiTQPIeK?=
 =?us-ascii?Q?fQaWtT/8WjfwJu1MOdNTMdS4EDipa0FjTp1ZyKr35VNhr6gZ/hTx2PpHUF/J?=
 =?us-ascii?Q?tZGojFWR0HBcSx4YNu9uZuoK4zv8sp6DAruP8F6E8FDc5W9+NUxyZ8owdgRs?=
 =?us-ascii?Q?SP7sXbvbkutBcyjrQikUNOvLyAE1diEtEvqLEJXGDa1yWEczfo/pZZFsrvhX?=
 =?us-ascii?Q?ypTbVyaCJyjt+yCh4tDlfZVKk0pIKeYEemwz+a15Oe3hVlplLUoiLrN3Vm2W?=
 =?us-ascii?Q?uOxbCYYsvui0//iyiU52X3tnMzfxIRWeZ3V2JgWh4ktJHJ8JP3/V8xSU2Fhk?=
 =?us-ascii?Q?W/qta8Cu8wRk6CFNpdwZjGaeJYPbWrbbznxDWAdxiziIZ7xnlHrwJNO3midR?=
 =?us-ascii?Q?qra6rcxtE9OgKCBD5eB4RBg6w69vs1jajg6HW+dtp7kzm14W3Aa4wzsW10in?=
 =?us-ascii?Q?Yuu8FjQbhgudZqMG23iG+xyblid9SU7I41ld3mi+l811gbM6Mtz/OA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eIBWa8x6Nr02kcVvz+8lOfXt+kx6hi/eo/RBXvOPMRwWzVC87UpUvulIjznk?=
 =?us-ascii?Q?QNAVF54lcEI3K0lu7YC4mjoiFwSqH0B5lqdF56UzLtpfKR8lW/L8mQ8gXJJU?=
 =?us-ascii?Q?FrwufSRtgs8t0k8IkYcEVjYnMI7gQr0osD2SGOkha8Fd7nmg8hA0r4J2Sjy2?=
 =?us-ascii?Q?X9gT9RKQB0Xv6U4lJIjN+flck4VFPk21tLqVb+bfxE59HINaY8cMUgNHag0k?=
 =?us-ascii?Q?7y/A4nyG/SkXifoLSRFzn5eFrESHoUPtn1qiFQ3yLM9ASe+np+JsCy5oRphn?=
 =?us-ascii?Q?+4HtgdqSNnh+t1qT2GzawWzMVAFHK+roHD+UJZXJn93DKUWU5Hb+oBIIX33b?=
 =?us-ascii?Q?VX1gAHgSWc8wcqvwRmqUkLz0cPjYp3xLTC/rP2ulLM8k8LgY9WW7OpT8v1Gx?=
 =?us-ascii?Q?mabO42Iv4LrFVDC+Md1eSIWOUvlJvRucSyinMVIO71AL/6MCKDxjuep3aMg9?=
 =?us-ascii?Q?6CeMWacAh1sDmUwunAAnuYRzr27B0iYDZ9eB/n7uM/wm6/QPBSAmbm1Dr0LI?=
 =?us-ascii?Q?ofKsbYNhs4/knpPP/jXG/d/piYjoa8dVYYY6NSDG2ltPR/DmaMrmg8+mKTW8?=
 =?us-ascii?Q?hqwizaM7gnsMrC2knM4l16PwJjrL4WeFn6hKqWZg/CrxLs0X5vaQKSx/+mwp?=
 =?us-ascii?Q?3lRO1L0tFBeWs4TOst4YSa4I1B0sxY1VDzyKR8amIuJlmTzI9gqyKEwJqDw0?=
 =?us-ascii?Q?ohPLvwfIOqE8e7RkiykUu7RJGvAO6nWW7u6R4dntvui7NtddVgvY8/C7bF9i?=
 =?us-ascii?Q?KHLQLXfJaPcTf+TIKHZyNtm0OxwFtc5eYGn62rc9nTd8msRdhQaMMFS9tVJw?=
 =?us-ascii?Q?t2dJfa+ZItwXC4MHwhcbixA/twQTs5KYy5N8WS3mkGyRJH74WVGs2Gasehjj?=
 =?us-ascii?Q?7WQm8XZI/IAkCcGdjD+OLLdNQeyD9gpGiFziRAKahxSNqijFlvaQ8ym/0pOv?=
 =?us-ascii?Q?Tg/tJlnxv0bNSQlW5n4cTug24AV6K7rQeevzNKLhJ/ewesXi4UVDJI5Nnhss?=
 =?us-ascii?Q?QmG4N/zGEvatcq/st1lxOwLN/bUd/XphSsGPSZkfNjNLu9y9b3pxJpdlIt+r?=
 =?us-ascii?Q?9NCUti1G5/jKyKsUQFnVq7VJUU0aeFXZL6rJGq31ie/wyc+LmAc+q8Xv9YsZ?=
 =?us-ascii?Q?VBlmN8qtXs43fTQKh4qKbxVRrw+vRe0i7Soep3JtLD0KieucUhgSPV9QKZBP?=
 =?us-ascii?Q?Vk2hAq5/pz75WEr+VaPMN0ZbQAz4Y8Mj7zJLaJF2vfoJhqYnqsJIiDSuvkVi?=
 =?us-ascii?Q?JcLP+iAyEOSiRUMkD3DwRPCwHiGPjk7pIn7hvTX4IvzWBAzRZqSqqNHpslLE?=
 =?us-ascii?Q?7rDH6bNT7UJzuSXnownaMsvLVQ5vNnYtbraPlMzi/NaZsm0v9ldEsBtIDo8K?=
 =?us-ascii?Q?YEXKYPeTtA4EM6F8GNmsWZriONYYW7Zq0EKW/xnv253npbqxQL723zk5sFux?=
 =?us-ascii?Q?G2byNvlG3ioV2m14js5Gw4u5m5lb+pDbcKwRdWTaDKKOf6KVpVlJfoYkSyej?=
 =?us-ascii?Q?9xxiLU5JXtYM7hldQLO32rBhSCXiUTtWpyz7zLfhtED50/OPJz+aYZvZ79JU?=
 =?us-ascii?Q?j/5/e0lQwsbWIfuUPMdmRXC8HAZ2owjuefZ16Xf73Ts0XTumGxW+bn5O3kza?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2275770b-64bf-4a5a-5a38-08de155c6110
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:26:04.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9yZmQx56CQXxE/gyudYZqtR7HRk/8KGjK/FcZppTar3DXxA27W4e6UtuUtjerRajiIghslPEHFN2zuQMvKlo4gbVqb+Y3icghEyt2FBN7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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

On Mon, Oct 27, 2025 at 12:50:43PM +0100, Raag Jadav wrote:
>On Sun, Oct 26, 2025 at 10:57:20PM -0700, Lucas De Marchi wrote:
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
>Thanks for looking into this, but following the recent developments on [2]
>I'm beginning to have my doubts about this.
>
>I don't have any strong opinions but we can probably hold on to this one
>until we reach some conclusion on the matter.
>
>[2] https://lore.kernel.org/intel-xe/20251014053257.3417575-2-riana.tauro@intel.com/

what's the relation between that patch and this one? If it's about
multiple values in a single attribute, then they are not really at the
same level:

Compare this:
	pl1
	pl4

To that:
	Capability Info: 0x138320 - 0x2001ae06
	Postcode Info: 0x138324 - 0x0
	Overflow Info: 0x138328 - 0x0
	Auxiliary Info 0: 0x13832c - 0x0

And from Documentation/filesystems/sysfs.rst:

	Attributes should be ASCII text files, preferably with only one value
	per file. It is noted that it may not be efficient to contain only one
	value per file, so it is socially acceptable to express an array of
	values of the same type.

	Mixing types, expressing multiple lines of data, and doing fancy
	formatting of data is heavily frowned upon. Doing these things may get
	you publicly humiliated and your code rewritten without notice.

I'd say the array of "reasons" in this patch clearly matches the first
paragraph: it's the same type, not fancy formatting and has a reason to
exist: TOCTOU mentioned in the docs and commit message). Another thing
that I consider important: not expose the raw number to userspace so it
doesn't have to decode the bitmapp per platform in userspace (the
platform abstraction belongs in the kernel) and is easy to maintain for
new platforms (hence the walk over the attribute_group).

The capability stuff on the other patch is much closer to the second
paragraph.

Lucas De Marchi
