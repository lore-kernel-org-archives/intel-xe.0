Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D64C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 18:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0510EA7E;
	Wed, 24 Jan 2024 18:25:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB6C10EA7E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706120723; x=1737656723;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=jLqVYrzEb9MyirxLdOcVmqkLvn9nDK5jh4/iPNxm7HY=;
 b=BPcVaxfZTWwOr3RL2Nbz53YVXcsa7hCqx+OM2kO0hL8WklvTUo9WWxnV
 ccMQSloKj5ah5hWpEYr35jPmGsXdXanmqnRm4jJ49inyUM09JhkVbAvR8
 qZt78Lf7ECvKRv5EJ/6bdS2UMAQc0l+7aDHgkoqD71v8cDF9MpbmO/Bm9
 u+shqx8oWiOQLk0A5Ha5F9kqlpV5Gm+nog6sGIs9tRPMQX94Dw5rY+76C
 omnN9iW8lX5dJwhFFLb4Y9UrQf31lFRlWUYVPUBQodK6vSaBoTpoElInn
 wU7+bOnfpIhymtCOTsx9dxzRHql5jE5+Ewa2HdK3SbM3xMVUnXij7Al1l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1825355"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1825355"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="34861814"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 10:25:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 10:25:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 10:25:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 10:25:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogKlLDEOMmDcvBhVZ8ZRWAUIEk3Ie35SmRGm+FDnXgbOAiuXJjQKlmMtMuPd7VsCmMx2gIvivK39Hnf1Kr2FuVKZlkZlLCIPkJFFh6KB8y2F62/CoZ0sLk3xRUMWR8FJ/qwv1TBEskj/2Mh3PwXxsEurZI+UDdWLmnOoSfkXPMQK4VO3KgjSZG9lV01vslas+pe8h/J3plJDemUlxhYRn76N96quiJ+TOwYITvhvF7YgW0/7ZHKhxGxITLZ/USNdcvYNSzn0oUe/ItdxgOfEA1W46jzd6UCp2kxwmvU3ig/MiSdyg/MKcJLhJWdaQe/1HbRMqXoAmQ0R+lv6VQUS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLqVYrzEb9MyirxLdOcVmqkLvn9nDK5jh4/iPNxm7HY=;
 b=FZF/yzT7p9mojbgA/9jvACtU2f8JCAtCVOntccnGGW9pU+jfatHC9cSOw9tHh5Dd/QaAaslnNmcDGJdLwUDqeOQmAZz020zgMbspyROnmN8FlYKwy9hf9/L+Zua2enIGNj1ivLvqNryxpW+a2ipqalvPYcG5XXeUY3MkUy378bYl5Ttc/uHPa8PrCeUJe8lvifopUtxNXDKT6RVKbkjMo1IL4ZgDuFIWwfyOwzaAHr+aIxhiRH8740LOsz5+It/EsSv+xf26pFa0P3NzkmbKSHDsJ8p1qMOudlnhYorPMr4XqlAdVy+33oUn4heQlo5DiWZSqCHs3jOVKFL9KRruPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5789.namprd11.prod.outlook.com (2603:10b6:a03:424::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Wed, 24 Jan
 2024 18:25:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 18:25:18 +0000
Date: Wed, 24 Jan 2024 12:25:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Group live kunit tests
Message-ID: <abekcs6dyndgoszoykktclo57rmdi2xynbdcyuc7hvxz3dxyvq@k7pojyhdqavb>
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
 <20231122203147.988021-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231122203147.988021-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: ae313c41-594a-494b-f6ff-08dc1d09d106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zH1ur45ySDlNUCsgYbbUtbb4vYA0pDODFvY028X3MecXoahOHVVD7iXqrNb+hf3jUvH9nSefgZhfPUtNwfN/18uyl3zxbI3BCqVsqXK1OolMZEN02rJ9tMebJPWfJIA5E69nctja14rWBT4gbBTQ1NVgc4iaoGs/Yp9oQyvDsMiqP3bueeAA5vpzHKkRJ9ApwSoPD3Uclf5BgUvO+/kbCurqaVDDbpzXxfWfsSYrgAyiysFmu3NxUcFoudtE6miTEx72uy8YtfdCl6x518v3qzUFSw/6AktwbP+jMSFHFTkjITdBkHiLDB+SSVoYeSeuRS5EQa8Y1hzdPwZB9HjSQbNGlCROi3lr3SzAFrCZ8eri5dPZ6K0e4TbtvUSQ+hycogSPckYg9oJAx9lJhUX5T8YuZA8Q7r1QKH+ny4dme5T8Iqv25zb6TzbWTnxgqla3zFB85ieWaHPb2BTuWBUlZmZJJOIaCoRiYRsJ1BlDETOwLKEscxR/xvZVS63p/RnedJH6x4/R1l24mh/6XSY6oBXu8VgAvIyhmfArg+H346WwA9R8MKKOtsP8UgXWXdYEKLqDaglcolhQN5WbyZI9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(6916009)(66476007)(41300700001)(66556008)(316002)(66946007)(8936002)(8676002)(33716001)(478600001)(6506007)(966005)(6486002)(82960400001)(2906002)(4744005)(9686003)(6512007)(86362001)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zJhWbEQqe4QVhZmbdC/pa5rI4AtN1mOwuR6Q/iuvc4/PYk8HS/JMyUN5I797?=
 =?us-ascii?Q?er8RsXSCJsVkIYaruXNvoh6O74XvsIzNVqCc4dwzk3grFMRWqXOZf1Lb9QSg?=
 =?us-ascii?Q?lULt6sqWURNLofHvJ4sdLvvYiZBvSyXNQBjdCjYIXo1Z3/kwKZsmeNELU/CA?=
 =?us-ascii?Q?Yh5sLGhsTq9aMRPWdzsIDTm597Lk9tjxSN/Q6sr/mQuCkktNpGrSZ/mD0ea3?=
 =?us-ascii?Q?r+zV/ihztDwUB7TcFW6Q7sLgVQQqpVgMi1xYCJPs57rSSKeBRjqoj76295z5?=
 =?us-ascii?Q?ID20+0qauw7UNXt9pghEiRIypYJNGJOo+K0pVHfiqnTe7Nd9VZIYrCTOYaX5?=
 =?us-ascii?Q?UH1xIzOLNTgETLlHFaD8ltZhx7mj7DyyNGucwVvuyzSCd95cHPBBbnV5NS+G?=
 =?us-ascii?Q?AmmDxC/oOZe8PgmpAibL1vuDSCZcqLn/LxOtrj2pHwnzWQvgGkF0418PJQoV?=
 =?us-ascii?Q?FRAOtcAsYtczqVi2VjwdCEysussMmhSp9jGI/oJnKFo7njzcpLm0zhVQjs4D?=
 =?us-ascii?Q?Hk2wqOKTA0qetbVpTBJG9FCLqkdApDrdCGfIB46Tbq14pOICFyY1bJzQJP40?=
 =?us-ascii?Q?jFKdBJVk7aurnlaG2SLrEo/zgCvaXHUoxvL6ryKvKu4X68lQy+O+hARINGSd?=
 =?us-ascii?Q?t8tX3DVpcd/oXYSRBgxsgqrVKyqiufAUXkRsRdVTAoPFWI8Rf3WJio36Q2lN?=
 =?us-ascii?Q?MhzjEvXOcrA7zgiVunnDq1jmsYX1Zl/nB2S/o3RumzzXe9vzmxbEze36PowF?=
 =?us-ascii?Q?Xt6z4qvNxbbeMmvCW1H8fZw8HNliD8t2VoGMd7VT19x9uau56VpIR70P07LP?=
 =?us-ascii?Q?ohY7XDYZkzcA0jSp7KUFO6xhiRceQqDhqC2q3LLc4f6bWGvACbuh2FdcbClI?=
 =?us-ascii?Q?ZHw7fVmpkyE7T1MXrxvpgknw2VLbuPhFyITAJr7EED7t6cT4JY1ReW91JWNe?=
 =?us-ascii?Q?e34OF6k/UA2olS9YYr2MCk54dJ3M1g/Hw7iX8vgDZ+deE6qtt/bE09op8i4D?=
 =?us-ascii?Q?1b9uOI4LWMJjCe+OGL48Iit9GZad5VWYx75pQxcylxVN5j4wLZdwHFwh/05O?=
 =?us-ascii?Q?BAhww/B9g4KVYF5HhyVvwatttGAIyNEnOUxwIWAF+RxJkwGdWMwk0Cr1Q0aw?=
 =?us-ascii?Q?0dQYPxAjWtSjBbPdwxO8DrHR/eOP46fq439+3AeO5x7obyN86g65/jXQjDOs?=
 =?us-ascii?Q?Obc9BxvzxWMKNBbhArwOCkz3GOMCNZsERoKhS3b9Woh7Do0m/gXaJb4fsgFA?=
 =?us-ascii?Q?Jgk5BeLDRpfCdaQIIadpFivfz+6aInDilGSPG3z2t/svbqhpsVikA3eLUCF/?=
 =?us-ascii?Q?KAazrLprAMNTkDMW/IJHOvNO8kCRuO0d9KoPkB9/pvPW5meCVaq2KTltjClv?=
 =?us-ascii?Q?TJGyS5XDwAnxyr3/JrLZzuH6PCs4kDDjnU+C/Vc7VhavKHCd0S4ly7c9Hwz8?=
 =?us-ascii?Q?bPfTkyGiQXnaziin+a+smePx1iyydFSN1yQMzaAeKhLCUoJKz8WgkWAuxtr/?=
 =?us-ascii?Q?3nAK2vw8s5XfZGYpC8CPRIHgMIdONr30j0YN2Ej/7gBkVpXSpCfc3HHMpRBn?=
 =?us-ascii?Q?cBRq7urA0FGfjrIKsMwMjLwB0CNhaxs/UrABmWZb1+zBlHMGUq2itfy7DxB3?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae313c41-594a-494b-f6ff-08dc1d09d106
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 18:25:17.9785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nRw1WySwXU8FQYvVSzSEWi32cREmSQ1gTgqWlVuQk0oyfuruKOlbhmy5z9sxhxEBBR/pGds878Lkzesf5h3IdXJoutckPgYF74UagkKuJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5789
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

On Wed, Nov 22, 2023 at 12:31:47PM -0800, Lucas De Marchi wrote:
>As was done for the normal kunit tests, group the live tests into a
>single module, xe_live_tests.ko.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

To make sure we are able to continue testing in CI,
this patch depends on additional kunit patch:
https://lore.kernel.org/intel-xe/20240122171408.3328510-1-lucas.demarchi@intel.com/

and the the igt side:
https://lore.kernel.org/igt-dev/20231205224926.2188996-1-lucas.demarchi@intel.com/
+ changes to make use of the rw param.


I will follow up with new patches.

Lucas De Marchi
