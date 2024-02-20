Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9690EC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 14:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523EC10E49A;
	Tue, 20 Feb 2024 14:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvH9IMu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF82A10E49A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708440633; x=1739976633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gLldzQmWcoMa1A/ex892IT8PCRge+zZBrDP2znV0oSw=;
 b=WvH9IMu9VokPILCdhVbClijGqzwDIm2EKTFqUDbJK8DCf5bD9LxmIqJx
 RZfC+utPZ1uVgGDd92yB9XFpcAh57uLQgWWV7Hp5JI+Ze1e3BSBdWl/u+
 h6FjhtEz77uWjA9xfkXZ/nJx4ZSpl+WDgeA9ZQ5/69PCalfQ9JMCk6JVy
 E9o5QDra+5o0CcE2K5jDtApLZamj+c6mSeFzem4bv9rKdf/jRLf8/5A0N
 Yj3cJiuK4w9lzQe4YZJvd9D8ipNBD4Gjad4YwiMD8buqPB+I6GyWEsb/Z
 UpGVQmBM9Lsuqh1/syVCecCRK8Q9oVuruCo2nJ/i+PSLrSV4C0c61/Fgh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20080184"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="20080184"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4699832"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 06:50:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 06:50:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 06:50:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 06:50:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 06:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3MhzG/bVJ/yeSLgEFikM1uxW6E7s8pChPw7dDeYNSBpGkWGkp3/HYBD1xqwac/z+nOKa6rsyexM9qKIzts3xIeL+gXN2gDycrMJfGERKMTzdDs9LT0C0Jf8cyG3i+V9lgp4fUKr3CCmxNNMIoX/xtKvZ17hLmbt6iUKWwNkJHkhpAtnQu91xiMsh/QyfX3PYg7eF2zeVcg0lUjZwZtzzRj8y3czuyxxAWmI+zQv1Jk5A6xAmNqmxFN6asOPtOSoWJlnOQwRuNZTq3WW+FcqEyg7Oc4hjnv9Ay+sheN1KG7745QZnrqewJYVBS1yZj+sf5Ank/Lnncn0/gvSTwChEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CZW1vAPog6IUgCN96CcyXbKZlm6r7DpJb4wWUQZVTk=;
 b=QnYKUKNYeWJIbyruv5DasHyR90ZOBUrpR/1ynAvmQkXYCpU+ggKNLEnEKzHx9BkQmGZGPQmnWeb/RtpA4ActGyo9jYMukWN3WTVaOW/Dsb33aGEJPZT2hpL7EHcJ2WdQji/cH1N7IvECQe5bPq16Rn+swP5SJUWk6s5ymsQK+VOvkg3tr8RN4GsjGwSx0Qes6SY1KpmkgUDdqQX2bcu1RnWJd177rsJNsq7akdSC6D1L8GN8cqBN9Ivqle3NP0igJxSNUqEuhmW3dd66Jk3bVflVn2gS4qSxeraIGf/l3jDA6I2qKWQ+D8kuksVQR7aAHzMnzXHi9AvjIyFnHsH6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:50:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 14:50:28 +0000
Date: Tue, 20 Feb 2024 08:50:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>,
 <obitton@habana.ai>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: Re: [PATCH] drm/xe: avoid using 'grouped targets' in Makefile
