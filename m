Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42804C76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 14:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C92810F25D;
	Fri, 31 Mar 2023 14:34:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555BF10F26A
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680273296; x=1711809296;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZeLEcuPh7HotwVkQFx2EOQ+psSeucaFRSrV5K8cPJw8=;
 b=BDXHrHZzee0VLMitdTyCYoyBoGbImM42kQcPy+JOs6WyhCfQ0SmCu/y8
 5hdL+jpAjE6RZ+zqGvJ9eOqSt89sV5+gpk1Vl8SSQjEajLwhZgQOS1RbQ
 i5XcnG1IZkpXlI7mN1wL/U80cG99/7j2B0jB8zOh+8YDOmPbeGeoMNyVe
 ysIsFIcSp8u9tWv5405/9X+06rcX2fcp/0OLCzey7oIPgRkPQZhw20Kun
 qL7g9cqO+pzzxH4VyuDWkHx8TaoBK++lC54zasBIOE6Ny5gFcTkWH8Aoq
 267LkeoSRNgzjhysogjXEZepPn4gY1J/36MFJ3PrLrFweLB+bGiZ33LGk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340188797"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="340188797"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 07:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="1014847551"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="1014847551"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2023 07:34:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 07:34:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 07:34:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 07:34:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 07:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRI6XcxnmYGlDhDgVm854AjHFj3iEwAARQecdmfJQRFa7X1X57AXP2mVd3Rp4nyDBRzvtylo6eaP1aohnCho9b7HGCJFw5p13sl7k5P8xU5KkZdcmNxnSZPpdVMQMY4pKfI9sc5TFRUZ+PU1u6mc8vXAAOkg7rtPDu4rXPEs/zVdGLJoKbN0gWvvNT/8Gw0WM9Y2ixFuIBFypg4gEK6KhjWLcqhpHoqhlSbcvWBt6hDRg7yv9Nw4Pny5eRpRSOzyYlmjx7+ftI0zOTMF3ZkkBt2ONyZqMZHMM0m9t1NGZFVzdoqF6/1hhQPGyLUC/EZlfi+8xUbsHjaHZBrqLaIpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y7uqpx+iP3DPGNBh65ia/qvjZaE7IYvXbn3PeR0dq4=;
 b=RLhnERN6K+63Qrhuz8zQZznonHo8tRvSQAM7NVVfgeSx9s2vZtQB5al1ys7kpA4wmvm/8uP8/a5EqY7ih4aLZLGOTn91qNMUxSA6CUlyW1ad8ip0drUY5vdYvxosg5/1+cTLbTEF1ctdGZ7mr2Vs9iTvkb1tc9FIrWjm079gK8SzHsBhSpKHcAT2rxzszFfSBMMfi5M1D9ZwkxBJ6Z1cloYq8M5SjBTq58G30ydSNhokRfLSWrxyF4MBTpi6xHz1l9w3S/eeysMCS+Cp3xHkWBsU6VpRNUtu4qAL6+0w5PuCjPlZ+HaB6cwW9YYwdKeVteAQBF6otyaBWvrOtK7yNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Fri, 31 Mar
 2023 14:34:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 14:34:39 +0000
