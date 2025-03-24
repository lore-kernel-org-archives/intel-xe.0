Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69306C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 19:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559F010E4C3;
	Mon, 24 Mar 2025 19:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+MPSbP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F307910E4C3
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 19:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742843276; x=1774379276;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3OgVfI5hAYVdSoD0WNPa65DNBgD8tjaM1MqpG0LfWSk=;
 b=g+MPSbP3Rhh5Xhu6Io5v2A/mZtYjNxx62CjcDDbFWf52qvB3FjXgDjbR
 VOWAi3KruDpWvsnQIQ/+IW9j5oxcww+6MVZuqor3y41BctV2fHmiP7AAz
 h1bS8Rvyhu6ocYkNE4rZOzVLs+DWX6wCBvFBunYorwWSzgLfltSIwuedO
 p8Urdhcb8PbjOSRKIJSEezFgzGSw855piYZmZpwoNDZZ3FshQat8gFn+x
 rfYV2wAqdLLLvoKQBjB4UnIV9tiYEq9SePDhFewd/n3uBMdFvls4Kxb4r
 Ok54AYHx5QwweCJEtvEv7D1iWrAhx0dmWiyGrLuxJBpRtfoPNcH1dwfG1 Q==;
X-CSE-ConnectionGUID: MuODBm8lRjKzq+oBLUTI2w==
X-CSE-MsgGUID: b48vfXioQGWIz+pgHCFcZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47726039"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47726039"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 12:07:54 -0700
X-CSE-ConnectionGUID: q6aeFqjOTu2QSm63Ae2y7Q==
X-CSE-MsgGUID: nUr5miVcTIqz0Jjf/C2frw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129334322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2025 12:07:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Mar 2025 12:07:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Mar 2025 12:07:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 12:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJrxZbI1AKOtyClDqSq+vrdT2AntHJOhX50VVNRqrjF3nm8G768SU+4T22bJuLQDINLthpURQGlAY1eiPckjKzOoVj5Uf8DfGWQET4lRqTMoxUh3PZ9k+xEIe25TWuZpOBjzND7W0gQDN2Qz7mjAEX6kkb98Evwm5Es1RxsdhnEkZykJ5SZvgB3fwWJKWadVUOiHLTWaQLnJPJfMYytl+5dim/VcdSxcXX4wfd+SS25mNtrf2xVlq/zHiMZA/FEFO+AKQc3LwZ7lxcTv7sPnvrFqg5KXsKwzoBEMtU5SQy5x21dTj9eSa8LeFGF+cKa1mdAkOJ5L6yZvHr7nGTWBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV6pIQqY/SfEzqvb9LRz0j82Y935ak3wME/4St+EpIc=;
 b=pbdlKIt03wAuua637yy2TC+dJ/qHwOjTt8k6QQA/tVZEbSOU4zvO4eEPIVhsj/cbVM+saTPxV/kVFxiLWdMswf4FW0eQx1tVq1K592avxeamWokaF9AhJ4zEInEg4Vyt1U42LozoX9fDcXqzIA48ePnIlLmaY+unXKN42wfn013NaavdNWwwdH5F2m1zfqsWW2izu0de6lN21ac6EKiWTcZn4lSwFxqSxYmmFvitb+znyhTzoH9VdlT6QbxdNUD8N+SIGmTZJV17si1ixbgxIX16POMX4uMXoGQMLe+BqEhUp3tN6BDGB/to7Pjs8ZgIzROOtztVFj7nfaiPYuzInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 19:07:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 19:07:35 +0000
