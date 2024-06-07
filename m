Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C66AC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 16:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3FC10E0D9;
	Fri,  7 Jun 2024 16:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dM2+Lzka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C01C10E0D9
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717777112; x=1749313112;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X9QokesxJOLtGtGzvoiPi0EJ156TuCwdH9fy1HrsIuw=;
 b=dM2+LzkaOgOMUKNRAifNm6AqXkgm7tG+5z3+V1C79oCqysZgUL5k9PSL
 qoNKM5hHSCXXr4XHVQKfw0ipKvpjsWPfW24BtlmKqt+bQVZOSyOBErtX1
 mZBBc4uxmHSdaywcT+92GmPObQInKJqr2nopwICBxqI0A2/8LRwrlFxsS
 i9Sytj2PrgN8Fj8rmoG8BXRAxgH6471DL+to/Ciy6NgNFUys7kqXNCb10
 vApf7pgnTaDdA3tqEoRt1wk/QOh2R1I/nAQ2We+n1BC8wgeUB+c1bM80J
 NTZIFnEAyrHv9CznrNboHu46zt1a11dt3M+ILBklapLDi6fYWT9wN29E3 g==;
X-CSE-ConnectionGUID: ey+77AbWRfKuuoCgeAtzxg==
X-CSE-MsgGUID: 5UH2v0kiRTCC6DlHCPkj4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="39905557"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="39905557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 09:18:31 -0700
X-CSE-ConnectionGUID: 02sG5Ny6QoGw4Wwkqkvn4A==
X-CSE-MsgGUID: M6raObb7RVKNX0O1rwxUaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42797005"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 09:18:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 09:18:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 09:18:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 09:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYzAqpp4J2j65NFB7xTfBlnCf3ffmWraw//30tiZhMcHHf22s4pc4goyLm/iCSd5GX0Ann3Mspv25TDMSaU57D3N0qj7k5M5DbtQyitObUORyn3ISHlgj0O3cvT4fjgyQyd+laBO7eXp1G/facsd7rgKtlYI9tORh84EDJFV5G1E+2pyi3yLbuhLEpVSRtHmKyvl8FP0CQttDtbetCIhg4w/dw+R1iM9WXNpLv0CQwaEcdYIyrv5GmZLrSAyq63yBNXNGDCAJmkF2vkA0cG81bm7RjcF2DJsZXnZnOiqn1HeACEHGtRG2uEOqf4gmiUidiRpdsx/JntdpqaXQW4akQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/cT8YUbqF2P6kkCLDzMWeeCuhjE65q0vfL5fApofM8=;
 b=SwPjDO9fLo031r+48QRqj1YzlWDlARKiuHXqGwYx++8ohHKLguDmY1i8/za0nS+LsQn75wDn5F1RO+cQAkFThJorqFY4l+Fiz6urQANymNvjFv8TPDc0ICfL3BIQjVhM/863v/f0RYxjBdoz21FJ21TPJvNMkbphmxbcw84HvQyGZ9rbMTtZYQhccAifBfm2ITxqPdmor+M715KJySg2J5faWU6PMb3oPKtwhJZrKVbV3HVSd/b4peDPXmm3D+ZtAWJ/EUXSqprjqPGL6Ykb3NEy/J6AyQ/Nfm+DGXOGAyCggKGjRTvvTdGEfQ0uA9QZ2n6xReV6A0AeCzHxx5azfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Fri, 7 Jun
 2024 16:18:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 16:18:26 +0000
Date: Fri, 7 Jun 2024 12:18:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Souza, Jose" <jose.souza@intel.com>,
 "Jablonski, Mateusz" <mateusz.jablonski@intel.com>
