Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C303606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kCgAslCf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A65112246;
	Thu, 29 Oct 2026 12:12:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B7112251
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793275973; x=1824811973;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KP85rxmAswv0zXaR70qTS3kN7RmaiUvYuK8bodrp9UI=;
 b=kCgAslCfVSfWKDTvQ+ZZkcCXRlD0C5xFsCHCZgbZMRs5LMYVf2RJseV2
 7GFV6G+k0KBEphOfzp7oE/IjeOT/BTtxsVuf7Bye/yqW0YyGNPUS7avBX
 vao6hopjOXPmRp01E5Pa3w6GsnSiqqCV2p71cY79C74/IzPxTNEA5g3Y0
 HUpbQuswjMFpxLHX2A72/NhqiHnHmMYN72MthwdnLTHuziMEhM8rKyzb+
 9ZIlbmrH3GBIfX2cVzKgOHnt85M241v2Y4/rUFTxyf0gtMyzfl73AhHZr
 NbJu8EXYxpeW5DRUE0YCt0lDS2AtPK3siogBh3CAl64G3VYrIVu6I2stU w==;
X-CSE-ConnectionGUID: mz50v4N0RPqRQZCjW1C/qQ==
X-CSE-MsgGUID: D45GgEaWQg2/0YLFcmopiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2020994"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2020994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:12:49 -0700
X-CSE-ConnectionGUID: x8qRZk2AQgCk//CCubP9Mw==
X-CSE-MsgGUID: mWpPEmFoQnm31GNJNoa20Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5464899"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:12:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 05:12:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 05:12:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 05:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2sMOWfTNfVXz3M3ikhyeV2XExCLulBHJShjpIj7CfXQgDcCaysDyAyS5BUadMOml/LFUFoHM0y5IMi4lFMExFIgNHRftN5Apu4CXgl+UF/1nkcTtk6WBTapOT/OSG6XLeWLVIAssIj01glwHzBITpbzcN2Hm3srrxFYag3Ng1UculdRfXocWUW1Iqr1ssXkZhaPNpl1poh2xCav+j37YTXdcJtODgvyAYo9kZikQ0W7yT34mLtdQuK+tb2tcVHCbktjcRRluDpTueq3YjgR6EkdblXAHAbpbt8m/kXLIng9CIpm7S6p98bwF5n0kSNJWM8MWd3hvFdQ/pecwIqriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvAx5YA/ZrBnMgCEdlU7KqsmIfhJMNnbzxpUQ3piflc=;
 b=nckTB3SDAsY1KYDM4gydkSFm84fNE8UuqrrYMy3iKNHhcUmeCWpqdzU2fj13R4QSk+dShnXpmTrMACAzb4+y7EFk06MxOA7g89654pjkz61zFG7Xm6KcElUejHet732UXLD88nDzTwf07mZ9Nnrc7nVIM/X3KxvhLTYP3U9NpOsbfX1rzig9KPH9iuOso0a2aAMVutf9+GxSly+rPiO9Oc/EVqX8XAnXoXyPhQ3rLl8vhph+h/NhcEamGwefkB5uLXn9+iNYVpIiu3EMwDlORv4wGOMEcc0GD4fpRQoy5wdXQWjwcZ/35CwHrlE24iaDDlT7gRf43iDPJlBiKUyu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 12:12:39 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 12:12:38 +0000
Date: Thu, 29 Oct 2026 13:12:33 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v7 5/5] drm/xe/ggtt: Add KUnit tests for usable and
 shareable pools
