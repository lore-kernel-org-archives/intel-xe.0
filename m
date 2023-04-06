Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856DFC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547BE10ED2E;
	Thu,  6 Apr 2023 20:53:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F12310ED2E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680814400; x=1712350400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SLrZmBicsNMjO+NWLsrDpWTLJwxwynkc82Y5vKbVPCQ=;
 b=oHor1pFTfcKsq2pKAHbluS1X23Aj3GiFygDLdn54+tDEbwS/wRXVMZJA
 t8O+eJ76WCTzrvFralw2u9IcmKdyyBA8BQYzwBD3oGOuoWdT8WcBq3UTe
 MwyQI6sPMXvk7Wf/MmA5ojWql7vyvRu8KvpHYI7GcgADCkNIJV0+nwXFs
 6WLh9R7WbjNhfwkGFhB1Cv6wqIomyqidsdp9tIp1fp1iKz39nTUCF5sw9
 6ni4A9DOra1p4Z2tV4o5P4J47Aueaetf6tUjU8ULLo1sCiCXoJYxLvY6E
 apiSwOW8p/CX/g7+vDmzPRX2IPT0OsDRevkzhvlQk3c0c++mGameAtrUu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340330644"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="340330644"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776612965"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776612965"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 13:53:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 13:53:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 13:53:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 13:53:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 13:53:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSGGsBwCMBBvo9V9fNTmVyrhL0LF7aVwyEc3fNbsN0TsXSFA96cEZv53FfDSu433ASWPnj83XGPytAW/McN+tsPWk8aS0EavpKV9DIQwvAV7gKane957yTUuuPV6iIZrm2I/pj7+zeYhtnfC1aouNml+WTKaQMtap3d/seM73LThkBp3v9VQeGqlGjE7moLmMCKABekoZYLTXjthPdlloBPZ1Y/woOcV7CqrRg9x6SXNcc2QO6bRfDeB0kOn1+VCIoYk0+5DuYyTPTV9bH9iOuAMbtxx3hGvJWxezUbyL76nDNz7jDwRg2e/8bgWJcaItD/V3dJUHPyx9wA4+n1pAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLrZmBicsNMjO+NWLsrDpWTLJwxwynkc82Y5vKbVPCQ=;
 b=VRs39vm9yidzJSijwwww8S8JUsO2kW11rviEVKsqz5XBlDe8n50vhGsvUwujib/eFJ5D0HmZ74btPzR0Koivk3fyYq10TlCraCVxVzOUGpton7RVB4GyEPXj9DEWHdRVNPpRqu5zFcowykHdfN9kt6ht64O3n0lsok1bZ3HHkmAfFdGnlko59/aGaEmkosJES9HxvMJQbgYpMOzHfXE+zENU0jaNTjA/qHaqMfjj7aorUlyb6DcI7IbALK5DVbGcHOPIl0HCwDAjXfoD8BUZzMpGH+ESStVfRXvt7WFxEaL+lsfKBKVPd5PEUR1SIEht+XM1P4B5rt0cSzVdo4aLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 20:53:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 20:53:16 +0000