Date: Mon, 24 Mar 2025 14:07:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
Message-ID: <bmooz4uz4lutnr3hnbcjj7dltpnlxmctd2unltcde3wxahcbap@htjihczan7ks>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
 <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
 <azol66l3wmb6r6cy6kh2j5ooglx25bduwj2ybifdxtpvpej23d@jxw766ana4kv>
 <87o6xsai7y.wl-ashutosh.dixit@intel.com>
 <iizcoecokne5qgkpr7kp4misfdok67eo2scj5czijpo6vqitks@xs3ehyr3kcbb>
 <87ldsu9z1s.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ldsu9z1s.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: c009deb2-d610-45e9-4483-08dd6b072335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SOrrQcIvzsYrAZjiF9xK69Z+48B57JYMyNJDnhrNJlbBTh6chhkoAJc22d?=
 =?iso-8859-1?Q?aYB6qdPu1LJ9d6s2jqT8PpT0P+PjJP3+tK6MnFY9Xq0Wk9BMnmxPd99Zzu?=
 =?iso-8859-1?Q?Z+c+AbYASFTZdLStNCdeI2GQ8t4sQW8IltQOw47wFNurTe0BCPxik3tCgb?=
 =?iso-8859-1?Q?jsvZFbb7LWCd0HZsCU7/yjheRZGDH012OsvWM9J4nCkTOc7gVxt5RwsThw?=
 =?iso-8859-1?Q?WAxaFwPOJh3ltrKpfydUNyI5tZeMfDgj6lI4UM6snwYnxNtjZbKtu6DkWN?=
 =?iso-8859-1?Q?ShM512h5kmurqtOovM9Zrn8B9CiIIDY0cZ7Lv0qvqPfBjut7v8Cn6y7t6i?=
 =?iso-8859-1?Q?F4gJZq/lGw5NHIb/JUReNn6pABl6NkFqrSRdPk8IP1UDc7eQJq7DKzIHR0?=
 =?iso-8859-1?Q?HxjKvgqdGQOWxZUCIob9rH+7WGHgGXK84zljDAMSdQiZqgHKzyEKHtDuxp?=
 =?iso-8859-1?Q?VDZf218omG9iOuM7D6lJKR2QBXEp4lq+yz0z9RowCBzTdkDsCVCESKCQBw?=
 =?iso-8859-1?Q?5IH1k7aiYrzACn8zJFkPkDc+clnBI1vVod9lhr58dLrQC09iY8Dm20WtY+?=
 =?iso-8859-1?Q?5FfsoTcaLmd0nf0tURKM4vpvQ6kN8uX9im0c9RrBINFTPkFhuTcnRFtakb?=
 =?iso-8859-1?Q?a+hzXohNjN0PagsqUKYupdMHGqXkuFAtlWFet21jCKH9UtoRrHLuTlaEHb?=
 =?iso-8859-1?Q?alr6AXHRpzsAHSo+wLq0+yZQeCCRG/ivjHluWvF0Wrz2T+4FkY/uyz/4Kl?=
 =?iso-8859-1?Q?OqJTaGyUvCmc8vJ4JaKWc2JPf+ZNp8/3b89YLWKSXNZA8av5Y6C/lNF36k?=
 =?iso-8859-1?Q?9PUN5GxtFXwHMkzkKUlc+QyhtGvc66yrYEMcOOLjX1ykBYxObGDHa2R4VK?=
 =?iso-8859-1?Q?6bbt3y/kvhjxIHoKlEFVWWvX+mLWNbHoYzzozjziWaD/srBpHONgHnvzjW?=
 =?iso-8859-1?Q?weyKFGX55ji3Lo0VOVDW9kFqgE10VR1ojwAgGeCdN1kszOY2MMeHfPEGI4?=
 =?iso-8859-1?Q?hSx3YiGhtAPkDlb4IOeZH5avzYCeoMdj7f3d+ZDPOFk8eUzzugOCmXOsf3?=
 =?iso-8859-1?Q?UWTAVbEPUWGbvSVb871VOWPOBndHiMhFfo37qENprPiuj0humOpl/Xz5/F?=
 =?iso-8859-1?Q?XLB7yNY8XsMmqVqeVk12dJxbKN31GcBo5bhCwGn+8qpU2xJHCye5rGN0KO?=
 =?iso-8859-1?Q?zFFZ1+mPg2GxSMDlTuTKoRClt36rK33ZStoJPLPRxgf6S9uH1gmn2jwh/Y?=
 =?iso-8859-1?Q?+cfSYktCi7TRzlrUobu7BBQaGx04iQ5Xqyv1bYu2aP+NeJd51YAX96lo3+?=
 =?iso-8859-1?Q?uW5CDa/wIihCRxTsFlL4zXGe/3w5URXagX0G6oeRlUxkRFJP9Tn1v7GAoP?=
 =?iso-8859-1?Q?HROPyy2nJAb6uYH2ShbYXWj8xfamZxww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N6Hit6Cz6ZIBO/IOpNOnyu1incAvA5knajpKiOOQTzuAVPOf0mJI/SKyfo?=
 =?iso-8859-1?Q?GAghMUBx4jaWvjdxVX6/9QfOJBY2hxuKPrjNyy/QAFR3zKuHRTQxn9FUGz?=
 =?iso-8859-1?Q?RsjC4gCIh+NGiDpR7HMj70D+xxqg7AQyJP9+3bxJ720LwflX/PbTdumi2P?=
 =?iso-8859-1?Q?kfJrm0iZ0zY3tTQE98rgQe1YQK564fc6iHc0FYK8DHKrjyUrnU3ovwsdAA?=
 =?iso-8859-1?Q?6pfdOVTlnJSotF1LAWXx1iMIdcDLjf7k5RmQR0vEYRvTUlMgpQeVi6Ci2e?=
 =?iso-8859-1?Q?NWwYqZR29zrTnRwQz++Kwf7bmcn98h0aQF3vRQ8iFEZ3Mv8QKu/bpxtqbv?=
 =?iso-8859-1?Q?hfSHkEb3tYQf1UqfUSk3UuxzU/ksRnHDkHpejU1TtQxayzIi6UpLzvMpPw?=
 =?iso-8859-1?Q?AQaKUajmhzPsN2t3U7yDKAo/Hg7s4zUsprcD/3BI4oGQPeoYrPsZge1FW7?=
 =?iso-8859-1?Q?55s2Gc5Sk6nTWnPL5iOCW1wr+meAr0A4I3c6PDUYRKcNy44dmaK3p9O8Yu?=
 =?iso-8859-1?Q?JJWFboVAE25t5yzFf0+voAXfumHSFzKeU51EKcqaXyAMBX2neILnwr6Muk?=
 =?iso-8859-1?Q?4JSuIDMgVgT/kxoXFbh+SdhBBN5/uxwBsXbEBsVGTVmDDhCWSjijEXV8bn?=
 =?iso-8859-1?Q?l4F2VGmZdyQ0V93qiHmwFeU7brIfWldroosO7k8uwJPqnz0X1jjTKoDSX4?=
 =?iso-8859-1?Q?PZ0fZCCQ3LRJm6owx4YAc1E4/ksG1HXKl8eOtK6fvbbg2OlsLDOprvPUwx?=
 =?iso-8859-1?Q?0AZmGQatfVRiypxUoQn7RTEE4sJcnkvyZgZyEbYMcfGJtIvHPSI6Oc3DhY?=
 =?iso-8859-1?Q?atN2ZZOrROfM9sDEv23v7hkObfBklzJKS//4hUlZ3GYlHxzdggs1CQQ7f+?=
 =?iso-8859-1?Q?WiLZCwod3JXV9CSw4NPpKB08JjhkAcELSmvqOKfzfZT0ITQFtzr6sYmnVZ?=
 =?iso-8859-1?Q?gv/sHl5mJrqT9IR0a1mOFsHQVesOcI5F4S9dyA7gdg3U6qrCyxTbOfJOFi?=
 =?iso-8859-1?Q?tk/NYtOLz3Jpl7UuniggWpZIUHDieikSlWb7NYeEsk2EiwOqTzduJXtR/o?=
 =?iso-8859-1?Q?+YvyRBzlEhFCTRqtLIeWYSeQK8T+jtY9lFyvHKyCPmMBtPB9WQZyKIRH46?=
 =?iso-8859-1?Q?aBEm4WoMPiE8ixWB2ekE6VfpchuRqUTH0bqn02KmDRNjydfIZ7IzpLFSna?=
 =?iso-8859-1?Q?9ezoONDhOqvxMEmmHanMkUzUMlBD/Z5b4TGdeWJ1UuWLwhLl5sCXqNLdrs?=
 =?iso-8859-1?Q?eAoEcl3TTE7ueSZaGIWJXWUTp87nMOp+b7Odt6s/MYNkSOjig4qMc1Pt6C?=
 =?iso-8859-1?Q?OlbUl3lN/uI7Qz83vTql+pOyGxHVMHkOB3cgoahTWke8FGxex39z1UjsDC?=
 =?iso-8859-1?Q?ai5IQFGuEb0b7qLdMxamFIlyiDFJUPPePM5we6Fn8Pywt0dqM8n9JtU/+t?=
 =?iso-8859-1?Q?80wcXpW4hTlVW+C5b4nt8hHyIdy9HzRM8S+K2VNRGtNJtcgFKU2EEnyC0i?=
 =?iso-8859-1?Q?BNU6tC8hy5oGBSiXEASzgSINgHi9Q1AMKIBfg8IaFeEpLmasQox9C0ppa+?=
 =?iso-8859-1?Q?1kPEGWRpu+8Leov8D+OO2aGKt7WcKfiDB7WEFdPqDg7YZmt92dPY02+4ma?=
 =?iso-8859-1?Q?SfiDpG34mYyLUUIzZeSZkM1Bdp70XWxDFQRKoqwDx9GOQfvlJtyWDQQQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c009deb2-d610-45e9-4483-08dd6b072335
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 19:07:35.8425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8y/MBSiSclYamu3lLGzZjLCDp7eF/4bgIny9W+wTPAqHZOjcPSlBoNGADiVj6mqugL6p3Nvuby3bT24j+T26rx7hRsjWQ1ULCZw/sePM1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
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