Subject: Re: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
Message-ID: <ZmMy0BXpgu4srDmu@intel.com>
References: <20240604184700.1946918-1-matthew.brost@intel.com>
 <CH0PR11MB5444AE223F9CEA03E93C37E6E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmDg8mpQ1J0lF9D7@intel.com>
 <ZmEjMXSuOL36tiQ0@DUT025-TGLU.fm.intel.com>
 <ZmGIjwoJdj1EKqIU@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmGIjwoJdj1EKqIU@fdugast-desk>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: f45d508c-1f83-4668-03b5-08dc870d7629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bj7dvyNwJWnOxASsHcGGZEgznubtOAsSfyCApe3LudkgRKbugW/lQbG8eL?=
 =?iso-8859-1?Q?TdkIVMmLsuW3gU7JV93yd62wDHOBUNjp6lLIYR/C5fpGgjPrhpYhgq+WIN?=
 =?iso-8859-1?Q?9w4yyxtTdtnDiOioCYoC79Oi8Tfvp38pZV5OveMpLOL73cR51dyhScWM8G?=
 =?iso-8859-1?Q?5jNoFBb228TnpT7UkybdZ9GRKTd5A/Aqedx/TH7gv7H4wph8LodxBTq87l?=
 =?iso-8859-1?Q?KAzX13HGV4SRnCSOQewSCHllKCQHgdxVSuNHVauyKcDdz/ZV7Z+kosc28L?=
 =?iso-8859-1?Q?weCWFfIs34CjEcUZ+OsGUQUIct254cLHFq2iuPIiENftPjZlPa1EHAjXZJ?=
 =?iso-8859-1?Q?pgQP+PJflq/fc9GDjW3kJTQGg2PlUm0JDOwkefYGJMvIyvE1xZmN5Q115/?=
 =?iso-8859-1?Q?0xTjlTcFvdbFsH7scEqlqSkif6ueZmzF/G07oI+9L//yvdbFlY1fXvkCp+?=
 =?iso-8859-1?Q?RCr4ckqNHBwu3V2UYyV7zuIgc1oiMeJt5Jx2CVgWHphRlGqghHns2+z0Da?=
 =?iso-8859-1?Q?dss398mlH10VEojoVXx1BhL/RHk9s3lltU2gE9BZDAiSUFgfbj8zm9n7qj?=
 =?iso-8859-1?Q?AFQDr/4zWiEFNOsnNQ70EHCfUngBcToxq/JGvoHhTaOZMB6uEEd6m2CKJ4?=
 =?iso-8859-1?Q?l6QekOUqjbUzElOn7bNoLVswWi6O6gs/BnhzNKSC59Jp/eZUbGCiB+srY2?=
 =?iso-8859-1?Q?qP/SlOyON6pqlezV3zytZM6FVwXyvLQKywQZwIpE3DaAqs5eZDp2/bUbpj?=
 =?iso-8859-1?Q?4j8D/RABBMPzrjuvETCjm3YbVVrAnzVvvkZBQHJSrZvbn44YRzyWvceRLa?=
 =?iso-8859-1?Q?aS0kYBjWhGCE+mQdN4e+aIboQJTcZ5YuF0TkMPv1V0MWRmOncM9VWWzrgn?=
 =?iso-8859-1?Q?JkspdQmk/wLsas7H1HTfhQhX/Yhyfd+hk0Bg1+tWeGVlIXWWcM848e8XtY?=
 =?iso-8859-1?Q?D6B8PIrMKSSAykL1ZBgjVfW1FUxk2PAuYXg9IgCJs75xf2G4VbxFUi2ywJ?=
 =?iso-8859-1?Q?Az2ykMqemEbNZC5MRLb7u79qZy1N07y17E1FAVvEu1JD5dYXJr4Wz8zSrP?=
 =?iso-8859-1?Q?n1XHvJMwQ5mSnKKCKYFfUXYnanipit04YK0/XRqzv/bjv1HSRKEnsRMe/H?=
 =?iso-8859-1?Q?NRUpZxlJ6OU2KvzAqKNAN7ZAq8na7imD7/4CcCUSgPIlmGY7RK0ztwS9ry?=
 =?iso-8859-1?Q?3SXKcdb6Cj0eMb3mlaY/dhFtIaqAW2HDMUQmALaNazQt1YPAgybq1dWY8e?=
 =?iso-8859-1?Q?q2CShf2DZGGp03swrQ7GuzuwNzSxpYogOJK7bSEERXAcGqn4dQX26aDB3C?=
 =?iso-8859-1?Q?LATzaAGDdToHB7372whtJph4Ulhiom/iVmToCPwNYlR/j5vNFagyndJHG4?=
 =?iso-8859-1?Q?Vjj3OQPUl9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vANtSjKYVmx0019DQ5i6UvQFgqMb+izS9GAj1U3QlbXvJHGncR80785jEf?=
 =?iso-8859-1?Q?o+Tzp67zsw90k8IxffH8PgHXZcDWvEWuYr5jyVokpLlYv3YDXZz4cAmMk8?=
 =?iso-8859-1?Q?ekhx0Ur9nSj0Dy8ayxFaBLROVRFoQRfXcbt9/V/6XTjux5GHykMc/6m/0x?=
 =?iso-8859-1?Q?1ylBQfkSFMKiuBOrt9b0OqXZptRyqM9iVoTPYXfR/2YW3wYBtnGAa80Zp0?=
 =?iso-8859-1?Q?CCb3JIc+t9hmKSthOjb/j/T7mKb/bDc4tKIE/X4MnOh3K2QoDRvNn3HpO4?=
 =?iso-8859-1?Q?oAf8sdp2IU/OaLpI0T7Zxr53QR1tVEjhUAcTWoIxefRt5XcfvbMJAz7Dz9?=
 =?iso-8859-1?Q?jr6qRVgx19BAtZzbxvWEtBi4DOQexm4gtsVX2kav6ixL0a8ZGiRv8Txpfz?=
 =?iso-8859-1?Q?mVee7MdLH8lV5BtoVZ/ygXyZfAra1eAYJhhcN89h2sIEmPc9ZKVMYNRwe1?=
 =?iso-8859-1?Q?dopGXANmkiOuBA6IMn//voQ0aOzzPya+171syjmoxkJlt75Cl1DODGRo7v?=
 =?iso-8859-1?Q?GOJxzbOvQhRFx8Sc/0SeL953y1Rv2J3qXCQ2bhj1hOJU4wCrY8Fd/G6MLu?=
 =?iso-8859-1?Q?B59vtHWh7+ARQKqS/9deK3DKb01YyYh7SAJp9uelmGPs905cAYKGpi516X?=
 =?iso-8859-1?Q?8JNn7RseH+ItdfuT23b2wcf3y3KW/QINXOtc34zs0Zqyf5UCmAN5qw7ldm?=
 =?iso-8859-1?Q?5UERzqNpC87j1ElLPRFBXDpzhOhS7mRcM6xGN55OLRRoKuaqzYWEqz1MwR?=
 =?iso-8859-1?Q?q6qXdFhNNk99ROZqgIvz3Jk2C1G/jDKrxaGWOk9CVwtNZcj8eunuLt92xw?=
 =?iso-8859-1?Q?FzTcI++3qKnX3Wd4lyXoP6TQNRzB5uXxC4IpoSbMJj7Eepfgq6P8xXOZ0h?=
 =?iso-8859-1?Q?PYrQbrBqHjNvdSINQAJR2HTeYUAxtCxzWIg5kHNB2wnSczHRBpymL9teF6?=
 =?iso-8859-1?Q?QpLX/0uXuyR8zCGFQEl2UGzp0OoqBQrh1kLO9WjH9t8Sr4fIAKgovKKLVM?=
 =?iso-8859-1?Q?wJNrUA73mNS9oW/7FEozpByyxKvY7zsHabTowJggD4kACBIVMX1dS3taAo?=
 =?iso-8859-1?Q?fAiVMW9PKqDdmibKHoh+qlrQ2E6kT512D9t5xKcjcBJAb7GC/zH/weG14M?=
 =?iso-8859-1?Q?GTk9CMK/0R0eF+n1vX9DT1w1eroAD+j37NjbN5tODWrMizLopjZeFUvBJn?=
 =?iso-8859-1?Q?kkV1DF1V+MfwT0XQHTrgZh+AnZ3138trgOe/FKs7idNfFqX7cclyxMfpxa?=
 =?iso-8859-1?Q?0eiW4SJ+Z9d5ox0yzkz6Y8+TkEcnXDN/LFC2MPV01140zdez6vRI9zBfly?=
 =?iso-8859-1?Q?L5/j5+/Icx8cHigFVNmfNct4y6cT9oa4Yrz8E4lWc2lIHTiGKXjBzVBxnB?=
 =?iso-8859-1?Q?xQbizZ8PFfg1Ofa3nb0t6SifwuSomq9wG5DwB2QlcCHjpyr91kOvPYFOis?=
 =?iso-8859-1?Q?RgE957m4Kj+EbRTvxA+apqwZN2qILzXrliR5p4IzeDSKqNEUiYM7hxuZCP?=
 =?iso-8859-1?Q?Qz1C+gaijw/B2uszKaXT4t0jk2DcnlMoNxg1AYUkuLUWTVmkb7eKDVCtoM?=
 =?iso-8859-1?Q?5qAigCH9gp8i/Xnt3/G4HnbPkIRfxoeqOMz2X7qUn+jPKXY1UEE0UBv70r?=
 =?iso-8859-1?Q?SjA8xINUQ9i6cxii5ZUjxePUBH/sl5vM39?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f45d508c-1f83-4668-03b5-08dc870d7629
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 16:18:26.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qq8oKkb+ZzUYoZqGAqmjB5/4FwQJWzi5irekjBbCXjauspZ6ci7WEjfR/JvNo871rEXd2Z/2SkG1w4Fng04qwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