Date: Thu, 6 Apr 2023 13:53:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <20230406205314.lmwqpsh3jphxn3we@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230406204745.272945-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406204745.272945-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b384820-6658-43ad-5cb0-08db36e0f1f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bN0qG+85HlcvZurEkQglCHgQ13O/RgyskixhYwPVBK4ohCX//gjhmfQSKaN0R8LApPGlo5VsVOQojSLw3PtjlegiC57h3SH7++lVEburboUUr493KE+K7buqVbtMhzwilsAoMZHqbUm31YQdnR5qKfewcPFWrCRj8RV+pdHfbq1WdJqyaSjbGt2CjV+GH0THfMLaw6gQ7QRZSCOcGWpXh/7zW5ykQYwmMMU/NDJS28zV2s6tNlAGaKwr0rwrdZ+GV8fB4P1D8EStAqnNeeWeNKVrpFqRb+D5HGa4s70l6V83vILhFoDt3uji1K6ncOWx6Aoscq+ih+at3SUw+q5h04MZI+rZ6qsHwROd8SlOI8MVPo1Xm0+t0FoZIdX+VJDIVBvtWSWLJux1sAmhqZ2YAkboPxmJKw6k202Qi3nxvgQFWllnWvKGgmYZVUyxQXrZrEuSCHZeA+SYXHvBXf47b51AHL2j8lBxSsC5Hdn5wK0YvUw19aVuvTjCm6YHy/FECkAST+m+jk3YHg6qongMG3WuC0a7T/EYTmvmP94cYj5j0kJ56IkSl/ILGrAghx6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(38100700002)(6862004)(186003)(8936002)(2906002)(5660300002)(6636002)(4744005)(26005)(1076003)(82960400001)(9686003)(6506007)(6512007)(4326008)(107886003)(8676002)(66476007)(66556008)(41300700001)(66946007)(86362001)(316002)(6486002)(478600001)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9HN6OZiSSgXWjuX7I7ri/A8aQqTLe507AfngLSdNvPXMbyoLvfKsaWR++i/v?=
 =?us-ascii?Q?IWCAL+ExRuGBgzOOgl4qgnbrJIAG+lMmB5xK1l1CuhsxPkXksLDRDlbSRzMs?=
 =?us-ascii?Q?GrXDkdJgPQeIWeeyulfmmxMuRZ2BJ3viu/Md0gEj6xXzsmI4vJuyHh4dQvyR?=
 =?us-ascii?Q?dZRt0z33JPB6xFVeBSrSYRlwR5B0R00nKjeFqtyYBUwEB9bH/BReeMGPiSFd?=
 =?us-ascii?Q?PzZ5LlzoeuNbsIL6axJjaDauPYuhe+3WLXwQMM0MEvrmM3OiBda+T4jB4W6p?=
 =?us-ascii?Q?olFYjRHHpynSX4ePexzNFAksuBOORnOXyruVGrHoUO+mtWXUxP/JQziGGEk1?=
 =?us-ascii?Q?bUaK6svgYa822M57d+ezImI6r+eVtD6l3kILV1nrXGx+inCjEq46heBzOUqV?=
 =?us-ascii?Q?XBznUl7tdnunmlgV3HJ8du+DCI8eZk67hnowew3tHJSTEk/fdzOz5tw6KpL9?=
 =?us-ascii?Q?twkuIsbarXx6Jwv1fzYfrG5nVce/CQNILTLt4bpGcQdY+lLZniuzmY6c+F4S?=
 =?us-ascii?Q?oKdwqd6XsLsxlRUNtRY8kOpIc95EYoKrWWjWUSUDSJwIkGlGNHvl4SuGTH4N?=
 =?us-ascii?Q?R3Mv28waU71YAGGq4Jilgt578kDyGTLRIbJYws7M692oy6B5kZMbllQBGNcW?=
 =?us-ascii?Q?pMghC6LVKhLFQvw/h05DPiKNC9FABVyg9OEQcNgUHw4qFNLVBvRwqfEYYfMR?=
 =?us-ascii?Q?8lQrrDrWK8a57dq/A3bkXDLt7M7iL7Y0BTj1BhKdUCW9TcIyIhsNmutewX1o?=
 =?us-ascii?Q?3vZEvm79F4DCuV0gTgR+pZfTX5I5leeUKnWDFbuqTvKzgTd4fRBhs0LbCXn9?=
 =?us-ascii?Q?96Ixa1gZfAZ0pY/vPe4g53uc0q1uQdQsvk/88Jg0ZXWngUbpk4y8zokG5S5j?=
 =?us-ascii?Q?BsidMU+EtGGT7ahWCl7W5gD7AMCBIc+zN0ywCN25sHM0z23bHIBR5mruRiu5?=
 =?us-ascii?Q?NLYlRK99n/1BvCe5ItgGbvvURFwN2nsCV4eYcoPv9NqhkGvrz5dozALvr+7t?=
 =?us-ascii?Q?wVTU+Bit+SjTxCyUTq50+EQPg8HOD74pcUIAxkMCTho9bIfJKvGBtMcY9DkD?=
 =?us-ascii?Q?lwjQ1sncbIAHWybMuQWvm1yz3GY06dI4mTzWMo/yOuGoYbQsoeHh9INboRyg?=
 =?us-ascii?Q?D8L0pIigs9Gozuh+AY9YECeaK82Rant3KK/W57ZhMRCZ7y28yQygfDlILUf5?=
 =?us-ascii?Q?4WIq+KjH5Vpz5mQxsfcPAJgGiLu+8FK1uuI7K3reLg1DEbl6aXNIoBjtUhYe?=
 =?us-ascii?Q?6YGm8jHa3Eh661tmgIp/Mi1j20V8UV/JNz1na7BxLSJtpKDP6+2/cz8tXMQQ?=
 =?us-ascii?Q?Ll7PcZ2NJQ4mG/IBsrdCdoOb7vi4ZeaIAlrGyCkw2BrEbfEQ8eaTUGHZWuJC?=
 =?us-ascii?Q?qYh6oRpAF8zB9EaoEi0pMGU7JbybvyPUK7nWLHsFEceR1pqQpwozRu5qXmzr?=
 =?us-ascii?Q?bRbTk5Z5BXnBa744CqN2eKkMZ5q9Zg8NO6v+ODgAKw54YeG4+RvSwfstjMRw?=
 =?us-ascii?Q?/lldL2A4bz7Zei32BA/oJjg40w9hTsXz3KVBm8cqrCQE0iIvSGRYpwr4lGjC?=
 =?us-ascii?Q?ckT4SRFWEiXhr8fREgkLTssildp8yHdxDzeJXeLnA0/GIsTsRzNAxccAm9rL?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b384820-6658-43ad-5cb0-08db36e0f1f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 20:53:16.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhwTc9LA2pTPFfz+XpLIXbDVRispuSDg5tGlOFykI9PmAxZAb9rYw1fhWB8i0gYOg+PlfCbIdpUkd/lcy3c9DczsqC1K70tMlGJUCPBdnQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: fix pvc unload issue
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 08:47:45PM +0000, Chang, Bruce wrote:
>fixed include file orders
>added last empty line
>fixed copyright year
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