On Mon, Mar 24, 2025 at 09:24:47AM -0700, Ashutosh Dixit wrote:
>On Sat, 22 Mar 2025 19:47:04 -0700, Lucas De Marchi wrote:
>>
>> On Sat, Mar 22, 2025 at 02:06:09PM -0700, Ashutosh Dixit wrote:
>> > On Sat, 22 Mar 2025 05:57:12 -0700, Lucas De Marchi wrote:
>> >>
>> >> On Fri, Mar 21, 2025 at 03:45:21PM -0700, Belgaumkar, Vinay wrote:
>> >> >
>> >> > On 3/13/2025 2:45 PM, Lucas De Marchi wrote:
>> >> >> On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrote:
>> >> >>> Define PMU events for GT frequency (actual and requested). This is
>> >> >>> a port from the i915 driver implementation, where an internal timer
>> >> >>> is used to aggregate GT frequencies over certain fixed interval.
>> >> >>> Following PMU events are being added-
>> >> >>                      ^
>> >> >> why do you use "-"  instead of ":"?
>> >> >>
>> >> >>>
>> >> >>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>> >> >>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>> >> >>>
>> >> >>> Standard perf commands can be used to monitor GT frequency-
>> >> >>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>> >> >>>
>> >> >>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
>> >> >>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
>> >> >>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
>> >> >>>
>> >> >>> Actual frequencies will be reported as 0 when GT is in C6.
>> >> >>
>> >> >>
>> >> >> I think we need to document somewhere, but at the very least in the
>> >> >> commit message what the event count actually is. Let me see if I get
>> >> >> this right:  if userspace is sampling every 1sec, and assuming the gpu
>> >> >> is at 700MHz for the first 0.5sec and at 1.4 GHz, userspace should
>> >> >> expect to see ~1050 as the value. Correct?  I find this frequency
>> >> >> handling very different from anything else reported via perf. Other
>> >> >> than i915, are there any other cases you know of?
>> >> >
>> >> > Yes,  user will see a gradual ramp. One thing that could work is
>> >> > something along these lines:
>> >> >
>> >> > @@ -324,7 +327,10 @@ static void xe_pmu_event_update(struct perf_event
>> >> > *event)
>> >> >                 new = __xe_pmu_event_read(event);
>> >> >         } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>> >> >
>> >> > -       local64_add(new - prev, &event->count);
>> >> > +       if (is_gt_frequency_event(id))
>> >> > +               local64_add(new, &event->count);
>> >> > +       else
>> >> > +               local64_add(new - prev, &event->count);
>> >> >
>> >> > This will give us instantaneous values and will not need the use of an
>> >> > internal timer.  Should be ok to do it this way?
>> >>
>> >> yes, I think it'd be preferred. It's much simpler and don't prevent us
>> >> from eventually adding an avg_* event if the needs arise. Which would
>> >> also be clearer on what that is.
>> >
>> > Instantaneous values would show 0 if the sampling instant landed when gt is
>>
>> instantaneous values make much more sense from the perf point of view
>> IMO. perf is **sampling** them - other than the same thing in i915, I've
>> never seen an event that returns an average (not even documenting it as
>> such).
>>
>> What would also make sense would be to support perf-record so the
>> samples are recorded in the buffer that is passed to userspace. In this
>> case setting up a timer to save them (since we don't have interrupt for
>> our pmu) would be nice.
>
>Afaik, typically userspace calls into the kernel for PMU counters
>relatively infrequently, say once a second (1 Hz). However, if this low
>rate does not yield good freq values (say freq is showing lots of 0's), now

why do you say it's not getting good value? is 0 not a good value?
Should the kernel be returning something else instead of doing an
average with "lots of zeros" and returning it?

>userspace will need to call into the kernel more frequently, say 10 Hz to
>100 Hz, just to get good freq values (all other counters are fine at 1

It should be perfectly fine for an application to setup a 10Hz timer and
getting it multiple times if it wants to average.... I don't think it
needs to be at the hundreds frequency.

>Hz). This increased rate of calling into the kernel may be ok for 'perf
>record' but not sure what happens to say 'gputop'.

oh no, perf-record works diferently... it's not calling into the
kernel with that frequency. It's perf-stat that works that way.

For perf-record it more like kernel pushing samples in a ringbuffer, shared
with userspace, and then waking it. We (currently) don't support that
mode in our implementation:

static int xe_pmu_event_init(struct perf_event *event)
{
	...
	/* unsupported modes and filters */
	if (event->attr.sample_period) /* no sampling */
		return -EINVAL;
	...
}


>
>I think considerations like this went into i915 deciding to average in the
>kernel.

as you noticed, maybe there was actually a lack of thought on the matter
and then later it couldn't be changed anymore... ? I saw several odd
things in the i915 side. Exposing something with a Hz unit is one of
them.

>
>Also, if we are going to expose instantaneous freq, if gt is in C6 (when
>userspace calls into the kernel to sample), could we save and return the
>freq /before/ gt went into C6 (to avoid returning 0 freq, and returning the
>last freq as it was when workload was running)? This might be sufficient
>and remove the need to sample more frequently, though not sure how
>complex to implement.

if that data would make more sense for userspace, then I think it should
be ok. So, let's say gt in in C6, what does make more sense for
gputop-like and turbostat?

1) read 0 from the kernel and report 0 to the user
2) read 0 from the kernel and report min_freq to the user (min_freq they
    can read once from from sysfs)