On Thu, Jun 06, 2024 at 11:59:43AM +0200, Francois Dugast wrote:
> On Thu, Jun 06, 2024 at 02:47:13AM +0000, Matthew Brost wrote:
> > On Wed, Jun 05, 2024 at 06:04:34PM -0400, Rodrigo Vivi wrote:
> > > On Wed, Jun 05, 2024 at 09:01:06PM +0000, Cavitt, Jonathan wrote:
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > > > Sent: Tuesday, June 4, 2024 11:47 AM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > > Subject: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
> > > 
> > > please prefer drm/xe/uapi: when the changes impact uapi.
> > > 
> > 
> > Got it. Will be more careful going forward.
> > 
> > > > > 
> > > > > Clean up laying violation of setting q->flags EXEC_QUEUE_FLAG_BANNED bit
> > > > > in GuC backend. Move banned to GuC owned bit and report banned status to
> > > > > upper layers via reset_status vfunc. This is a slight change in behavior
> > > > > as reset_status returns true if wedged or killed bits set too, but in
> > > > > all of these cases submission to queue is no longer allowed.
> > > 
> > > This is an uapi change that is in use by mesa and we cannot regress.
> > 
> > Agree.
> > 
> > > We need to ensure that no user space is really using that before we can
> > > apply anything like this.
> > >
> > 
> > I don't think affects the uAPI. The killed bit is only set after
> > removing exec queue from the FD or the FD closing. In either case, the
> > exec queue is not accessible to the user by the time this bit is set.
> > 
> > The wedged bit is slight could be a change behavior but I'd argue this
> > is actually fixing a bug. If we set the wedged bit, we skip setting the
> > banned bit. IMO this fixing bug in the wedged series - when we wedge an
> > exec queue it should not longer be available for the user to used. 
> > 
> > Now that I'm typing, I realize beyond that all IOCTLs return -ECANCELED
> > once the device is wedged so this change likely isn't even visible to the
> > user.
> > 
> > In any of these cases - killed, wedged, or banned the exec queue is no
> > longer available for use by a user too.

