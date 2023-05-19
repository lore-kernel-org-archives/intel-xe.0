Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226C0C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 15:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C006B10E4BD;
	Fri, 19 May 2023 15:17:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130610E4BD
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684509455; x=1716045455;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HRd42e7kiXVTXfy4h1bBqi45dA1j9Xh0e7AhDaDcbP0=;
 b=Ew2j0V5ela1owx209fewgBpOr2SbB9hBuVsO5ExrO3EOvJAx/WBEE30L
 IByHsOYKN90ICBfk/dIAJwG7MJouwQqZSdX2Zfv2rveSf0LgjeyhbYStX
 Fg6hYk966YhDDbwVHSPx/aAS+20p2mtuCbJRYLVqJUK7kJFJ8I91OdInc
 05tiEG5V8KA4Wd75vIqj3PpOLj4+Qme5cyNXYIE66merMixE8p14tAoIq
 yyBHwLzOspLQh1EJ4vFSEc+m/te41k6rgIZXvm+37s/YjcJr+fvKdZRd6
 RbpYCgC8RwmhnvrlC3gc8KghGmfjq6e7j8BTR6u5mwHIMc4f+URpn1Z5V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352416085"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="352416085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 08:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="735547195"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="735547195"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2023 08:17:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 08:17:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 08:17:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 08:17:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HX2tIeC2o7fHlrdGgBNKc5RJLboPZKBAoa99lSpJ1pt0nAWm3K2cK5nogycQB0nzhm0Yh68eZsoAeQDEZzNGbblJFx9PZfC5vk9IQfVX0D18DJMQMPJoiN7FrYrR9KeuhovhlPq43tnwqBdoqCSZYc0GX3P2WOkhh7dX4e7f8YxrRfm23jeRZTajry0LWJLg8ZAVqUIKGySFyronoOrXjAaaAq7241GTgLxtROGy14uRfOpCiaOvOZ8zUS4TnxcT5WQ4jJVd7784NjpHESteClhqdszZaYWH5MOILW/H2mF9n5reRw8APc4eDNewojnZZbOj/Ss1q5EURhVY0XGgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRd42e7kiXVTXfy4h1bBqi45dA1j9Xh0e7AhDaDcbP0=;
 b=PGVtB5oZt8D6TfEAQ43wDWv0yCoPIS7RSwQbC0j4GzqSif68PWPi6mYu9i1H5c9cK21Lchf0jRQIkbiDu/wJBhProQoD4lpY5vvQq0Ell1qKdk78a3Fd/XrLwnyd15bFj52CmV4VbDI2KRHTTPeo/hXPs99XuiLLCxB37vkknr6YXLq7qIqHTA6RTpKDhlagDpGH+SkyWnLLM+c82iaK1NGhfSPL55RQ1w/U2wk/7tZCpPqFsd2OTlZLPbmeZwax/sa0EzqyQRkVm/o7BY7VVp/dQuzSkZiKA7WZTbeDW7N/MqE8If/vlTbHJ+r//CiPi+MdIWpx0+qZsJZINoe6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Fri, 19 May 2023 15:17:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 15:17:31 +0000