Message-ID: <3ziuczyga7xqn774z6bfvftnp7ybompmiel2a3tqttgjv2ualb@q5s7uh4ywuk2>
References: <20240219135845.1463992-1-dhirschfeld@habana.ai>
 <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
 <shiourokdrk7rzpof75s3bul443x2xc5sezm6sfal26icjraio@5sk4ouwsvmh2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <shiourokdrk7rzpof75s3bul443x2xc5sezm6sfal26icjraio@5sk4ouwsvmh2>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 353a37ac-f671-4b50-4a22-08dc32234766
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljSAzVuKIryaQZ+fUiGyoiavu8xfZiFYrLDnxE47eielhCtxSBLIRvW/XlAQEMv1DWEzFIPuYyZ66ZW6eZSl2cQL6o8f1J7tzQtECvW7GkqZOoHWCPrFzxkrrCcQP4LdEWF4GQjSPiRTsp+ex/MSK4dT4wRJCWjFG8gyRBXRZ3n5ZTI2Q2mXOwhm47sz0bHRpmR2kzqqCLcruoQA1IDRHd8FAeD+4ktdiHkH6yPGd1ZuNSdp2E/1+5xwGSlHVK4Q6Zn5nIEvQSZa0ZWdh/Ydu314+fabXmfgfW6GrpcFCPNyQEAV8cWYkUDuORUNQyzFILYcw9zSVDYDYpsh6Fc7flhHnLUapdb0r77gv0mWDRNMNRtJZh39fFZr2PEXMESLWxmp6TnUyPd+CbUH9OGtJpk251brnP0c7ZUy3F4zIk9cS9axz3jzecRDAQkDYbXj0ZYn34I/vImbBqJUX0qMomYfS1cyfhSGHVg05WhWs7kez4kSRr8pnOrKi4jYgPYCVaekxWZOXGuzpbr0seS8+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zZxfFogVFEQHZ26h++zgJrnC3OyveRopuQbo3q0RXLE/RUtf/ehRTopBZrCA?=
 =?us-ascii?Q?ZGXvizQTxWSuUG7ZCmzCINZrYQpZSaB8CaIqwuksybldlZKZqqH/NMQazrdX?=
 =?us-ascii?Q?GkgIauvU1+WbbGu9rARmS+n8BPGcohp1hHGn6YsN6L8d+LuS4xV+hPQL5vPx?=
 =?us-ascii?Q?8upzwABktE7QHULyAKeRL+UggDAyAWhw/AwHY8tqBjqW2HxCY1l+PckVHNfk?=
 =?us-ascii?Q?dgiOuSYbvPDr0Zoi92OoOyJjfgTGcNeVIjP+KsxJvrI4f1tTR1pbQsMBchH/?=
 =?us-ascii?Q?IO3qNGxz3c4qnovzga1YVdAmHd1dNwtHCOhCUJkckHw/8wmqqF5I40RyywOt?=
 =?us-ascii?Q?v5bJlmgOj9TgFsgG2E3KWwMGHS42VzCqWOS4BCnqOCRq3rfOTvpJnvmGdo4B?=
 =?us-ascii?Q?6+gLAKInN3PoScXPNqEJybsMKjuvXnVcQRUgtCHta5EJeGobGY40oXRkfOv0?=
 =?us-ascii?Q?xxVawqyGIhWbSirwZVyg4fczWpX2xsovHB+yebGhp68YWeJuOpQALY3rbn3f?=
 =?us-ascii?Q?WtRk5uwbAnqBj3zpGVkdz1nkhrZDN7ltwD/EPAm7QKBrD1UUl15n3ZApHDcD?=
 =?us-ascii?Q?SSx5oNkeMN8418zz7n+jX4kAdRM5A3/HxOAM7xtR3v4V9dDrnGNH4XxQftsp?=
 =?us-ascii?Q?zP9PAv7hKgHkYDtuulDI2PrJHbZ5zI//tsbyP+xYQR9UajR4/PAZ910B37U6?=
 =?us-ascii?Q?yTJk3DwYXas88t+E8O/Hx1MkkhPAPfrDjpiloEUnyHJdTmNTFO4UnJhxPOhw?=
 =?us-ascii?Q?DcS0OnYxPH0E3aIjn5tMoATo+DaSoIc19QORmXn/7XKmEELt2Dtg4r5WyoNy?=
 =?us-ascii?Q?4AwZk8Np7kMy7JA0jBqlhIkDDyIwx9IcSDsuPaaxAwS1hrDw+V3DUjSgwcBi?=
 =?us-ascii?Q?hlePUCsmsDU8+sCI3xXw9YNx7zZOioslRJkmAv7okggJysCTLsq12cwbCLDh?=
 =?us-ascii?Q?qTiypZIffKPMZFR8/xoRcaPE1BbLXaVOVvCIea8ys8oVFaA9i0He4aQlHm7z?=
 =?us-ascii?Q?tE0SUakPJaps8ZLeT4h7GuAIQ2PDuCXWc156kfUNQ3Bn0YTLXnkXOyR1VYGl?=
 =?us-ascii?Q?W9ZAIm8xEdF/ljQYH7VSdLbg2wWi7+EE82ar7bZmvTzlefhC62KjWBWcRL1m?=
 =?us-ascii?Q?LZQ9m7vjFvvQrjO4xDKk6UKDpjcIE7Tjz+RxO54bPUbkARrHTkAQg3I1mB9c?=
 =?us-ascii?Q?8dh0FCpkIEVOKMk8pLW65+7YiAyzq0vtMwGk/vV3jWDK2Wu66yW/Viqckr49?=
 =?us-ascii?Q?4eYSbC9Gcz3hZ7E7CDWKu4p/EYStMw2qC7RGb6w3nWPYXmj52FBV5z9hkXfN?=
 =?us-ascii?Q?2Bk9rdXavLN3xIGwt2ibYv5k6VTKvx9xywuYtPJcEL0q5PfEbfoudPWlWdXU?=
 =?us-ascii?Q?tgn4YjHfpJVpBpFs4sk3RMtPFmR/LPFKgqOkx06V7U6rzGO9nRBu5ForBxFE?=
 =?us-ascii?Q?OQH/jfW/xKRLb97/ebDjbSpZMxmtogDUMYKaTtOcVg3ODpHxQcJDc90El5U4?=
 =?us-ascii?Q?30P+k9djQ8hgQv6pmHEoxlgAjDr66AECCyJLjepkLiBurg0elCClNiMIPUbh?=
 =?us-ascii?Q?wziaRlkH4o+7UwdtORAzf5z/B3PVl2TQhNZVkVLXYHuykzha6HOY9NL7J1sO?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 353a37ac-f671-4b50-4a22-08dc32234766
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:50:28.4193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1XngVyZTQMAVIBbT2EmKimME/8j/eAEexDZYNMpnaSJZzWAZhOaPJvAg4wdbORbFyJHU/rnaT4CBiiCvhWPcPyrg8kkxq7IObtUfpzfP+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
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