I'm sorry for the noise here. It indeed should not have any actual change
in the uapi flow. I pushed the patch to drm-xe-next.

> > 
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > 
> > 
> > Again will be more diligent about Cc stakeholders on uAPI changes. Let's
> > get everyones input here.
> 
> Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
> 
> >  
> > Matt
> > 
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_exec.c             |  2 +-
> > > > >  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
> > > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 +++++-------
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++----
> > > > >  4 files changed, 13 insertions(+), 13 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > > index 97eeb973e897..4cf6c6ab4866 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > > @@ -141,7 +141,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > > >  			 q->width != args->num_batch_buffer))
> > > > >  		return -EINVAL;
> > > > >  
> > > > > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > > > > +	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
> > > > >  		err = -ECANCELED;
> > > > >  		goto err_exec_queue;
> > > > >  	}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > index 27215075c799..cf45df0328da 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > @@ -677,7 +677,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> > > > >  
> > > > >  	switch (args->property) {
> > > > >  	case DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN:
> > > > > -		args->value = !!(q->flags & EXEC_QUEUE_FLAG_BANNED);
> > > > > +		args->value = q->ops->reset_status(q);
> > > > 
> > > > LGTM.
> > > > 
> > > > Maybe migrating over to using q->ops->reset_status could be done later, and
> > > > instead we could just check the EXEC_QUEUE_STATE_BANNED flag directly for
> > > > now, saving the change to reset_status for a separate patch.  That way, we'd
> > > > have more room to justify this change in the commit message separately from
> > > > the one made to the EXEC_QUEUE_FLAG_BANNED.  But it's not strictly
> > > > necessary, IMO.
> > > > 
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > -Jonathan Cavitt
> > > > 
> > > > >  		ret = 0;
> > > > >  		break;
> > > > >  	default:
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > index 18d8b2a60928..f0c5f82ce7e3 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > @@ -70,18 +70,16 @@ struct xe_exec_queue {
> > > > >  	 */
> > > > >  	struct dma_fence *last_fence;
> > > > >  
> > > > > -/* queue no longer allowed to submit */
> > > > > -#define EXEC_QUEUE_FLAG_BANNED			BIT(0)
> > > > >  /* queue used for kernel submission only */
> > > > > -#define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
> > > > > +#define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
> > > > >  /* kernel engine only destroyed at driver unload */
> > > > > -#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> > > > > +#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
> > > > >  /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> > > > > -#define EXEC_QUEUE_FLAG_VM			BIT(3)
> > > > > +#define EXEC_QUEUE_FLAG_VM			BIT(2)
> > > > >  /* child of VM queue for multi-tile VM jobs */
> > > > > -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
> > > > > +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> > > > >  /* kernel exec_queue only, set priority to highest level */
> > > > > -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
> > > > > +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> > > > >  
> > > > >  	/**
> > > > >  	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index 47aab04cf34f..4464ba337d12 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -61,6 +61,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > > > >  #define EXEC_QUEUE_STATE_RESET			(1 << 6)
> > > > >  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> > > > >  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > > > > +#define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > > > >  
> > > > >  static bool exec_queue_registered(struct xe_exec_queue *q)
> > > > >  {
> > > > > @@ -134,12 +135,12 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
> > > > >  
> > > > >  static bool exec_queue_banned(struct xe_exec_queue *q)
> > > > >  {
> > > > > -	return (q->flags & EXEC_QUEUE_FLAG_BANNED);
> > > > > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
> > > > >  }
> > > > >  
> > > > >  static void set_exec_queue_banned(struct xe_exec_queue *q)
> > > > >  {
> > > > > -	q->flags |= EXEC_QUEUE_FLAG_BANNED;
> > > > > +	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > > > >  }
> > > > >  
> > > > >  static bool exec_queue_suspended(struct xe_exec_queue *q)
> > > > > @@ -189,8 +190,9 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> > > > >  
> > > > >  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > > > >  {
> > > > > -	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> > > > > -		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED));
> > > > > +	return (atomic_read(&q->guc->state) &
> > > > > +		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED |
> > > > > +		 EXEC_QUEUE_STATE_BANNED));
> > > > >  }
> > > > >  
> > > > >  #ifdef CONFIG_PROVE_LOCKING
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > > 
