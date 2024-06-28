Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA468C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B596810E0BB;
	Fri, 28 Jun 2024 20:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIAD5D/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFD710E0A8
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719608335; x=1751144335;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dWPphrBARIQqVMZHKWCUVhjWRNROn2H6l0kLg+23JYo=;
 b=ZIAD5D/krPoM9eI6QxSgrMQGE/XJJYW6YroZjOnos/ujEH+kL8gJFv48
 SOgz5mDJrkpVfIBoTMgKC0kRol43nJJGJApvdUTPYt84LxHc6X4fgBENp
 fGHvC6L0pRBrB8KxsKtNz2LRoHZN9J4HpJ+MRK6LRWmyRaYrVftJ2q0SA
 YIg+AJesECaQqzB8T9T5Oap6/Q/PT5KI/lvN54Ib7S2TEKHUj5XiNiLaY
 c7A4XHruTiN3GGe7TuOKmEQiW96bzzdH6n9VzpAkNmacJxBpfSr2K3y2k
 Ck2GO8/lglBcr9ZvgE3v9wuRreDRXOuBpwqV/6nn4UEvp/IumWO6Iax5v Q==;
X-CSE-ConnectionGUID: HS6WRX6lTVW/33xyXASAnQ==
X-CSE-MsgGUID: 7b/bSBXWR8+Q2hNm6KbuzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="12308137"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="12308137"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:58:54 -0700
X-CSE-ConnectionGUID: w1zKDfHeRiqSKBA8aCqUpA==
X-CSE-MsgGUID: kCQ3VGk0RhSVWgliBRVigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="76037281"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 13:58:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:58:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:58:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 13:58:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 13:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqwuxQerDNwV9v2fd8C8chBDcHriBCpSasBZb6KuJEYcwHWo3ckme1HtOMNLAqOk+VeHvUBzu7FuDbTneN2fxBu5p+IpvJSV6B/fsgfs7u+XU/6kwJDufY2+JjghCBrZ7duOitgYF1Y+wFjKzx9GgNGPSrJEDOVssgwMyUl154/CKVliKiv2TEYI1gnoTIQDkKIA4oGVQfQEfHEZjiJqFBvZF2FuFgPhW5VQvybeZVVJwlShZCjp+o2yaiKWwJ2m12a7pYojokJuWBNo2A9ADu+ppq/UhO0TRyOKZ6t+4fgQNIo6H2tl09B/PeaQCr+nSjwirfObLzWDc7ZrjUHJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2loMu9p1ybqnUe3W4ET800FMwRQfuJcB7QN52DHJ0M=;
 b=DHi9vUieEdlxcbSD9zmsjR2CEy64UF3krqUvcZoYVeIrrREeFJOSgWlkC25MKnt5h0Ux+PTW58EUG6DSuj3uwe8M/WdhEuhdMcdqS4hQpvC/ntaqrC1F280zKV4u4HlsZbKbxYtC7zXhOyJl7XW4rAV34J+uJS13iRFxqQyR12bJTQUemH7d8KqvNyU1aRPTyrxECyR/mP1lkbAL/fsSPYoMGWUSbXTNGrVx8HmcmmQ37kiwpGMxdmTNKwZ11PFZEc8I2VQhgYAV3nwrs04AAwn3apse2VWbPyRdR4i025alcWgm9u/jzQvcWJQPp54yaVBEqGT9QPG/ZtVSf52wQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 20:58:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 20:58:47 +0000
Date: Fri, 28 Jun 2024 15:58:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] HAX: Try SR-IOV on ADLP/ATSM
Message-ID: <tnfd4uxownbmvetljuqvc3lipnpotramxiuqktxipke5hpdfop@xxk4pdlgzcy6>
References: <20240624120203.1169-1-michal.wajdeczko@intel.com>
 <Zn8GQZo5Qh8oHvIn@intel.com>
 <61ccf2a7-290e-4eec-86eb-bada852e1e6d@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <61ccf2a7-290e-4eec-86eb-bada852e1e6d@intel.com>