Date: Fri, 31 Mar 2023 08:34:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 61652f7b-cc78-4eb3-3181-08db31f50eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1XJOe9Emhnfo6PZc+hANmKeqsy5iq3jC/UrLJVILOkvePfhiu+EMj0sK4bPgkQKIv8YbUVxlw2vt79vLxVoqiCJBOUSiT+zXdcV74oAaaE/2yoBm5BxYcc+DXj7wZrrrWkQTEnGIOJBF4PwbTkHR7vYJS7eWMA25HPL/2Sg0H5YBCTEuUz2JG+XbkUCF5T+3EUq3bnjhaUyw5YSiaP9O673zOoXTIoIDwEoueTxF06FzZorKS+ZWwJNi23N+ZVQgKtIKDxtlPmVRNeI6cN04fGEB0YWVOCI61J5qgQL2lK+mEq/E9mSSHsswDlgTSFtGgkHFETGkMoKSSdwdivHj7iRKu2u5ts5dKgO7mQuiyFxjCyWt+cdOAdAB7vTZhm1NsLPNR30vJrTCnzHUPm9KI+f6iyuwtU1qKOSmdfJnhjkxnuM4ndG3BfG0jAon3GK43sI69rBlNz9tyT5OujWjl2SEy/1pecrTkO/PWOfJKtm5ZU9Qy76vQ/WcB0p3XkyeKSYhLFx6MLwv4D032vT87Sm/WU3DpHU59kEMJyjGujc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199021)(33716001)(8936002)(5660300002)(186003)(38100700002)(86362001)(6666004)(1076003)(107886003)(6512007)(6506007)(9686003)(26005)(6486002)(66556008)(66946007)(66476007)(41300700001)(82960400001)(478600001)(4326008)(316002)(6916009)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEpTcmtYaDRUaXNsVjV1RFlzdE5rSG1jalBEUzZxaS9PK0c1cnh4dXh0U2RE?=
 =?utf-8?B?aHh4QjBUaU5JQkJud0gzUUpPSlhrbGJFak9WYzlrYmdCUUQ0SGE5M1FDZ29V?=
 =?utf-8?B?MUF4QmVwRU9RdlpZNzBIVkpVc3NlVEwxQ3d4R2VSQVpmL2k4TzE1QUtJRWF3?=
 =?utf-8?B?R3pZaXFGTFpGRTVVYVhKd0NWMmtoc2hGZ0xyMkZwcGI2WDA1bXNwVGJYdDJt?=
 =?utf-8?B?K21lVlY1L2l2QXZRV2N5TnRVTDRSYzRmK0RCR0NibTNqaVdMcVRMSXlxTHcx?=
 =?utf-8?B?OERPRmp1RXZBZWIyWHlXSUxvYTl0b3ZDTFlUWHJHZ2EyeDRrY0FzL0VoUlMv?=
 =?utf-8?B?RXdQWXNUQ0FjeTI1dUxyenJWY3NTZmZrVzZyZkV6U3lrNmQrYnRNRndSZSs4?=
 =?utf-8?B?YUdSUHh0cmdvR3hpU0ZlZ0lvQlFuV085Rzg0bnV5NVFiTFlaVzFhWWJ3MlRr?=
 =?utf-8?B?Y2F2MFZ3UnQ0bHdTWlh0b3pQTkFla1czdG5HWmxwZnkwWFg2Zml6UnlkL3RM?=
 =?utf-8?B?Z3htOGxNdm82UVJPSjgzbG9CR3JPT3hReENmd2xsd0tCS2tjQ2FRSFJxMHVW?=
 =?utf-8?B?M0dySW1WV1NJOXI5OTc4cHJHVERZV3VMbzAreUdEdFlUemFpNmp4cDRjNllN?=
 =?utf-8?B?SlVsdy9Cc2JQb3Ezck9keEwrOGZma3gxMzZyb2RNQktQYkNjWFQvMnpoaGhP?=
 =?utf-8?B?UEtvYmlZWi9IQ3NwRDI2MWlYRktJTlpteUZmSDN1ajByRDlLbWhtNmFkd2w3?=
 =?utf-8?B?NmRlTWVrUExHTWhmT1BJZHdzVVBLcjBjSnhnNFBEYWZHSUFQZ21yWGVpR0pD?=
 =?utf-8?B?QWxNclFSeTNNOVBqN3dpU0ZVQzhhcUhSdEVPdlA4MEFyV2ZvbUVlcmVRTUFW?=
 =?utf-8?B?TTNLUllESWlzWVRrWmh4c2FFSVB2WWRRNHlWNFJXV1hOYU9hNndTdjg3UTBW?=
 =?utf-8?B?eEdram9xMGwxN2pPS2tObEhBZUhTWDhrRTJYaytoQXBqUnlCNFBVdkZYNFF1?=
 =?utf-8?B?SWJzZkM1bzNkdG9jM0ozVzcwdEdQK3VxL0hrUm0xVmVpa3ZMbnR4ZmtJZXVp?=
 =?utf-8?B?Qjd1aElUbUNrSWRXbVVnU1ozWDZ4cHE1eEZHMmJhWFczdzdlVEZ4cUtHZzhy?=
 =?utf-8?B?anhUK2xwQWJoSzJTNlBZUVdqTXBvdk4rZEx3cHJjNERrSjJDMUtQdTRjckVa?=
 =?utf-8?B?elYzMFlrUUpweUJKaXdwWE1KanFKeDJWSzBCeENpeWVtaFNmaEhsWFE5RUxl?=
 =?utf-8?B?N21GR2dxRGl3WWF1Vkg5UEsxaDdGYTUzZi91UFJWQUhSaFdicHUrRk1ram53?=
 =?utf-8?B?OTZNdmhUeDdqUjRjOEE3UWdjcS83Tnltckh3MllQTUo2M2drVk02UkUxbGpM?=
 =?utf-8?B?U3JzUHR2ZFE2NzBURUlqZSt4TkpMZERSYUxLUTE0Vmdvc1piUW5MTjFOdDV3?=
 =?utf-8?B?aTUvZnBlY0ZPcTBYQ0ttc1U3WXU2d2R2U3dRNTNBMjFySzZoeVR6M1J0TkQ5?=
 =?utf-8?B?ci9EY3ZuSEh6a245WStJM09ZNkhkUS83L01RVkREOHRwdVlPcDZZeWZsa2hJ?=
 =?utf-8?B?eDk5ZVpHcUFlWHdKRzhRRmh4aW1oRmlzbTlKRFd1SGtYM1d5MnU5alA0VTNt?=
 =?utf-8?B?RlA3K3pzZHBJdkpXVXZyRTZXNCtYRFRwaUtySnRKZGFuSzZpN09oTk9xdS9E?=
 =?utf-8?B?TWRUOWllRzVXUDdPeDNtdklwSkNxZFc3d1hDMHpFR3EyYU1RUitpUFBvV0FO?=
 =?utf-8?B?NTN4NVN6T0haUjdYWFVxN2FKbGgrRjE2NURXUExadFJ1ZUlxdWxhU0t6SHp3?=
 =?utf-8?B?THRMbG16cG1RbTR3MGdEbVdCME56b2FjdFcrcHBUeWpSZ2h4ODNSTVhqNnZw?=
 =?utf-8?B?MUNmby90djdiQWE3dHpKWnpiZzRJNDBmUlhjaDQzKzJablNrRmlQSjBQNGVG?=
 =?utf-8?B?WjlqcjVEQy9WNGxRcW5ocXFCWGt1Z0xtc1NLVTQ5RE44dWpBaGt3cFU0em9x?=
 =?utf-8?B?bjRDdktQZ3A3eHJGK1AxdmhlSVYxZnZDMDlWbjMyREhYcTd0Ritjbm1xdlBE?=
 =?utf-8?B?SGVmVEJxT0lHT05QeWlXNURlQU5ZNTdLMWpoTmpsTE9xRWZFWXR3OXpCYk9o?=
 =?utf-8?B?ZVZCVm9wN1JVN2ZYVllXcFRmWFdsTDZyN21MKzJFbk1Yc3V0VW1vTHhGcVBt?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61652f7b-cc78-4eb3-3181-08db31f50eb6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 14:34:39.5655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5axUnjSbjg9XQAVrn7KXQhwmDorfDWrMikhMc57Z77E6f+5HK+ksPqmHeukNabuplAXIH/n6oXXm91bIokPEZLuGe0n7EfNzPJ52Y2fJypc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>> +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> new file mode 100644
>> index 000000000000..4a12aad3f759
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>
>There's no need to have this as a separate file.
>We can move the contents of tests/xe_rtp.c into tests/xe_rtp_test.c and
>include tests/xe_rtp_test.c directly in xe_rtp.c

this is not how the tests are currently structured.

xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
extension of the that file, exporting whatever entrypoint is needed
for the real test". They are then part of the xe.ko module.

tests/xe_rtp_test.c is the one in the separate test module, and contains
the integration with kunit.

For some of the tests, when they don't export the required interface,
this unfortunately means writing most of the test inside tests/xe_rtp.c,
which ends up bloating xe.ko.  This is not true for all, however. See
the xe_wa tests where we don't even have tests/xe_wa.c.

Lucas De Marchi