Message-ID: <20261029121233.pkbpd6sbbjwdemh6@intel.com>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
 <20261021085716.709503-6-piotr.piorkowski@intel.com>
 <af0830362243e3f3d7289e853b8d72856faf7419@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af0830362243e3f3d7289e853b8d72856faf7419@intel.com>
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 996eadb7-0374-4596-646b-08df35b5ec77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|4143699003|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: +vktTiFqG1/v8JaEVzTkkGbsC4SNvnSrgJEnLl8P10R0sgMWh94hE47yF86McfftXyvMkZ0nYrNplWjeXIndkgXg96V/yMF1mQNG0UlHRkn7ZJusjJBSxdp+NpvBHAXqe7JRTzpe5RXlOdo5R8p470PAk6WS+0JT0vcSnXmzVndTIavJE3jCvduOuJRsSdEvL9KJPwpOnpAh/NZxfHa5SDoT9yVRoHrykPZ7gRc+Th7zzpCPaC44dQXr6BOKJzQt6C7VkPUfyRiux0qWZlw7Kdyuh/x0dKyH2fc3JjeEAStex2WxxmpQr+/Dru8SNNLRqcB3rModywLO7bWT3I1rpbErvdttIhnApuUMhXCU6YddnFU+oQXBj42lNZz7tk1xJRY33mXOrRa4yXFd0mnYwJ0lqJ8bJkkt8Dbg96zdOmTFOt7oTfR/ZA5WDMKAFuhseO68WtsDUsyGMVqopbKfPBCLtBJvegwMm4fKdWVQ28nCOHVvKEVJaebo1D81MoAjQ6FMtQ0N4bxbTnySBCy+tpmiNOyNH+9iLBLVOMcQKZXRZzzxFca+B/8vGaC7WtBM5ubNdLAlopp+gZVw5k9bpL0ZXKjgfvdcpTugDLVNbOiAro5445uateRjMjUg4Jd/SUuCcu2cMf7FrYLtEMkSXVdFbprqsqtwv2fRz2caOVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJDZFlNVnVmWm0xeStkeU1rNURDV0pkV3ZlMHZhY09UZ2VHakJYMDhLUEdm?=
 =?utf-8?B?blZ4NUw0N2pyS1VxelhVRXNydVQ5VlNIOFJWVXZpZVZ1aFNNMjdlZDNqOHRh?=
 =?utf-8?B?aUx1SlFXTE8yeS9VM3AwQk8xV1NPN1hndFFleTJ2cG1KYm9RajhkWm04Y3Nk?=
 =?utf-8?B?RGVxTk5wbXlML2RKSlVCQ0VvdytMTXFwSVpMcXVMWEVXeHZjekl0am55cCtm?=
 =?utf-8?B?ZDFmUlQ3ZGFPbll0aFJtNkJiQUdrcnBybG9wRnJyN3BYbjBwYzdXTnlIZUN1?=
 =?utf-8?B?T09wZ3ZQeGpEQUFHSGhxNjNwdlVZSU0xekRKZDRpTjk3b29raE1zNDZGYXJC?=
 =?utf-8?B?dmZVdjcrTFZSM3lpN3JhQXMxMitDZStvbDZxZDJYMElXZkllTWJyVkZESFJW?=
 =?utf-8?B?b1U2eHVYYzRFaktJT2gwYTNNSklUVmpDZFJBdTBsWjU4NHdhVHhDbldyUlRE?=
 =?utf-8?B?RTRwWEptcUVUeGZwYThUL1loWkhrZEp6NlZkVHVubXpmUEg2MVNhd0ErMmha?=
 =?utf-8?B?Zk1zZ1NqY1M3S3ZoS2Fob2Y3U2d2N3RQQ01lWFB4aDFCbFJSMmJDS3E0ZWky?=
 =?utf-8?B?Zm9naUQrZEVQdFZyQ2lwazAwSDRiMm9CZnZWZGJJYXhMSEovU05ZWDJJRmp6?=
 =?utf-8?B?cGU2WVpvaFlTYlpYUVBUVkpiMGRER0pTekxibTAwRCt5U3lRV2J5Wkp4a0Fk?=
 =?utf-8?B?QVNnU2Z4aVZmcytLeWRSMVpMSk13b2JxdWMwSGVBemlnMnlTN1dxUHpCQWta?=
 =?utf-8?B?VVY2aWdXL3VTeHVRY29nNzBvR1dzZkVIWnFDQmFGYzhmLzEzYWlITHg3YlhS?=
 =?utf-8?B?TlFlNGVkbDhJRUtoRmtRWldvWTJmVU1aSUFUNmJRV1FhamtOVVU4dno3TkRE?=
 =?utf-8?B?OTYrd0w5OUp0QWVDb3VzUitJdWx4Rkw3dzhNcmUwa0hVVHN6eERrYkdjQlds?=
 =?utf-8?B?a1VRQml0U3lRcUNkald5eHFjQmdMbE1EYjhBL3BrMDFqYk9zUDdyUXlwVExi?=
 =?utf-8?B?Y1lJa0dHQjd2MEoxaHplZXI3cFpUL2Vkc3kzVzRWMDRBWmVJMXJHdlpESm1l?=
 =?utf-8?B?c2N1UGZnNFpFdG84cS94cVJQYmZBOG5EV29IR05vaWRDNWpUKzFCWXJzc3lN?=
 =?utf-8?B?d3llYVlFUkI1bVhrTEVvNFFWVmdBNlM3T1llMCtaQjlYb1JQRmgxY3JrK1E2?=
 =?utf-8?B?Q1dLOEtXZzdJZEhFeXcvTU1LNUV3SjZmU1RyMk5tT3RxTFlWdkorTUVXTHFR?=
 =?utf-8?B?L0lrbXlXVEF4Skltc1o5TGcyOC9taC9PTVRWQkJtdE9ubkMxN0pWbkMxK3ps?=
 =?utf-8?B?U3lBTS9kSHMzd1lkYXFodUtpejlvcVZ5N2FOQkNUcDdSSWhUNXdGMEphR1N2?=
 =?utf-8?B?WEx6Y25qbm83M09UWk5yVU9weGJuak5OdUxiLzBZWWNXWDRlbEllV3BaaWJo?=
 =?utf-8?B?dVVCcDZVTkYxbGpVbzluUUhNeW5oZ1pHWUhCWXQ4alM0ZlBIeDZQSHZWc3pO?=
 =?utf-8?B?RUZzNmZxZ2d2SVpUMnRzcVY5TXVMc3M5RE9CVW1VNnErTjhYdS9nUTFLQnRG?=
 =?utf-8?B?WFdaekxnYVpZb0tFTm1JVzBrYkdPaHdNTk9zUjZqamRuTXpudUNucVVWNWRS?=
 =?utf-8?B?RC9odlRSWEdqTnl0WUxBSFNpZnFrOXp4QnNkRlFKNzV6d2N5T0Fyc3dvNnlu?=
 =?utf-8?B?dXArSCs0M2pxYWlYRlBZbTh0UWlVT2lGWUdNYmhRTVlHRHhtS3JEa0U2aFp2?=
 =?utf-8?B?S0t3NmpjL3Y0bDNnYnRSSVZZSjMzTVlxWk01eTlvR3JyYzg0TE10SHhCSU4x?=
 =?utf-8?B?aVdraWh4UG5qVVlXSWpla2hVZGNFZ2VxaUFYUGhhbmc2T0doS01PaXlqOUk2?=
 =?utf-8?B?SDY2ZFdDV2FhUXZiTnJtT0VlSzdycnFLQVNpNzFoVGdLODBWOUpSekR4TzJK?=
 =?utf-8?B?TEJJZ25Ca3JVbUlEcElpMVFrRmhGMzlYMDViNWtiUUNOSThiUUFRNkFmQ1NK?=
 =?utf-8?B?eGFMelFhQXdsS0V2aTVwR1dxcjFZVXVDcnZaM1E3NGhOelYxUFVsQm15cjNn?=
 =?utf-8?B?U1VzOUZnVzdZUnN6bTBlSmZQWFRxSzBpNU9iTmRrWWQ1bTNDV21Db1JleDdI?=
 =?utf-8?B?bUtJcEhaR3praTQ5d0FscXNQTnZtalhPVDhDd0taRjZNQ05iWU1nM2RqV3Vj?=
 =?utf-8?B?Rk84akFMWjllV0pwQktRUDAyNU5sbHE4TDVnRkZrUS9YMGJGZUhrelNhK2Jj?=
 =?utf-8?B?aWlOeVZFYlh4U1Vkd1ZPbnFrUDhkMXdQMERWaGY2NWw2Z3RqTnJ4NXM4UEM2?=
 =?utf-8?B?WW5WbVhnclUvY2RQSWZHZmg4LzFRNlB6VFg5cUthaFlyKzZDMFppVnV2ZjNQ?=
 =?utf-8?Q?4i9XZs0U1VwJtvrM=3D?=