On Tue, Feb 20, 2024 at 11:08:58AM +0200, Dafna Hirschfeld wrote:
>On 19.02.2024 23:44, Lucas De Marchi wrote:
>>On Mon, Feb 19, 2024 at 03:58:45PM +0200, Dafna Hirschfeld wrote:
>>>The feature 'grouped target' ('&:') in makefiles is only added in 'make'
>>>version 4.3. This cause problems in older version of 'make'.
>>>(Specifically $(@D) is wrongly interpreted - it creates 'generated' dir
>>>in the source path instead of the build path).
>>>Avoid this feature.
>>
>>but it was used for a reason since a single invocation is supposed to
>>generate both the .c and .h from a single invocation. AFAIR when
>>implementing this, not using grouped target would be a mix and match on
>>having a succesfull build. Does removing it really work with incremental
>>and parallel build?
>
>Hi, we had a compilation issue, where the wrong version of the generated header
>(xe_wa_oob.h) is included from the source directory instead of the build
>directory. I thought the problem is due to the feature '&:' which is not
>there for our 'make' (v4.2). But this didn't fix the issue. I was able to fix
>the issue with that patch:
>https://lore.kernel.org/intel-xe/20240220090003.1523866-1-dhirschfeld@habana.ai/T/#u


humn... probably because somehow the .h was left behind but with a more
recent timestamp? If grouped target can't be used according to commits
9390dff66a52 ("kbuild: invoke syncconfig if include/config/auto.conf.cmd is missing")
and f463c3510d44 ("kbuild: add comment about grouped target") then I
think both fixes are valid, i.e. the other patch you sent and this one:
https://lore.kernel.org/intel-xe/ngvfmndraoxpdiv4ty5ux7ocjfalsfvejnkxiqbbd4joylhend@q7nai4sxgkmf/


Documentation/process/changes.rst still lists GNU Make 3.82.  +Masahiro
to know if there's any plan to raise the min version requirement.


>
>Thanks,
>Dafna
>
>>
>>Lucas De Marchi