X-ClientProxiedBy: MW4PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:303:86::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7aa8b3-9f8d-4a43-a563-08dc97b51a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C948PgTLpeiJZiIoIYV6/i4wj/Tk60UwvHArUc30QXp3D+/MxpeT/KSEUO8k?=
 =?us-ascii?Q?pjEfS3nj94DVDTEhSHA63hpZlyZDQ9zsiRULi2bPt+rnkLOLwfej4vi/fqjz?=
 =?us-ascii?Q?Td4s9aHwnjz+trc9Ky0a3LuY12u1CJNUH8sRXvkt7OoIgzySeoszYB+0KAro?=
 =?us-ascii?Q?MwAG2NJfN9lvt8vmxRwcW73s9X/Y8TxmXLP2p0OY/I+g1b3nEz/ehXTeQ6KA?=
 =?us-ascii?Q?BY6l+VSUUxZ8u5nh89Aeve0JIczoIlATflAqXQeYJW5pL1N1G7uaDJgpDpjF?=
 =?us-ascii?Q?JkenNXTUlOgDcDQ+UtKwX7Tbj1EJawSL/4Ufynwt/LeSNEC2CLy/Tm2Qrejn?=
 =?us-ascii?Q?S5b6HYx5tWWKPKOyEVZbVxBrULM8Fs0pcUzAmAFgPdFhB4C04Fxl/s3KHhdS?=
 =?us-ascii?Q?GZzggMqLP5prQlLkHSFhzFermC6UThKBqdtP2OTuYNG2t2JN0ruG9TEjaHEV?=
 =?us-ascii?Q?BX2LIcHBtVjWfqJ4FTFSyQoofT1OSo9MR7EYlDk9FGaTczE3HocLyTt1xUQO?=
 =?us-ascii?Q?LR2HTKah17qZEyH4xTUPhyBDj90gE2tD9UI2nRDWq+6qlyzfJWlggXteQz7s?=
 =?us-ascii?Q?SazuxQ+e0fKgGHVh+mogm8r4Scu+zB4rCvbuU0Dmi280frXgc1N93H6hnMNB?=
 =?us-ascii?Q?YhQEfi63yOp31qX8PHsyDU13GuWVBRuQx9wnTzVIiTezWS4Y/pb5d1GfjXXq?=
 =?us-ascii?Q?uJf11NtQZr6urNNHG8xm/luGXHsVO2zpe2umcDmKUJ6pGgJMR879HvQrFCGc?=
 =?us-ascii?Q?nXoTaJJdLRuKMrWQd0bNhxGl/NtbmMHmywXeYfiWZ3w5UyOKeGoLXjJ3qm8m?=
 =?us-ascii?Q?JIrcjGIfColf7bC6zXr6Vx2rEJrwzFISBLrsEz1lOAzDMWLFtKahv8uaHpV8?=
 =?us-ascii?Q?upTqNILQd4NifRQAiUdAyXdVN+fX1iRfaC1dQKOa15CyPjhUckhwNiRSq1Ly?=
 =?us-ascii?Q?F2c1fb5TKKBYU/2qXhOYEZ+wqiZnO0y+GMgBLZBjHxpdpNVvlrJZmhBYcTj8?=
 =?us-ascii?Q?VLOl7CeoVJQjMEMm/2z2MJnbcR6qldf3lOpbKwjNIEsQBGOSZ8YRGrDjmSbS?=
 =?us-ascii?Q?8EPcOU7CTdVmIjEgoiQNAodv2Dkq/h2rmPFNVrNZELlhS5MorFURTSzJtgqR?=
 =?us-ascii?Q?V4EyO2dUcEtUUoo6zFfO9fwPyNE5H34qS5XATB0VD8yQZs9ON3qU2Hn/oEbm?=
 =?us-ascii?Q?gGU61N0C2usHKcoDr/Ug69w0JL/UfLZaSEyFS2I2p6K++h0Sc28o42AOXc23?=
 =?us-ascii?Q?QgyaRUE6eQlhkdmZXMIZSLlsqKUtg3+FHS2gzjGcru1BcxizDVJZj97dDnuW?=
 =?us-ascii?Q?JVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?joJU/RLW9C2qCxaO+p8AmB+vhm6JWgJqqLOA6lRfWJsxFgNXsBjCoqn6kUU/?=
 =?us-ascii?Q?Lie0mRKhc3j7yDUuvee9yPVoIqFAWm3q7e8ysPf8Npxlma9k5lS9pmkck/6n?=
 =?us-ascii?Q?P9XvHiPTX8Xh3QGrYIU2iavEeR+0oMweSzPRJdgJP/73nxEsLqHhRu3RjfcY?=
 =?us-ascii?Q?gtjsyTzNopFeBGytrb0o0lVbl5G6/ScBp5/eiuo51Fu9VMqK7JCh26fyQMBJ?=
 =?us-ascii?Q?HEOr8GfBUNUPRIy3cktR8hEXJG2NiS6jTk2N+BjBjHdfg1BgqtoSuo1Htgzm?=
 =?us-ascii?Q?b1lpQ/yRJ6CVoIB86HJgR3LLxEhAiG5D5nKMElDMKxHlYXsC4KGEJDrCvZMj?=
 =?us-ascii?Q?ZMZI3ywxqdxKZBVQHAvphxFs1z51eZah17jWZ7WId6FgMJRyNnonE6q2Cbyz?=
 =?us-ascii?Q?RDc7XmH188RY9IayMLmDjKhqTBKdK+KHa+J79H1pei18Gx6aKbsAv/eORvrr?=
 =?us-ascii?Q?Th6KVNw2j7JyPq17jTEOifGexbDTRkg/lFhb8++riIgmBjx/lu/+3cfZEH02?=
 =?us-ascii?Q?2S2dts8QZ5i6pCOm+KrIYaC9n4m9RFtQAD4uVfsp0RlV0JVFHCUfd1beyC4e?=
 =?us-ascii?Q?Wvijm0ePlYg6PaeeVKPbT2FeaihGE+0IzKqYqFAYF+erySPD1X88X73Dz5hl?=
 =?us-ascii?Q?FBzLesTwhdRHAIXNnTKNLUDeI+GmPSP0/49xh8T+z9oDleXO4GExAYj0MbTM?=
 =?us-ascii?Q?z91LjR/vULQSIb/5U8NKKUZmvwTw7fPvZDPzwSG/Az0ufzBBPk0hkCLPMVsw?=
 =?us-ascii?Q?qBqfrs4/f8EkXEuxiOxbHiniukPFNScFJWP57aD917vCPLMNCmuUW4VBiewy?=
 =?us-ascii?Q?8ZVooSvO3+l8kvgnbiwf7BI8u1KNFseZtbk5iTUBVJlxPA6aDb9E8YMgBpQf?=
 =?us-ascii?Q?dIeLOdXtLGoY66oOJzLhSi3Sddmqox0dxcGm9qRGc6rKbEUlvznfsx6BzQPC?=
 =?us-ascii?Q?AtGWQuGL2VVF05yiWidnLrTEhcP/El29+5SHtIieszAZV1JhszQQFvcw6LUu?=
 =?us-ascii?Q?EVv/lXpEQiUwJUqLjYszpQBv60BqthUBNe2XSCB11YoQ2rpabbLbnW2M2nRp?=
 =?us-ascii?Q?pFJiOGSNxGB4+J/EIwkqcWeMp7DuMxx8ucEh70kVcrfjPxS1g+3PRBY7wJIJ?=
 =?us-ascii?Q?kdgT8f5V9J+kMaUJ0pM7SnMbpgUrOnSndHAicXhlJsz17y1aUCeBf6OQhoR9?=
 =?us-ascii?Q?p6RtvQtLaH4YP2L7ubg0PMPNXr8tfUX5N5rpLWHZP2V5/+cVpZA2ZF0Dl87J?=
 =?us-ascii?Q?RoX+Kgx2Xcf1a5sbyzZo4zybLY8v5Z90mFaaqUg3uUTqIfv55txtD6C0UJ2G?=
 =?us-ascii?Q?/oZNSK0V+naNBVxSGAKh1lozg8y00Vkykh3jBAFXjN9DMxOUJnCmSsf5dDN8?=
 =?us-ascii?Q?JwU+7yLYwjLTVgsINjib8EE5/O/3uQUAsPtfHXdYOybnwYwnkWk73zhKOmSn?=
 =?us-ascii?Q?rz7mvWiqvjNzaOHpBouSREVFlNkVsVjRiQiGYOr520jkp2bFyQ22WojVVDlK?=
 =?us-ascii?Q?aRsalDPRgOvdTT1bE5D90NDSsCx3XCab8/7P7di01Ny3HM95lePaEEJl6H+a?=
 =?us-ascii?Q?YkT6P8+7GVcixYRUR5sp+sFdMf4Uxud6Z+5/xQhoi52/0Nhu+AdEBEOX6Ong?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7aa8b3-9f8d-4a43-a563-08dc97b51a8c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 20:58:47.1405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYoLXHhW9Y7lB0EP3zYdD2IyL/djUBE8TtwhnJo32DzjAer8EfS7caUhg0pLD+GBRXuvUHLwZSLSXE1Kxq5vLl37KhOCiB458F27yvKOMqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7320
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