X-Exchange-RoutingPolicyChecked: vdrocUxK/vRczfgfIpGB3hEwWQUtpwybLs/9nnkFfRfedK3fReW2djthzBt9o501fRBcQgbfVZQZ3h4LWzx3nKUwUhtKDY+RSFN99iK6iVNUgelLxso7jxtI+aUz8cN4VMxAyGr2++zguLb5InxVRNsOrzlNJivMscqTa6CEPQoCLeS1rinz1/4cY7iTsCmfjORGiyknvfzSHwxlKixQg2qTx6OuBHqEo+QRG99tKfxgPfUhX29ZKwCHNnY9hZ/TDBI6VhVZLt1c57Pb2Jc5cVTJYT8bgA4rTxMGY0P47ZzMOrjmZv5QD3lQXmUXmedbBmBlEQVMR8bOa9Qfr15IAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 996eadb7-0374-4596-646b-08df35b5ec77
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 12:12:38.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC0Lq5uytPwtP9WDlAhqUQXlPVlceaLee4IyGcKrM9UcfNnJnwmD8Bjpxw66czvARMiUg6yJnH30gPZquzcaPFcOXjEUiN+uwlU0A0ks6Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jani Nikula <jani.nikula@linux.intel.com> wrote on wto [2026-paź-27 18:31:53 +0200]:
> On Wed, 21 Oct 2026, Piórkowski, Piotr <piotr.piorkowski@intel.com> wrote:
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index b7e3d626e8cb8..3dd029bc76dfc 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
> >  {
> >  	return node->base.size;
> >  }
> > +
> > +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> > +#include "tests/xe_ggtt_kunit.c"
> > +#endif
> 
> Why IS_BUILTIN()?
> 
> It smells like a mistake.
> 
> 
> BR,
> Jani.
Hello Jani,

I simply used a pattern that had already been used earlier in the other files — to be honest,
I didn't give it any further thought.

List of files with #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
xe_lmtt.c
xe_guc_db_mgr.c
xe_guc_relay.c
xe_guc_id_mgr.c
xe_sriov_pf_service.c
xe_guc_buf.c
xe_gt_sriov_pf_config.c
xe_guc_klv_helpers.c
xe_sriov_packet.c
xe_log.c

If we have to use IS_ENABLED In that case, I guess we'll have to fix that
in the other places as well.

Thanks,
Piotr
> 
> 
> -- 
> Jani Nikula, Intel

-- 
