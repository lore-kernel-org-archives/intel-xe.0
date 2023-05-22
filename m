Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6987BC7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 13:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CB910E31F;
	Mon, 22 May 2023 13:12:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86D10E31F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684761165; x=1716297165;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=nu2Pt8PjlcX2FOATpg/MAW8yOGByqxoBZmIIUR6UDko=;
 b=jJAxZfMPIFT3fU4iKRkMkc69wVRYhohISiP3NiCI9CP9KIDFW+DI3KLy
 aRQnpvQKOM2bbOz+twRkZAOVSo2KlnrHAqDG9jNuPlfkUqt4xIuhq7U51
 DEDMb0nVQicy1hzWrvOn6bDx9Tf3QkEaBl1FKKxXdbPvGCbbjtpvo6ttq
 K/+Mw64LdQwR5HO/LM5ozEyOXuyxBmQ18ZSMAg8pDw68oAkqYob7KebOs
 ts7nkNCDcESDjjJeudaO0cRR84fpGHptLpXU0XGQatU+mfLQzvUaZ+02u
 l3vdDL1zfQkBuhqf8diNve7yqu9NmJU9l4DuRzni+Mwcly/RayaG9+N3x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350426228"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="350426228"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 06:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="703504338"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="703504338"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 22 May 2023 06:12:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 06:12:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 06:12:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 06:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCbzL9q7wSqKNfdolvzHiDMFjy7QsSpux53T0z6U1GP/U41Amq9vf47BPNElIn3MTNcfYC38D4pevQY3ujF4+I/PDnkY6kRs01jFI/pm9hjHSNz4Lmk6uSFlCJKoKBOsFF7zOOT6tidW1AuNTnxqFY6aVDExPrJXI9DQ81aGc5iYoAApaDjwqNslOj7uemv2PfwlV5Ncm0XjaEN21CN9zCXsodaU0KQwSj/JzHXHP95HOmNA9WaORbX3AEEboN5iFvJop3lsSV2lJuVxSLfDYkM+cDFDyrCz3qqymXKbeGHyUMIjkRlhTqhzpqFZSEurML16tW9TpShEaTLfV0JGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu2Pt8PjlcX2FOATpg/MAW8yOGByqxoBZmIIUR6UDko=;
 b=aHLHLt9V9n2Toy5Qw1Q39SaPMs+e401m9X3spqbWBAJMAmchovurY3uMnZpgA+DGo3WinzsyHZ1OF4uKfkEOHDR/aUeEd0cG7GCzIgMH0/Hg6MMg9nADF7EtrRVJ73pLTzuT+p5kCg+Z7vDQjrrkMYK46vgbpjv3WkSCzhRO/EI3sBgPmNySbTiAD23mca1L1h28DyIWArUQHeVPeEVKbTtC8pywce7eBe0dc9GLE0reuwNjCPhXMuSgLLXKiG9g2UsgbLCW5gmmRTKLDGBgXc1YzxEaE9qjzjGSyofrKoEZXyafTNYS7RYPnhRsb9WS5h8obHzKqS5A1TUNXEPGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:12:38 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 13:12:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230522125529.52695-1-gustavo.sousa@intel.com>