Date: Fri, 19 May 2023 08:17:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <hjf25li44zz4m6t5y56fagqlla3quibskhunleknsy6xdfqs34@ug7y2leoa5wx>
References: <20230519094539.1116-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519094539.1116-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0065.namprd11.prod.outlook.com
 (2603:10b6:a03:80::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bd8087-5a4c-4b83-4c30-08db587c2a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ds2diT8aYXVlAzl5RTUrKNdM7YXPa88DM9ERv/HDYrZrlHqvldIqui2A4xK49X8JVHW0iov1EyHmKqZnkhgZX9um9m8KpGIaDKB30azuKYhdKcncOYYJnRP/YSxHmIPuPxoX4PVA6Rw17rp7wxYgm6XsfjzulBvb7yFkAi9m6o3hEoPgPEMqKk63IvP4oqCwcgAjZxo1Nws12sDmNWBuNvZI3CgSnCdnsJ8RQwk+mNTa4zSA0KZ0PfE7cvYe6bgHSfeaRNYXbLhPaO5Yh8VNhy28cEGmCyoSLUrxOSsLB9kn8zVQifZBOff7D7ciwJ+Qws5cIRZB5VEWODmg0a9TsJX6MzDXeOCnjnYFuWrtTACbflkczglIxr9SgUK9zdA6GFtJp3vfxQMORe9lMsP70w54imCFIusAnzZ5F1/+lcJ1AcRvu68naFmNMLzLQJEIDnYyZCIxTVH3BCpjp8dip14wedVhEdvPivd06cIwRS3bWnWMQ1F5p1ocC2Q8Gicjd1/JzTPFmpc5BD6Wr+oQ+nwjAYdj2JP9an4TPW5RG4fE/XLyqS4WvZ6mDcCfTQVl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(86362001)(82960400001)(41300700001)(38100700002)(5660300002)(6862004)(6636002)(66556008)(4744005)(33716001)(316002)(66946007)(8676002)(2906002)(4326008)(66476007)(186003)(9686003)(6512007)(26005)(8936002)(478600001)(6666004)(6486002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLwmGsE93acGbeQSLPH3gzrzl2DK+S/RU8Nzlp7ETUT4bFljmP3l+/HyWo43?=
 =?us-ascii?Q?pJolFiTE67gmS9umyMH3J20eMdJMRPvAKd9Kquz5/RS7p7u1/nSxPA51/2vn?=
 =?us-ascii?Q?c6pnQEQk+J37v7aNls+d2G3XmPnrXfAxH21RNQEOiOKyyTJ146YoGsewVIRD?=
 =?us-ascii?Q?efOcYl+YtxHwehSOeic6yhD0dETsgI/5KMTW3lFOrXqw36I6euyOSaMru1tK?=
 =?us-ascii?Q?eFE6smgr0fs8S9npcGVejLjZmPmCasUnSAU5oSBO8eECqP/4M7UbMFMRAMt5?=
 =?us-ascii?Q?AavqQ5v/bM+qgaxGJooRVTMxfSsEDHLqf6aINNCv86DqdwIbLX+dQtNapDEe?=
 =?us-ascii?Q?gK27N6uQWZmeUca4MfOIm/oB2oETR24Jg2tYdwF3v/p8ZFcFRzVU4lhk3rz+?=
 =?us-ascii?Q?QqINZmVyyMbZ0LSlzzLDU1Vc2EjQVaFt+gpafzjgwoo7uzS3mszXk0iCsYaW?=
 =?us-ascii?Q?MC7g6XpzUTm70Pa9rUEn44aAqtcuqhiyPpYQip94FpMMjerx11NnrO3lYi/X?=
 =?us-ascii?Q?7yom+OckLzARSNO6/oINddlEUKGJ2sXY0f1ySkQ7euFuwPlf7N3SM/Oi5tBl?=
 =?us-ascii?Q?CSiQR4kZO6s5vHU88kTKXFO9E5U4zUJ31m3ic5i7HRPJ3i8/agjbzbSaJwtu?=
 =?us-ascii?Q?bayP9f50Rem4wCPU/V4E11UgADqK2wS4867Jd2VcGe+nfee5MLGS27pRTuIv?=
 =?us-ascii?Q?E8SloFiRJoKJJaM7JiZXHlYT/44f2xEqE9l+Kgz99Xt+pTYUTGfq/hJKRT0K?=
 =?us-ascii?Q?W98u+Uz9p09EwUWv9qT7wtE6xQtq6DTsqinYJVlBpsHHlZcoyfPjFyYtJJS/?=
 =?us-ascii?Q?q23/lrGh+6bQ8Bynw6hpssvpVhsR2OoBOwMXe26hP89+2KokHt65D8mmWxWP?=
 =?us-ascii?Q?jXHt6YtpDHhHzz6q0NG7LfJag5pc319SF2m/10YNYTg5dN6JxesbNhvZrSOO?=
 =?us-ascii?Q?lzncp6Fz4zzlX1arjAXuLKy2/qglqsY7Zo2dpQjAbDP+slIE9k2YlSFoHvFQ?=
 =?us-ascii?Q?45vo6ps0YniXI6SkMBMg4+Z47qj/72TQTRLVR3lrk8Jhi80a7h70xo3BQn+n?=
 =?us-ascii?Q?4Gvv9HWDMfVDxM0wmgy221g4l7TpxVzRKIVLrs0xDTwlF3+VwFeNjzL/HCLY?=
 =?us-ascii?Q?FnTqvejpgRM7esrFRy+4w+PjRlqMNnwJm9ax6U1K1Lk2sER6qJHhHkeE3wq0?=
 =?us-ascii?Q?L0ZX3m25j3e8sTBKpL7yCOLxrb8V18mwdRsaNZCwZ1deAjSI6ymqKIHl76/m?=
 =?us-ascii?Q?UqDZme5U0WreTdR5ssFQFKuhVN2A74VGjExm4QNiZTDbT37gzOwA7e3knCBq?=
 =?us-ascii?Q?p5JMOZ+p2Dh5cgmbrFMrZ6jXfA40Pgx5Eu58V/osSUEyy2JoJkow6Qb+qaPN?=
 =?us-ascii?Q?xnINPiCD53LfvDoEk5aaXN6/0TgZZk2pmZ9v7xqd3p3IoguSsWTnISKohKgA?=
 =?us-ascii?Q?VrRfgQh/uR6c71Q+k+07BPK1lCCrcjsWpYAWOpPmMZEk8dNyFUvnn1SywrLR?=
 =?us-ascii?Q?5RGdr86oQoCNErkpFbfPuK7thj6Oef+V14W/GcywNvL6SSXmtT6yQufAeF/5?=
 =?us-ascii?Q?oyVa8WmTn5rC2MY+ZBV53RiUoWKZfWzpf7HWxKkFrTg/fIxsfHa5ZVZuFtUw?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bd8087-5a4c-4b83-4c30-08db587c2a58
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 15:17:31.5625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UPBL3cAOHxC7k/LXQT7oMqV8dh/gnV96cU1U+TvDOadDvrn8U7Zem5N9XQqa6SJhyl0331xnvlgV3BqPH7TCvaGionRTDq2s/RykbJEW4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Move Media GuC register
 definition to regs/
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

On Fri, May 19, 2023 at 11:45:39AM +0200, Michal Wajdeczko wrote:
>This GuC register can be moved together with the rest of the
>GuC register definitions and be named in a similar way.
>
>v2: fix placement
>
>Bspec: 63363
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com> #v1
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