3) read min_freq from the kernel
4) read the last frequency before going into C6

Lucas De Marchi

>
>>
>> > in C6. Also instantaneous values are already available via sysfs.
>>
>> with the caveat of a slower interface, but yeah... that's why I was
>> asking earlier: do we really need this if it's already available via
>> sysfs? I was told turbostat wants to consolidate all the data to be read
>> via perf instead of reading a bunch of files from sysfs.
>
>OK.
>
>>
>> > Also, the way i915 calculates the average freq is itself
>> > controversial. i915 computes average freq when gt is awake and disregards
>> > those intervals when gt is in C6. There was this patch to suggest that
>> > average freq also take into account those intervals when gt is in C6:
>> >
>> > https://patchwork.freedesktop.org/series/109372/
>> >
>> > But it was not accepted since it would change uapi.
>>
>> one more reason not to fall in the same trap. Let userspace decide if it
>> wants the average or not. If it'd need to sample too frequently, then I
>> think we need to look at supporting perf-record rather than doing the
>> average (which is actually an integration, using the rectangle method,
>> and then dividing by the perf_read delta time). At the very least,
>> rename the event to make the avg explicit.
>
>OK, we can return instantaneous freq for now and if that doesn't work out,
>add an average freq later?
>
>>
>> Lucas De Marchi
>
>Thanks.
>--
>Ashutosh
