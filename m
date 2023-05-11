Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1255C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 17:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59F910E08B;
	Thu, 11 May 2023 17:12:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD7A10E08B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683825154; x=1715361154;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xk1LpHdRB4XZj0MWg6IGVQSIzEEsAcLi46lGnMzacAU=;
 b=VdXSCpLJiyDfGSqOaF5WAOxhCEWvJoqlpfApYFbk8rCTTc++3z8Yf/5C
 v5tCXwBIU46GfVNsDTq0fM1+EY9kTR+bquaELi3t02evJ4wSxI+6g2YGg
 j951mDYn+IWajNNexTol995Pv6NN3inqxRxGUtvmRm169j2zpVVt8i5ps
 IiWkuvgDma7Z0edBoVFy0j9Vwp4H2IIcK+7yjZCjv9Zi6caUL7KS2m+xV
 GPLByXznlkTKgKD+vhuQG9aStKZXWkXbaECKkh8L3h8Nmk8AQGYXLaZPc
 Uo0Y3H35T1ZJ9bERB+l+omQPaq4Cfz3FxefJUyiPseXvBNJkgiGcRyU8n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="352804000"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="352804000"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 10:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="699825044"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="699825044"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 11 May 2023 10:12:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 10:12:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 10:12:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 10:12:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 10:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LINnfsQszGB0UB+n33Bk3DarhFqfL2/czy6J2eF6usiEQqpCxWvtFNc9pBB2YmCZCPspINCmuNGqpXzMBSn2K3XgBnbYf6WjbIv/+K8Ba5CoDo7y0jI0ytOUbiGNBvbVnAw0HHptNa//ZXeQ9sj2YKEZhMMt4QvU9ap1SLJAorGwzYkPfTJjLG4B/J5A0KBDF5ezTYws3lrmt+HgU2lHfzTY09p5F5mo1+oixwMb9IiJkKBMW5obd1xB1aGAp/XiRDnYbfVD+L1jloao5rOkpmDJM7fvori+BLpopa9niXMTxHd5aStsMoGxLfAy3dP6e4B/7V2LQ1zuAaiEBAML5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+75gFSi8CPgs2YCtxI0fah6w4Yco3BailBgn7vqf8JU=;
 b=L+HWy3sD6FCgJLeJYLzciTBJFNlMscBi2pvGtthmyNgPC9rVb+z6NHzJZcxHpClCwCdVN7EM/bCMykhY7yl+jSsiF2UNLYkIHKIsRAoVnQbpdeUALof7W1UaytAu00LAh9sZy4A3chZTfIHNGqUQMWoN+XRNnsypUP7OkRJDntbCrKa3ymbIlw3ViMNrjAFUXR0lWTxMfvp3bqjxdJpXjDMnxQW9rFmskK27hn8gxt3gCW74UQScKcO0qtUw7iraawuiPiM9Ino8CTld/HRMbhJe6JaLQFB319CXW5jroJKvxuuh1QTUd2LAoXIM7K04y6Vc1Ipi3MsvPx60ZXDRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5626.namprd11.prod.outlook.com (2603:10b6:510:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 17:12:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 17:12:13 +0000
Date: Thu, 11 May 2023 10:12:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <njuthgb5uutcknbsxvvvxfx5636bofmwmfyjq6nbxkpbxai4xp@4vwutipfdpd7>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: b5604bb1-fc8a-4787-c429-08db5242dd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5JijTXkDbL5VR7ei17uhv9JX7Iq2CQjO/EIh3/gUfZ8qb6nmQOSW1yh5hyy9kS4gM7ZqwsIpS7j7Xdwo9DECKBdh3kFKpJ3b4N7UKXqXFV8h30EwsDEaS7if43vkpwfrSDRnOz6SanTVfly6GHj0Sf1A9czmk9Xdle0AEZFe9DhHJfE9YkcAyAY6sP57CoOpCPsB3DblR1nbSI0fLW99kcl4nRYSacr6H7xa9Z1gQhi7LJC1TDC25AqhDVoWNYmIXpJ4S8XUJN7daSGX7oMLeuJMWM8ZIGPTvBzQuN+hQcs51IItQMb7UsWGkxZFhiPgbQSonkQVi7Dwwbgwd+QPvEvWrfe4qgFND7r1eSVsGnZ5Uf8+J4RiyKlzRSuiS1N8vjJxyZ869tJyOgFxfhEGcMQAAE0Il8duKaPRK8jlTkELqb3qot+Xw1b3E9Cb6yaAQjfXWQZGoqrwZkxCLnI2hh5lotyjYph1En3LVFAeVNxijUddAF/biIUjH6rMMkmWgZS1R2lkFWVprJiX8VPWYRFLVzBwh2B1NSmezk4Pi2zxwmhKjAF8L3AQuQ53OX2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(6862004)(8676002)(5660300002)(41300700001)(86362001)(8936002)(6636002)(6486002)(6512007)(33716001)(6506007)(9686003)(26005)(186003)(38100700002)(478600001)(66946007)(82960400001)(316002)(2906002)(4326008)(66899021)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p0WhkeCyNKQUHOO67J5+pGnhDdpmQJa7BpaaboDuOLRE6qQbteV7zR/27pxT?=
 =?us-ascii?Q?hJFhkxzbroU/y9vBO4felwoi8mSP5tX/H1Nw57I9AsWO82CttTHduPqjlnSh?=
 =?us-ascii?Q?GLzIQSoP9SWhtGVEud6KZ5CeIz/5NHse4EqtSFdMGo+TvE+C4aciY9QM6r+9?=
 =?us-ascii?Q?lar1x89UyeLzdGhVa2AWjJ4O1bRN17mweW4/UhK21Amylrde82OfYdHxNdfN?=
 =?us-ascii?Q?e4VacfiGgP9kUEODe4W4XEkxBWqwG1cdh0B03vB5FqbdocAJVDKDxQyyAuya?=
 =?us-ascii?Q?Q2mr313+HuX6snT1kLz6Rd31FjA5S6ZSLFZsnx/UZNYMCEDUyPhbteT4k229?=
 =?us-ascii?Q?XXhBaaDsGz0PwWeKbevvWJcUmqdwewlwjc47x0yD5kgEOFenKfl6Y+Rym4XS?=
 =?us-ascii?Q?zWDrK1KtEFW6kd8uMQZ0f1/P/LnjVDRjqdwFdmZQ0gSq17TeP/PvqlfNYcwj?=
 =?us-ascii?Q?/jQNAAwyX5keyoBfMLLxIOwbfzlVuQ7oUkls6V0u9kcdP4b2rZKmV2c6iz2w?=
 =?us-ascii?Q?gSu+QrC3VAh6D03LBSHj2c353+PwxL3i8l5R3jCH8FI5Se6eOMIuaM1UDfBC?=
 =?us-ascii?Q?3CcVPmOXqC9TwGc/eQs75jR9g7MpDl01eJhL23LlIQTK7C0je4r5m5huRqvY?=
 =?us-ascii?Q?M/6dAQodbU5h67KGtPnDYHCd2vCfdEPvdnFdsHuV8YuE/IZvGx8c6A5Vv97k?=
 =?us-ascii?Q?i93/95lrHe8VxNRRclgr9Jo887fQeH6MjOEX52htWSHLflayq3WWq9wdObhN?=
 =?us-ascii?Q?7cB/iXq/MQbkMYwAbYJPlnkLA8KBK55seBJvJC7KW83Rgk/WzP0JLslZi3TK?=
 =?us-ascii?Q?FOtWCgBxRk3NGVP7AOOs/ZsmcQJQ212UmufiXCvzBgWP46WjN5GgbQtpYOII?=
 =?us-ascii?Q?BsZ1LD4+vY17mMyGrYT3Qp9QHfaQmaRSLYUVZlvF9zDMDIYBvehB51XOY0px?=
 =?us-ascii?Q?e4LVzHtf6duehaBRzZoT3pilgHpjUxogrXFajsO6a3HrDaHIZojcScu6PBc9?=
 =?us-ascii?Q?oZBVD++lGJ4Mf+9NQe5wzxGRjUde68Op8O7TNOd6xmLarO0FitH8zd1v/y/D?=
 =?us-ascii?Q?bwyrIbGM8UfVemLL1FyQm2+6WKVuMwet9fz4F7OrZho6KkNiRqjKYeuEbT+V?=
 =?us-ascii?Q?CsysNgIWlwiKWR5W+yl1ETfqS7kt84HyBA6j1b78IRaq12KrzOa0kghDlqLp?=
 =?us-ascii?Q?Nwm/bWRYEGlwt3n90C39qMqlvP2y7GGzsVs+BRRbYo6KJE64jBmxytXegwKP?=
 =?us-ascii?Q?ngOdSVoS8g3O33srLxufWYB2jT6Bax+rgSPFVeEDSAsdyM+XMYL+CVBHV3tl?=
 =?us-ascii?Q?GWu3Y1LsUQtotaimpxeOumGq7inDWFDIHT1wLZviv89TQ5MkaXzJlyVUkG/p?=
 =?us-ascii?Q?14RVoz8HY2eI9KyuyO5wDsJVfqUUbaBu6/TK2sZcFteziHa+ac3PCGIArgVA?=
 =?us-ascii?Q?JX6qYNH9Bos8XvwO65PHwFGaWs66+xIUSXHL8AiJk9QEeFhLahpy0Dpj7JcP?=
 =?us-ascii?Q?c6P7lAZFWsG0IGnXo2vFPlpCWmnJVuq0ywTvrKDTUEwZ1Ddia3jKE+JR6Fkk?=
 =?us-ascii?Q?5bLyIgzyUzKUxnMp09uUPecGPR4AXB0h9Gej6aBGv6mqmChU3OTYwyzM7c4j?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5604bb1-fc8a-4787-c429-08db5242dd04
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 17:12:13.4884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPDAeyd5+g1bYvF7EQSbuj+vkih75T52pKlPxTTPW0GLa1Woakuozj+Hh8Ah3G3ZB4H3sMkH78CEPvl9wRXOddzipjtwoS7J6yM3iVli6vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5626
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 12:47:26PM +0000, Jose Souza wrote:
>On Wed, 2023-05-10 at 12:54 -0700, Lucas De Marchi wrote:
>> Stop the dance of enabling the display-related driver_features to later
>> disable them on display info init if the platform doesn't have display
>> IP. Besides being needless work, it wasn't covering the ATS-M case that
>> is the same platform as DG2, but without display.
>
>Xe should set pipe_mask = 0 and call i915 functions that will handle no display cases.

in xe, enable_display is the runtime config to be the equivalent of
DRM_XE_DISPLAY=n. It is *not* to meant disabling the display.

history why this ever came to be was:

1) display integration back in the day was less than ideal (still is),
    and developers couldn't test things ignoring display
2) have a way to tell the driver "don't ever touch display IP" for
    bring-up situations.

For (1) we may turn that into "disable display" now, but not for (2).

I'll take a look on how much work it would be to migrate to a
disable-display scenario rather than the simple "Fix ats-m" being done
here.

Lucas De Marchi