On Fri, Jun 28, 2024 at 10:22:07PM GMT, Michal Wajdeczko wrote:
>
>
>On 28.06.2024 20:51, Rodrigo Vivi wrote:
>> On Mon, Jun 24, 2024 at 02:02:03PM +0200, Michal Wajdeczko wrote:
>>> This is for CI only. DO NOT REVIEW. DO NOT MERGE.
>>
>> how are these tests looking like at this moment?
>
>IMO quite good
`
can you list all the tests are covering the sriov enabling?

Also it'd be good to have an "admin guide" to use it.

>
>recent run [1] just uncovered two existing issues that actually are not
>related to the Xe SR-IOV code:
>
>first problem [2]:
>
>Starting dynamic subtest: vf-2
>(sriov_basic:1395) igt_device-WARNING: Couldn't find PCI device
>0000:00:02:02
>
>was due to a test bug, attempt to fix that is under review [3]
>
>
>second problem [4]:
>
><7> [259.552619] BUG: MAX_LOCKDEP_KEYS too low!
><7> [259.552626] turning off the locking correctness validator.
>
>was reproduced on driver running in non-SRIOV mode (native), not sure
>whether public bug was created for it, though
>
>
>[1]
>https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html?testfilter=iov
>
>[2]
>https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@sriov_basic@bind-unbind-vf.html
>
>[3] https://patchwork.freedesktop.org/series/135476/
>
>[4]
>https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-1/igt@sriov_basic@enable-vfs-autoprobe-on.html#dmesg-warnings1677
>
>
>> I'm wondering if it is already time to add this patch to topic/xe-for-CI
>
>it would be great, as this patch allows running few basic SR-IOV tests
>(including VF driver probe) on the existing BAT/FULL CI runs, so with
>minimal effort we will be able to catch regressions/breaks that impacts
>the VF driver.
>
>note that being a PF driver by default shouldn't impact any existing
>results or functionality, as any resources needed for VFs are reserved
>only when VFs are enable during the SR-IOV tests.
>
>additional resources used by the PF until VF are enabled are negligible
>
>>
>> Thomas? Lucas? thoughts?


//  Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

on merging to topic/xe-for-CI branch.

thanks
Lucas De Marchi
