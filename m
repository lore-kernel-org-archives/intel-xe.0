Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C18C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 20:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9E310EA6D;
	Fri, 19 Jan 2024 20:38:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD8F10EA6D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 20:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705696688; x=1737232688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JdAE8YlbYR7GoO0T8fbzCTi+aXd2FZ1LKqP8eTyOm3o=;
 b=TJ6XJdq61nB3QZVLAu4OLiLMk+aEggYV90UsPyRxBGxI0LJoigjXB6tu
 G8AHaIf7HUuACtHiUU2XbXOAo+lR8ZGyqrog5P7XnVCVY1sRjLN3a2g/S
 9EeT3XXFmOtWwPG38GFaqFryg1ooCtx4tHfoWgSRzK1fkmkAMmhsqwx5w
 sHzDXVxHMQELg6p8RqKCdbO9n84ugcgi32SnV+No27hOGveDdSi+Xtu/x
 vR3uad/Cht31hL5MBXNP76ule5GEFXiLTY+y4zxBrd0jdt1OGg7zVsdJH
 IcOsK4xaVBhVV25baWQNYP52YSTCzsNX8R8nnNNnKWqEJDMDKQUOyLnmv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19407937"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19407937"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 12:38:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="663432"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 12:38:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 12:38:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 12:38:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 12:38:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKydItNnJyCE35s9GB6jmHcqdGps4A8cYQZ3FcR/OKNef8BBv9S1JHi3Hpp1s2JhVz+l18ZjbeyZbmU9e2CJSdzThzwNGPxcT8fhnLrn531rHhFKmP3yIWzQj51R/aeLgj5xdtBpNoPy4ggQV/Rk8YxBId0KFg8+ciRKjTr1y8YBjKWYGmDXoOATrd7qD3P7zoxxXCL9B3ztWuq7Bx0GD+X7NouwOQKP1vt1cMmf1UCL28+/8mKyeCcjOZpxV2hXlLuxhATXbaEE6G8tDoSyNIFsjySD5BRUNZAjo4btLyk1E1w7mlhDFjckDEEVFObQ4KRHo+jGTS4qbtPAXetaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdAE8YlbYR7GoO0T8fbzCTi+aXd2FZ1LKqP8eTyOm3o=;
 b=M9cLXtgtVZYHxMUdiIJB5cMq6KWpPXpVZOCcAcPMDYwY8A7jC6Bu1OCJ81Mg5PVyOkFQEXa/4wqmlWJ/F5VP1i/hEZTFmgI8A3SPW3l7xmeX2JJg3clJu3h2RCcTwJVXbnu8wlmkp/aCh73UWSlDjHh6mGznBEWTZ0EOSFO3mXzXUMfwcgK3jcmYvu50eP/alKu6AtsrcMB3m2BFUqfpnlWezh5pGaSefj04HVNjlvooes1U1cbmI9713pQ7SZFqLDU8+z4OOBND+k7EZQDaX1RQYaA/AEgH9GazlYG4EiHs8v4RJPYKRevKkt4p7Xoy+5DTDUTOgC4+fPU5A8Lqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 20:38:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 20:38:04 +0000
