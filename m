Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE42C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 20:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7428610E023;
	Mon,  5 Jun 2023 20:09:51 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886110E023
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685995789; x=1717531789;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eTEIe0S2S5CONVDGbhnVlj8Uhmof1/On4LPtFShLI2g=;
 b=SsNC3I3uUHyKJrAOeY5/zJGZDzw+Yjbe3pmNMzGuI7K2cQhHQpiUfuVk
 2HweTr7S/XlzyD+6ElxYFmD7gwy7Fmp8iFzWe0HxbVjkldpX3dLJ6tlly
 yUsGKREbtEVTq7lRYQaQoyGGtvVVjoHM1L2i6tmtuKWcRJFGxBzSs/gv7
 3lhXFY+mVDOiPTvuId3Z4ioj4sSEhYzdQTB4ec3oHkR1N24iNk9SRog6n
 oMVGxuaqi6MbWKrDoxl5krXpzofEi9tSzTK9Vxg5OZFOyL7W8dVwJHEhr
 cgPctMC3LFbfm/E8T+nlhWm9dmCy95FuWkM4R/FBB6/ZWARGV9zLAkAMj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420015551"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="420015551"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 13:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="832931251"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="832931251"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 13:09:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 13:09:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 13:09:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 13:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GArqKdI8CWNYyh5H8mJAPvH9I4rZ1UgUHqjq/YmsquWv+MvIfZrnZEQMEfFFRQW6hPt+7i4Y/gAHjFOpk/0qMGSDzKgE0aG0VgOW37YEAqCMUySCmc0UnRCOByeLPJ0o7XDOcjrN6pH/wNuMgQTT51bX09/Xm8sZaXMc/+ssCvCOepm6n9eUHgBy6qW5B4p+sxXdht54mno70lBvWJUxinHE8n23rEO7pTU5sxwg9GQOKk1IPDdciupbmJLgERSdEOIOiDMjDQB42kakHEoKbzNTqUiVFPGRRJBZgR+LDAhPxa8h7t/IV83sXq3nna/xZBXulbsSc3Lbnl4oopy8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8tw4dh12PR76FeA3LuQi6+C50HKajI0VCHzMBkVWJ8=;
 b=UVja7vgF0gBBMd9yMEaUmzQIZZG1O/GqbJ8iL+7A42Gs1blmuY6SaUN+9cbCeJDqXM/9+nW0cp0d1J0Gsm+0Jv5ow9KyCP/R/AySPj9cx27BGp9VDWx1l/ZF2fbcbzN21ySk+R2hoMrsAJLaS8KE/rHdpos30A/gTrumPgD73Pea82OXIWlJLrXUOiYEbNPW/sANLjpcoEqvIRVt+aCPoNioyWGuxkFhcjZ+OYazmrMagZ4FC3qKGMX8xKhR2gu/M6hMlh+dYbfSiXgh43r7L/h6qQDxYKQTFWjgCK77R0M6BfvAMDgSryQ+Dr+ncIc3AMjvBhyV5IGF6KtXWRm5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Mon, 5 Jun
 2023 20:09:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 20:09:43 +0000