References: <20230522125529.52695-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 22 May 2023 10:12:33 -0300
Message-ID: <168476115309.2146.17277236764439701502@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH3PR11MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5c6ddf-3266-47d4-2c6e-08db5ac63765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzHzXYttV6hOQHyciLkyFEYtB5NObZR3JiN2IbNKliJb3EkllZ4jJAx7CQTwgwiVEyLwSQzbKPlOkpchsmMFTpMR8DGAj6KG7reI8EYpnfDY768foSlmQaEDR790Ny9It1S5X5ZONhKcFajtuG8PA4M3T3Yd+kyde9I5sfLreneAY1mNU0uplJ2/kyCFUqzGga8Jl2R6+3usTDh+LRvzvopAZBSMc1hqYUFLqiuZ9KuDGT7jm82rBqHHYxhrHTMbVRP3sQT3m/TIZnQ75ovpcYMzRHHNcfSffzFwPu7x17+mTl0uFjFvXQ9r8fP6VPuN2Q0wqreMQnnpNe8UMUksJPiFFt66SU7z4Kakchl4tkoKI/qPSHD/CkMe7UVFwpoKNbYfUQ3X+iLPEyXRcEN4dig3B2TgZQj1M7HvlJYunS3R6t/4EUVeTX0VZ0qoVzmbbCYT86Fz3SoCCnzib1scd2DXtnZorfws9dX5V+p6hnJrnhhAp+AsX592FFJSIi08
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(2906002)(5660300002)(44832011)(8676002)(8936002)(41300700001)(66946007)(66476007)(66556008)(6916009)(316002)(558084003)(6666004)(6486002)(478600001)(966005)(9686003)(6512007)(6506007)(26005)(33716001)(86362001)(82960400001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFBUmpFNlhHR2RoTWI3RU56bWVVcHFQNjltbWllOFdrMmVxYTlkWE1wNGpV?=
 =?utf-8?B?OEM3TU1XclZta3FJVDEySnJFTjk5R2FqN2tmeU8yTE1Kd2t6enR5N2VnUDV4?=
 =?utf-8?B?RHF1NzJ1QUFKS2dTLzZJS3dhenpJRW1yeFV2eFJPcHU0dW5nS3dMeTZ6VmY5?=
 =?utf-8?B?N25lTkRvUVo3bWJxQXhac0JkTHNYdnVGbHBJUkpFdFl1TXdJa1c0WDBFLzRi?=
 =?utf-8?B?VVpMaWxNK0hTbEZucEEyeW5GSk9KMVRrSzRBZ2FodTJGalIrSURmdWNtd0xJ?=
 =?utf-8?B?V0hzN3VJSDZINElmMTZwbUtHMkdsQlB1Sk9tbk1KR0lnR3R4dVI0R2dGWXE2?=
 =?utf-8?B?SXRCZkpMVlBabVVycUlBN1lxeW1ESHYvSlFOSXhnTkJKczg1RWtPYmxvOFpI?=
 =?utf-8?B?cUhtQy9MblQyVi85MEdVN2JTS2tCUVM1OFZncWpLWjF1b0VJa1NndG9HVmNt?=
 =?utf-8?B?S2FTaGR3SUhlSlFrSnd1RVNVamI0WlYwR0Y4VWd2YVBIL0xwOEtud29TbFI3?=
 =?utf-8?B?b2FmbjhwSStjcURCYWVBem5MWE5yQnRZVHVGaHBCaGc5MEtkY01NMUh1YkxY?=
 =?utf-8?B?RHlsenpybFZMZmhyUmdMd1Vtd2J3cU9xTzUzcWVNSVFvUlNsbTNPUFNKck5y?=
 =?utf-8?B?L3JVQmRacXJrbW54NDdQTzBFbEduOFhiRkhhaUJmd21MODlkblN1ZTZ5T0ZJ?=
 =?utf-8?B?OEhmbFdoTEZ0L040M1ZoYkd5Ri94QnlxbXgyaXdzdStwb2V6aDhUeGczSzJR?=
 =?utf-8?B?VnltS3c4SllzL1E1b3gzTzJrL3NOWnRsVGMzaFExRktzUlRRbTVpS3lxZXNz?=
 =?utf-8?B?enFxYkd5MGN5TnpkK1RVekFySGk0ZzJEQWpSL3ZUOHVLeGF3UjBVTGg5TFA2?=
 =?utf-8?B?ZzJTYlVwREUwUERYazlNaTk0OVk4b0s5VGxNZ1BkbzNxSWJUVkZxeXJPMHda?=
 =?utf-8?B?eGFuWlg0UWlXaEdPaVFvV2luN2FYa0g2Q2NqWG0zNmZ5US9aTE5Pb0twRW9N?=
 =?utf-8?B?aEg0UWErUWpaTTJkOXJ0VWNKSFRBNUZhTEpZajlYN2M1WnM4Yk5NTVhaOUxS?=
 =?utf-8?B?K3QweEFHUmZJUW44NXkrM2VIR09ielJxU2VjK0kvMWJhSC91S0pyMkdCVkJm?=
 =?utf-8?B?SWJzZ2NzNUJDYWRObncxK3QzSVFYaCtuTTVmeWVmMGJYSkY5L0tqSnZ3cEZa?=
 =?utf-8?B?YmltMktwc2ZRY2RTUm8wbnJwS1ZwRUdtZW8xMTRaaUFRUFNjMWF2a1BzWTl3?=
 =?utf-8?B?dnlnNDRqd05KNU5MS0VmeHN0M0hoSG83YUN3ZlJEYkliVDdJSk9WMVFkRWxD?=
 =?utf-8?B?ZTYyTm9wVVhZMG1manpGbHBNOElZNFhiL3BmekErV2JDNVVKazUyWnpPdmlY?=
 =?utf-8?B?dW5kSjViVnY5NGlVSkZZTDhhQnNjbUx0Y09maDJ1ckg4dklKUlRsUUo2MnJD?=
 =?utf-8?B?d1hzRndYcDVvUHgxeno0MHgweHUra2tDYUxEdmdHOVNObE9iRnFZRXVtYUsr?=
 =?utf-8?B?OXZCZzNaNHZiZERmMTV4eExHZ3o4d2dCWmh0ajRHTDFWTnZLSDBua2xXSWFR?=
 =?utf-8?B?UTloZFNCSzFuK2hJc3BKRTZ4akdzQUthdE44d0dFVFNvL0kvUExEa0psaVh5?=
 =?utf-8?B?ekRBRFlRS2lDNVJHOUlWaEdBMi9QYWNjeVJLckQ0SzNqYmlGd2FJeFlENW5x?=
 =?utf-8?B?SnhFd1VEZ1BacWdWS0NQby9Kd0JQSTgzMUo1VXBUSHRQQUhUSTJtQnhaSXlo?=
 =?utf-8?B?Q2UwK0hSTE1LUXlpOEw0UTFzMFRKcU5ESk9BazFnOWxNall3MkJqVDYyMHcz?=
 =?utf-8?B?R2VJb2pCOVllRHo5cFVDMkN0bC8vY3F6bnlFR3FpWk1TUU9ZNDRhbU14NlNr?=
 =?utf-8?B?dU9hdUJGOEJJaVZ2NW5qb3NzWUZCSDRHbnBBa1JncENxSjQrdm1SNER4YmR6?=
 =?utf-8?B?VTBEbld6OGhGLzZWMUs4Q1FzMU5sdDROc1grSkVMdC84M0YyTW1hSU12TVhF?=
 =?utf-8?B?V0ZWRTlWZ2Rtdlk0OUorSENRbVdlK1UzVW5uWHBFUHpvRGVxQTBhKzZSWTR5?=
 =?utf-8?B?QzRlQ3Y4NzVYbXd1WUh1L1VpUUN4MUhsUHNqY3EwSHNEQXFVbmxabFJTQTlo?=
 =?utf-8?B?aVR1eTRFbDBTT3pXck5maWpCWnZFUWJwbE9NTVQ2bzZtMFEybUYwOHNMSmZk?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5c6ddf-3266-47d4-2c6e-08db5ac63765
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:12:38.4556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chf+2H9sPwwtDkCYXu8gEJMjLtfPlZAtHBx7irN/WAsDTtM4IsQ/1zb/kX6ghqGGPvNprFHS2tjheYdRppwfXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display
 support
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

Hm... Patchwork thought this was a v2 of [1], which is not the case. I gues=
s
I'll need to send a proper cover letter next time for single-patch series w=
hen
the patch is a fixup.

[1] https://patchwork.freedesktop.org/series/117592/#rev1.

--
Gustavo Sousa