Date: Fri, 19 Jan 2024 14:38:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Moti Haimovski <mhaimovski@habana.ai>
Subject: Re: [PATCH] drm/xe/vm: bugfix in xe_vm_create_ioctl
Message-ID: <jf7vctl7iom4eduwwdloevhk3si4koghomdxxjbqn3j5hvdpou@gjklslq3zot3>
References: <20240118173155.3851635-1-mhaimovski@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240118173155.3851635-1-mhaimovski@habana.ai>
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: fba56184-931f-455c-067b-08dc192e8952
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A4qRMQ10KvBcq19uDHKth/C2mCEYaU/2OctX06Sr3Pre7dinITfFMmM+rVqWWaJ9qNixn0zQG1BxAGWpHDJaW8pV+X9/IyCELvvDDOLR0l60bsnzBAPu/502iWXqc4yPg6j99q+IR4z3dZpA0CEMXUq/ss+qmbyq5nZuP+y62h3vRFCWXWgIbodATzd8L/nL0HTKstStAywi8JurheLctgWAGn7OT6x36KxJinpVvh1JQGpPvpNBmSv8ka0JA/yb5QFYg7sTUOpGlU8pFPsuk6zi/dBmNUUBT6JyupwXTUtf4Iy5rbZfqhb729k9DFydx7kIo9+dNbbTSHmKysplJRvo9qUCPXigrSJIW9LIbQkavZsri+CdFsaLhj4obUwvZaeTiArkGVkeMpUK11LB7rXECiIzs4U0S9HIIyMXR0qwHF0xvM0/SbK2tRdW/QI6OQp1sJO8Jmn7g83v3HDKxLm8YIncXdcaq0s70BRl/s8ygEDfwDP+3070vlb4W80LA9i7xfpGL6LUfdtVZZw/AUR4krqhIa0XKqG2zJ+5LyZU7XbpdUjnH3LXIFXuZchY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(26005)(6916009)(66556008)(66476007)(66946007)(2906002)(9686003)(6512007)(4744005)(6506007)(4326008)(478600001)(6486002)(316002)(8936002)(8676002)(38100700002)(82960400001)(41300700001)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KH46ZkQ/58xl5K4zoUnpGjXoseqe/NABet0k3V4YLbVae7lxHh3X/fxUsSg6?=
 =?us-ascii?Q?wAdBt6YlccYwS7YdCS98XcGabU2QLhx8i7I5oil/6lw9UuS1Aq5lXiwRHOkY?=
 =?us-ascii?Q?dZXThaV83CDHQ5LeK0XdxHACTGqL+OZuYgm2K6Ssx3MbXx9td/VzHpCoOIFi?=
 =?us-ascii?Q?s/G6u+XZ8AFjVAICYFb+iCZS4ZYpJWRMf3wy/lPI/fE+BpecEi6QBblPXheB?=
 =?us-ascii?Q?Qji46NJ7udNSPWUfFhWFuqsgy1N1/UdzyNqt5mUuTGsyJJq8uYMlxgiQFPI2?=
 =?us-ascii?Q?Jz/MraPNv6DrbI+Sm1WwlWIsZlOIrwU4tvHTP/P8JvAxpbFRRkiwr2ICLGVw?=
 =?us-ascii?Q?x/TrMVZS4Klk5vcJKT/3CyzfG1tIVl1fyzAjGCzOggiiDPNUB4rddel2/zUp?=
 =?us-ascii?Q?IzqplLqYUBn0UFdXMVBn96nU6vX/wLZIxm5T3bl5JoF7Jb5uuZaBVEc5reqV?=
 =?us-ascii?Q?YAmzXRDPSpXgsQ+4hn9qP10UGpOtMUa/ZHd0PTfZSBpSln8MH2XRqx7hwg4n?=
 =?us-ascii?Q?uylnXIC6BrkhibTdNiZGGqUASDQQx6aEEKKYq8TQ5c1SeqAIktsIZGbZKnK6?=
 =?us-ascii?Q?QmX2/VZBwn2Kp72SfDizaKJp84/61hZH/t1UNj04DaJgI4cxKk+WA/qaiKcW?=
 =?us-ascii?Q?uChAlR1C1Q+7gMca5yqe7QFYiFW2yn8w1uWRdK+lmtdyonWdh59hkhNXZ6iO?=
 =?us-ascii?Q?CFMspLJsspMMaotAroOSbkk8BlzRDhRftgKRZ390J3cQvrOwEqloD4NJxetz?=
 =?us-ascii?Q?aZBGN0nqTl7KoEND3O8HTWerivvZ0H3NoswY9LXbKvuFzz7mTyW+2o9yNA1Q?=
 =?us-ascii?Q?iCqp3/4dqWNYN0ILDD89Vh0vuLrm3hxUQrL2O7cnkiLiEkA0jOcJykFAlHe5?=
 =?us-ascii?Q?NqARBnsniGqmg38cGhV8Ghpnh5ogVtH2FoabwN7ffDESUCvczyRBrC8+INJe?=
 =?us-ascii?Q?Py1RKOQuiAKyfw/ihTXasdLLyRrmWgUsZR3dSSYfCfS6YzhW8+nLtXvDu5jx?=
 =?us-ascii?Q?NQGVwlnh7I/ijIzQq437mPoZarnF6lVrj7V0p4HNKbaj6Bh2Sm05QpdjJgIX?=
 =?us-ascii?Q?sKhqt6S9mIjZZ+jr33iInmi/il04rPD+dEE7nYgMkZ8y/9Y7PlP0PBF+QqJR?=
 =?us-ascii?Q?Avdx4lj8SLlqEDDOP/tsYaHmf3kwiz6oqndzOOe0ecjhPWsmR+xvrNGZeqeW?=
 =?us-ascii?Q?BVY1IFiDRjT8YxypMUiama9uZS5EHv8cZD/41whbxaORbq97ninSFlbxEwsx?=
 =?us-ascii?Q?zjn5TB/KgciLBZU3w7zK5S98fKXxtKGd3Em9xoCHVjsTZvawWT3V+JYlPa2r?=
 =?us-ascii?Q?CeXQHq9naxvuAJZlZJqclvTu/gcX2bTtZLnI1Io7B8MCTMlIPUkBhCLjrMaV?=
 =?us-ascii?Q?NFgZ5HHz/CNDe5KAQ54L1YLg6f2D2ow/RjBmQAIf8hzfA0ekJKf8dw31JfG4?=
 =?us-ascii?Q?PS3jBlf8XKPSH1RmN+tjpr2f0TiccNIhlr/CUemhNkgb9BWJTl1oozm8onzl?=
 =?us-ascii?Q?6vNQ9oNzQpxV3rUHCV3dIU6TmZyiM7QjLl3JdgqzDYfNgwUJZ8TQNebrbM3j?=
 =?us-ascii?Q?a6T4oRofOljrdSbvDYwaKXa5byCfoGc7GgWZ1QntIGz02R9UGJ8Mp08a9j1b?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fba56184-931f-455c-067b-08dc192e8952
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 20:38:04.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8iCvx7HizIJpUTzU7JXqdyGtdASkJ7o0PJvIRkNgKBIJ4+8NxXR7/5M7qHGuxqNrS/c8iQUSPdTDHeM3i67dYGa4tLRzV0kCQOZetvqEkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 07:31:55PM +0200, Moti Haimovski wrote:
>Fix xe_vm_create_ioctl routine not freeing the vm-id allocated to it
>when the function fails.
>
>Relates to: FSW-1360 xe_vm_create_ioctl does not free vm id on error.

the line above should be removed as it seems to be about an internal
issue tracker or the like.

Lucas De Marchi