Date: Mon, 5 Jun 2023 13:09:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Message-ID: <jifbozq2jzctt2a226hectd5izr757haxl4jrqduxhhhshfcox@i54q36fox4at>
X-Patchwork-Hint: comment
References: <20230531152338.6-1-francois.dugast@intel.com>
 <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
 <ZHd9u1AdemcPGPn3@fdugast-desk.home>
 <jjkmqjebxtljdu4chzjuj7a56xbpttd7wf3wqh6o7ciigb55ur@pgci7bqedka6>
 <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
 <sptofjhqdc5kjs6fm64ueghqluyi3p7g6x2d63nxruxxp6zzlq@fktu4g44adrs>
 <CAFCwf10F=AT4apgR++C+usW4MOefM=CHi58Oni0vT-B+QBtVjA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf10F=AT4apgR++C+usW4MOefM=CHi58Oni0vT-B+QBtVjA@mail.gmail.com>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b405d28-8029-4a78-573a-08db6600cd56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkaRQzrWKtW55seNBvVvF9LwEBaEoo433jbrdntOkhbeAF16mGL5Dx/0XoKTSnjKA2MGTZSRMyYTxyR3eoQS6RShNMv0mMEzG58jG6yKH3Tb4HOE0XnDSoCxBrdzeUNkEM/PYCCMHFtTUrwGd0qTV8nVcL+kZBwTviicWUjcsEU1WisWtRxtDwDKw5/vL/DMmke27RKJNkHnKXl8XnrSmuHfKipdQiwa8j475D5Y7Zmf9TJgNQwt1PU8KNTsyv+KRhe9SPrBtqZxggXQ/kFMiRgbagdpH6fJfYJkf1kEBvIJ7iiZg3P4w4RsOXiv995lf54JvtjHbMN0xliU8KajzP4OA+BhERLWLwQjehkBrSQOoKbVcjreacaRbD1AfoWrLt3Yt4am4EpIQvdGYyrwLPg9IVOSCu9lqzqTWYEG8z6sOzULmP8TWplRr2dozbLiZHJHgnSQsYiMs4JiHCGWL6U+OM37Gdjt5wOS4dtAa4a4x53Hm4jPjs5HPn2XUpT8BkqwUPX/QaQe5i70VxAjyrUcftgnmONscg3QCTYQ8hVzCsMvQmp+msSdsuvUFFd2at6wU4WHXOQ29pUbaZZZRJfnkdPyHOmDrghokS4NaQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(33716001)(66899021)(38100700002)(316002)(478600001)(66556008)(6916009)(6486002)(86362001)(66476007)(41300700001)(4326008)(66946007)(9686003)(6506007)(83380400001)(6512007)(26005)(82960400001)(186003)(5660300002)(8936002)(8676002)(966005)(30864003)(2906002)(60764002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzducDcxUkdBNXB4ZEdPWktGdi82aDNDNXVqemxtQitqZTFBSFNVZW5QazRJ?=
 =?utf-8?B?MVcremxCWjVKZW1yMjlXNTNkWlUxUWZWNWU4RmVzaHc4UFdwa3U1T2NPeUhs?=
 =?utf-8?B?QUlzTWVFOUJZRDVHSXBaTzR4KzJ3QmVReXJ6bUFsM2lGcGJrUnN4SjhKV3Zh?=
 =?utf-8?B?YWdkSVBReVNpSXFMcFZyOWg3RHo4QVRkUTFOOHBPY1BlWU1Eall3ZFpERVpk?=
 =?utf-8?B?WUF0NkZCRlhQaGFobDFkdlBvcDlLNHJxQXNOT016R2xjKy9qRGRlKy94b3dl?=
 =?utf-8?B?VzZPMDVHZUs1U1h1a0grNXFNWjdLcEh0RWg5ZWtTeTNEaUtPbllHZCttUHp2?=
 =?utf-8?B?Yy83enhUVnpKb2k0OHNsU2xwcFFjT1hNM2RUYXlCY0VFWndnZHlrVUVqUVEy?=
 =?utf-8?B?ZUFpcExPY0J6cW9uNFpIM2M1OXg5Z3pUSlN1dy9FSlVHb2ZYb3hCd1gzeCtS?=
 =?utf-8?B?TVpOb2hPNkl5Zkd1R3JCQUFwVC9wU3NpN05UdWcvMGZQSUhxa0ZqTzFENXVP?=
 =?utf-8?B?SERic08vUE8zcjNqSVYweFV6Mkg2RTA2NUJlazJkUEZLYU9NUXUvT29ydWEv?=
 =?utf-8?B?VUxwbmpWNSt3QmZBMUl6UlI4ZTNHV0FZQ3d5Q3U2Wm11bXQ1QWM5K3RtYUdv?=
 =?utf-8?B?Z0FZeTZxTlFCWkR1dEFuOFdmMVdWZGIxa3VVUzVjQlBhRDByRkNwZVoxSXVZ?=
 =?utf-8?B?Tkx5dzNHMlZNeFJmNGYwU3drYkNWang3RUhWMUJjRTRjd0IxZmxXWk44anlx?=
 =?utf-8?B?aG1ybEMyeGtzTGoxSEtQLy94WnV6akhGaFRkV2hWTGJTaUgxWlJHaGRKRjkz?=
 =?utf-8?B?QTBOWWFPajNTbTNFUVp0ci9mSkl2L2d5NVRSSDZmcjR6SmpPb2V0ZlV3ZGFO?=
 =?utf-8?B?R2dwcEJwZ1M5NkdPYVI0SVZLMGVLN2dHVndDWDRPTXV1QmpIWWFLdm1EZ2Fn?=
 =?utf-8?B?amE4MGY3d3k3WnpiaGI0TXVoVmdGNHU0UUZ5MnVUMzdaR2xmOEFlY2pXSWtO?=
 =?utf-8?B?RnVpdCs5UUNsWkMvWTBTcUp1RVBOVlBUTWE3UFZyY3dRcW5BNHo0amMwMXBZ?=
 =?utf-8?B?OUE0bCtibWI5bHhZRkZqazhkZXlRcmMwK3pCKzZPWWlua0hEeldTZkhKMkUw?=
 =?utf-8?B?QWxDd3JidEk5RThIUFlidDBTSDV4bGJaMCtna3IweHZsbUZEYTg1VFlINlhS?=
 =?utf-8?B?YzcrRjFHSjFBSWQ4OUU3dFN1Z29FU1RhdHVmZ0l3RTNHWGtmNHE5RENNR0I3?=
 =?utf-8?B?bUZ0R0R1NmpQODZzMVY1VHpmTHhvR3BFYldQSlFnQnpqT3F4NXorQ2RsZkwv?=
 =?utf-8?B?c1FoN3BuWVROQXFKenlubk5ibEtjS1J6TUloK3BLdGdVd2xDOUJ4N3FDa2Fo?=
 =?utf-8?B?Z3dybktSYVpVb3AwbGplSHJJYUF0c1JHbWJWclJmcVJnR1k4eWs5MjlBMHFF?=
 =?utf-8?B?WHVwVHZXd0N6SXM0eXdKbkpsRmN0VjluOGFoc0piMkdjMFhSS280eUlIcGdI?=
 =?utf-8?B?MzhuZDg0VGdqN3E4ME5LRzQySHZRZ3h1NFdtTEUzVlJYOGJWZ0JKc2pyYTVQ?=
 =?utf-8?B?M05uWTlhMkFYcys5N0dZQXUwcjh0T3lQclQ2K3dKOUlZck52WFQvV2Z6aWdG?=
 =?utf-8?B?M2VTTGtRWjhteW9mNEpVMFJSMnJzVXF1T0ptcmY4VWsvN1FIUm9qVUdMTFZz?=
 =?utf-8?B?QW5FZ1Z6bGhqZDNMelczd1lzYkx5blVDK2hFcW5WaE9FeThjL2JXQU5pdi9R?=
 =?utf-8?B?clYybHYzZFJhejFhQmNMVlRSSUlJZG5JdW5Wc1kvZ1NiRllQa3MyZ3QraHhZ?=
 =?utf-8?B?b2ZJK2d2YkRROERackVBRnFMaTdoK3I5WmRjY3A3VnlKQzBYbWtIL2VzbHV5?=
 =?utf-8?B?Y1dpdC9QN3ZZcDd5UzFIekpGT3ZUaGpOU3VjR0Fjd05DR0RmT050VGNHMCs1?=
 =?utf-8?B?MGxlZTQ4YTdRTklRNlFkeFM2QjlobzBmWUt1Zm05SnRrdFpGWm8zWEt0ZC9p?=
 =?utf-8?B?ODdzZVVuSVRyT2lLSHUyaVg4N0xWUGJ6MHczbitDWE44U0FaK09QVjdRc2JC?=
 =?utf-8?B?ZnhaRkFUWEN3R3BNNjFjSDZwVVhTdVM2c3VLTWFaNUl1NFI3NU1WN2drQ0J2?=
 =?utf-8?B?eXpLZloxR2RjelRxYU5odTk2Z3lmQnE4KzFod1ZCREs5RjRJNWs3ZzRiVGR3?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b405d28-8029-4a78-573a-08db6600cd56
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 20:09:43.5660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HdkOabTqi9ksGF+aft6DmbJ0vMmxxkpcU9my7dF7t2fP2Rm4iIeH9pnk09jITniyk1Qvo4CpMrx0R/tFQVO2hKq01yAOySkSx+JUznhJMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/5] drm/xe: uAPI cleanup
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 10:33:57AM +0300, Oded Gabbay wrote:
>On Thu, Jun 1, 2023 at 7:48 PM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Thu, Jun 01, 2023 at 01:21:06PM +0300, Oded Gabbay wrote:
>> >On Wed, May 31, 2023 at 11:29 PM Lucas De Marchi
>> ><lucas.demarchi@intel.com> wrote:
>> >>
>> >> On Wed, May 31, 2023 at 07:02:51PM +0200, Francois Dugast wrote:
>> >> >On Wed, May 31, 2023 at 09:23:45AM -0700, Lucas De Marchi wrote:
>> >> >> +Oded
>> >> >>
>> >> >> On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wrote:
>> >> >> > This series addresses some feedback on xe_drm.h provided here:
>> >> >> > https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>> >> >> >
>> >> >> > It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
>> >> >> > likely break CI.
>> >> >>
>> >> >> As I said on the previous reply, this is not going to fly. Now we have a
>> >> >> patch series against xe-rev1-2023-05-02, pushed as xe-rev2 branch with
>> >> >> *no recorded reviews*, doing things that already conflict with other
>> >> >> fixes that landed in drm-xe-next. Examples: the 32b compat for uapi,
>> >> >> the mmio refactor, the oob WAs, the probe refactor, etc etc.
>> >> >>
>> >> >> Also, there are other fixes queued as fixups, which is still the process
>> >> >> being used in drm-xe-next. It's also where CI is running. Due to display
>> >> >> being moved up in the branch it's basically the only sane thing to do.
>> >> >>
>> >> >> I think we need we are shooting ourselves on the foot and this review
>> >> >> process needs to be fixed / agreed upon before we create a mess out of
>> >> >> it.
>> >> >>
>> >> >> Lucas De Marchi
>> >> >
>> >> >Yes I understand the concern. The intention is to address Oded's feedback on the
>> >> >revision that was reviewed, so that the next review iteration is manageable and
>> >> >not based on a moving target, which could lead to and endless effort.
>> >>
>> >> and then what are we going to do next? rebase the rest of drm-xe-next on top?
>> >> How do we guarantee the fixes on top of xe-rev is not breaking stuff?
>> >> What about the changes that are already there changing the commits that
>> >> are on xe-rev?
>> >>
>> >> >
>> >> >Maybe I created confusion by sharing on the mailing list but at this stage the
>> >>
>> >> no, that was the right part of it. Reviews on the patches happen on this
>> >> mailing list. The wrong part IMO was to push it as a branch before it
>> >> got the necessary review and before we know how we are going to
>> >> reconciliate things. Rebasing drm-xe-next on xe-rev doesn't
>> >> really work for the reasons mentioned above.
>> >>
>> >> >idea is not to get this series merged, only to get Oded's validation that it
>> >> >fixes the issues that he reported. Yes this means more work will be required to
>> >> >rebase and create fixups later for drm-xe-next but it seems acceptable for the
>> >> >work that has been done so far.
>> >> >
>> >> >Do you see a better way that would still satisfy the "not moving target" goal?
>> >>
>> >> 0) Ignore the "not moving target" goal
>> >
>> >Hi Lucas,
>> >I would like to say a few things.
>> >
>> >The first point is that the current xe-rev1 branch was something that
>> >Rodrigo and I set-up. If you feel this is not a good starting point
>> >for the review, let's talk and decide on a new starting point. Even
>> >though I have already invested multiple hours in reviewing it, I can
>> >understand the point you are making and I'm willing to re-start the
>> >review with a new starting point.
>> >
>> >The second point is once we make a decision regarding the code
>> >baseline (keep using the old or moving to the new), I want *all* of us
>> >to agree that newer patches that are sent to the mailing list will not
>> >be part of the initial Xe upstreamed code. There are mainly two
>> >reasons for that:
>> >
>> >1. There is a long-standing process of upstreaming a new driver to the
>> >Linux kernel and that process assumes a code baseline that doesn't
>> >change between revisions, except for addressing code review comments.
>> >As a person who has undergone this a couple of times from the side
>> >being reviewed I would like to follow this same process here as well
>> >:)
>> >
>> >2. The Xe driver is one big driver, with a large team behind it that
>> >continuously sends patches. The code keeps getting re-factored and
>> >acquires new features at a high rate. If every revision of the review
>> >the baseline code will change, the changes from the previous revision
>> >will be too large to review independently. I will have to review the
>> >entire driver again... Not to mention how will I be able to easily
>> >verify that my comments were addressed properly (btw, I also wrote it
>> >here https://lore.kernel.org/intel-xe/CAFCwf124UMR3VQ=Tr6mT_eTRQi9ssqZqEH4jys1bGggHJjboLw@mail.gmail.com/).
>>
>> Let me use a few examples:
>>
>>         22ad50d184c0 ("fixup! drm/xe: Introduce a new DRM driver for Intel GPUs")
>>
>> Do we want to leave the commit "drm/xe: Introduce a new DRM driver for
>> Intel GPUs" as part of the original and then have a Fix commit leaving a
>> few hundreds of broken commits?  On other "first driver submissions"
>> I've seen that would be frowned upon and it would be expected that this
>> is fixed inplace instead of leaving broken commits behind.
>>
>>         a00a92181ab1 ("fixup! drm/xe: Introduce a new DRM driver for Intel GPUs")
>>
>> Same thing: a nasty memory corruption lurking there. Do we leave it
>> broken?  With the previous (current(?)) process we were actually adding
>> these fixups that are later moved back in the git history so things like
>> this are never part of the upstream code. Looking at xe-rev2 branch
>> being pushed without any code review, why is 83ac6e02bf5e ("drm/xe:
>> Remove unused define") more important that deserves being brought back
>> to the original submission?
>I'm sure there are multiple additional bugs/broken code paths that we
>don't know about right now, will be part of the original submission
>and will be fixed only in a couple of months or further than that.
>Therefore, I don't think this is a critical issue.
>But in any case, no one said we need to have the original submission
>sent upstream, without additional patches after it in the same merge
>cycle.
>
>What is critical imo, is to have confidence that this driver is not
>doing something horrendously wrong, like abstracting entire kernel
>layers, or putting up a broken uapi, or incorrectly using kernel API,
>or whatever.
>
>>
>> Another one that comes to mind: the engine vs context name that you
>> raised on the other review and I pointed out to the history: would it be
>> something to be changed on xe-rev branch and invalidate the other things
>> on top?  Or would we better change this in drm-xe-next?
>
>I agree the changes between rev1 and rev2 are often quite significant.
>And with all your other input, I think we can consider the following:
>1. Halting the review for now.
>2. You will prepare a rev2 branch with all the changes we agreed upon
>+ updated code to make it more aligned with drm-xe-next.
>3. I'll restart the review on rev2, while we agree to keep the
>drm-xe-next mostly aligned with the review branch until the review is
>over.

mostly agree, but need some clarifications below.

>
>>
>>  From what I talked with Rodrigo before, we'd actually discuss and agree
>> about things that needed to be changed/fixed, particularly on the design
>> and interface of the driver (with drm subsystem and with userspace).
>> Line by line review with non-critical things would then become gitlab
>> issues, like when Matt Roper went through a similar line by line
>> review and Rodrigo created a bunch of gitlab issues that are being
>> solved in drm-xe-next.
>>
>> >Therefore, I think we need to agree on some method that won't burn me
>> >out and cause me to tell Dave & Daniel I'm giving up on what they
>> >asked me to do. One way is to follow the rule above, but if you still
>> >disagree with this, I'm open to hearing other suggestions on how to
>> >enable a proper review in a timely manner that won't cause me to pull
>> >my hair out.
>> >
>> >In that context, I feel your "Ignore the not moving target goal"
>> >statement to Francois was inappropriate. We need to have an agreement,
>> >you can't decide that on your own.
>>
>> What am I deciding on my own and why was that inappropriate?  I went
>> back to read again what I wrote to check if it was badly phrased, but I
>> don't see it that way. He asked my opinion on a different method, which
>> you are also asking when you say "I'm open to hearing other suggestions
>> on how to enable a proper review in a timely manner that won't cause me
>> to pull my hair out". If you hear and disagree, I'm totally fine with
>> it, but asking for it and then saying it's inappropriate to disagree
>> with the premise seems odd.
>I read it as something else but if you meant it only as a suggestion,
>then I take my words back.
>>
>> I went on and explained *why*, saying that the moving base is already
>> there and IMO a better method would be to accept the moving base, with a
>> different review method. And if you look at the proposal below, I'm
>> actually removing the "moving base" factor between what's being reviewed
>> and where the rest of development is happening, CI is running, other
>> review comments are being handled, etc.
>>
>> What I'm currently seeing and I don't agree with:
>>
>> - Commits are being pushed to a xe-revN branch bypassing code review
>Correct, this should not happen. That's why Francois sent them to the
>ml and I thought it was sufficient.
>>
>> - Since CI is running on drm-xe-next, it's also bypassing CI. I was
>>    part of enough upstream submissions to know our ability to break
>>    things when handling code review comments, which is only noticed later
>>    when the rest is rebased on top and CI is running again
>I agree, but unless you can trigger CI on specific branch, I think
>your only option is to run CI on drm-xe-next after it is rebased over
>the final xe-rev branch (after the review is over).
>>
>> - drm-xe-next and xe-revN are not on the same baseline. If they were,
>>    then comparing both would be trivial and we'd probably not have
>>    this discussion. Question here on your process: currently xe-rev
>>    is on top of drm-next-2023-04-27, which is on top of v6.3-rc4.
>>    Is your intention that fixes (to only your review commens) are
>>    accumulated  on xe-rev* and then propose this to be merged to drm-next
>>    when that is finished, without any rebase?
>I thought you would rebase drm-next-xe over the final xe-rev branch.
>Then just make sure all those commits on top are passing CI after the rebase.
>>
>> - changes to "the original submission" that from my pov some are good,
>>    some would better be discussed and some that are not critical
>>    taking precedence over others that should really be there. And that
>>    is happening because there is this disconnect between drm-xe-next and
>>    xe-rev as per above.
>That's why I don't mind if for xe-rev2, we make it aligned with a
>newer baseline that matches drm-xe-next.
>I'll continue the review on that branch when it's done.
>Then, after the review is over, rebase drm-xe-next over xe-revLast,
>which shouldn't be too hard hopefully.
>
>wdyt ?

Let me first start saying that when I saw your 1/6 in your second batch
I thought it was 1 out of 6 and you would send each of them on
Thursdays, leading to 6 weeks from a state that is already 250 behind
drm-xe-next. I was pointed out today that that was actually the date.
My bad.

To move forward I think we need to clarify and agree on a few things:

1. How are you splitting the code review? I know you are reviewing "the
final state" rather than patch by patch. But what I'm looking for is to
know if you split the driver in 2, 3, 10 parts/files and we should
expect 2, 3, 10 batches of reviews or what? Depending on if we are
looking at 2 weeks, 2 month or a year, we may need to adapt the workflow
differently. If it's 1 week we could simply halt any change at all.
If it's 2 months, then we may have some problems to figure out the
workflow

2. I will quote what you said:

>What is critical imo, is to have confidence that this driver is not
>doing something horrendously wrong, like abstracting entire kernel
>layers, or putting up a broken uapi, or incorrectly using kernel API,
>or whatever.

I completely agree with that. Isn't this the original ask from drm
maintainers? However reading the review comments, the critical ones
related to the above paragraph seem to be swamped with other
cleanup-related. Some of those cleanups already happened or we moved in
another direction  with drm-xe-next.

Considering that as the critical part, what about the changes that come
due to others' feedback that also fall into that category?  Examples:
the uapi break we needed to do so we are not completely imcompatible
with 32b applications?  Or for example other patches changing jiffies
to nsec in the uapi. Wouldn't it be sensible to include those in the
next xe-revN?

With that in mind, what about this?

1. Halting the review for now.

2. I will tag the current drm-xe-next, just before the point
    in which we add display. This would give the same baseline between
    drm-xe-next and xe-rev2 tag.

3. We don't modify anymore the code below that point. If there are some
    critical changes that we'd rather have squashed below that point,
    then we just accumulate on top of that tag. So from your point of
    view, the next xe-rev3 tag won't have those changes together with
    others

4. No patch is merged/pushed directly to a xe-revX branch - xe-revX
    would be actually tags. Instead, the patch is based on drm-xe-next
    to get CI passing and having a solution that is agreed upon.
    When you're done with xe-rev2 and we send a xe-rev3, those patches can
    be moved so you actually get those changes first/only. Again, depending
    on the timeline we are talking about, it may be simply done by
    halting any other change. If it's a long time, then we may need to
    rebase and move commits around before giving you a xe-rev3 tag.

5. For the questions you made in the review comments, do you want devs
    to answer inline like I've been doing? Or to create gitlab issues like
    Rodrigo suggested when this process started?

6. (only if we are talking a long timeline, to be agreed on a case by
    case basis):  for intrusive changes that don't fall into the
    critical classification you gave above, may we agree on handling
    those on top of drm-xe-next, without moving them before other
    things?

thanks
Lucas De Marchi

>Thanks,
>Oded
>>
>> - the disconnect will only get worse as we are on 1/6 batch of review
>>    comments so I don't see the process scaling well.
>>
>> Lucas De Marchi
>>
>> >
>> >Thanks,
>> >Oded
>> >
>> >
>> >
>> >
>> >>
>> >> 1) The review should be on very a recent rev, not something old with a
>> >>     lot of commits on top. That doesn't scale and there will be another 100
>> >>     patches before the next review round.
>> >>
>> >>         $ tag=xe-rev1-2023-05-02
>> >>         $ s=$(git log -1 --format=%s $tag)
>> >>         $ commit=$(git log --grep "$s" -n1 --format=%H)
>> >>         $ git rev-list $commit..HEAD | wc -l
>> >>         208
>> >>
>> >>     Then as outcome of the review we have more patches to land, rebase
>> >>     the rest, etc, etc.  This is a much worse "moving target" and IMO
>> >>     it's worse for both reviewers and committers.
>> >>
>> >> 2) The xe-revX should have the same baseline. That makes for a really
>> >>     simple way to check "what changed since I last looked". This can be
>> >>     checked on the overall diff with `git diff` or on the amended fixes
>> >>     with git range-diff.
>> >>
>> >>     Currently drm-xe-next is on drm-tip due to the display integration.
>> >>     Being on drm-next is important for merging the branch upstream, but
>> >>     not so much for these kind of reviews
>> >>
>> >> 3) Not merge things in the xe-revX branch that is not already
>> >>     in drm-xe-next.  Ideally if there are things that really need to
>> >>     be changed back in the xe-rev branch, it should be a fixup on
>> >>     drm-xe-next that is then brought back to the xe-rev branch.
>> >>
>> >>
>> >> Lucas De Marchi
>> >>
>> >> >
>> >> >Thanks,
>> >> >Francois
>> >> >
>> >> >>
>> >> >> >
>> >> >> > v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)
>> >> >> >
>> >> >> > Francois Dugast (5):
>> >> >> >  drm/xe: Use SPDX-License-Identifier instead of license text
>> >> >> >  drm/xe: Group engine related structs
>> >> >> >  drm/xe: Move defines before relevant fields
>> >> >> >  drm/xe: Document usage of struct drm_xe_device_query
>> >> >> >  drm/xe: Fix some formatting issues in uAPI
>> >> >> >
>> >> >> > include/uapi/drm/xe_drm.h | 171 ++++++++++++++++++++------------------
>> >> >> > 1 file changed, 90 insertions(+), 81 deletions(-)
>> >> >> >
>> >> >> > --
>> >> >> > 2.34.1
>> >> >> >
