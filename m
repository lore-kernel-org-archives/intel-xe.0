Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23597C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3266010E2F9;
	Thu, 14 Dec 2023 22:10:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A34310E2F9
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702591832; x=1734127832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=flUaNazSVDCCSQSJYQvaD0NMkvIPT4kwGBmcVWf8MDI=;
 b=ZKN37XQ/yE1K7pkTO32g9CGw2ge6Zecxs1PSZhHM+8fDpzIPWMT678W7
 Nvb7ho1e8XhMxGGTc3pCC8TXX3K7kEKdg2tu7hhIqe3oS4BZLv0PIq2gq
 /i7aIWK/+6fO0WM0GByEsKss9DsPtp15oASNEhSKVl66JLKeyzx/fDBFm
 IYbFt6pcf7YzPdJbO+k3kNRuyMMP23OodHUSiXY5bRJs7QaDXJa3+4oOw
 AwKUe5/N5RJbgaC5/OKfX4nmTVppd9InWdJZZXZWESOB69G7s5IfaMXFy
 zAlm+XNoZL14hmF2c+Rpyn9aJGV5g1ixT3iBb7Hazjjv1K+1AxmVCTheW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392369132"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="392369132"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:10:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918203339"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="918203339"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:10:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:10:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:10:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:10:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrFxlv3UPFUbZYe2LnxbLKKyNTG24bTqpt8jlVkDagRbaE5gzb8dSfcnEteBj5UMhwSo0FaJcI/sW3rLWrsMv7yqmluXiBA7cXIYpLc4DcgT3DAgE7O8zsK1PqxCv4QZs/2luK/JHPnhNmEwL88GZctbyqwLHCOvSlMWA4Jx722ofbpnBt+nMUxVKdUxFJJFmPc7x80AIELCgxiHHRGof1tT5EXLDEeifZT0lF+UY5094OYN3F4jut+j5wRseWmK907u9YVdg/vkV+6BQG5JpQlRLg88Gf40mNQOF+92y2Llm05Z0/TKL/4UhDLOF9xlqC99zSltCv6klVsf/tO3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flUaNazSVDCCSQSJYQvaD0NMkvIPT4kwGBmcVWf8MDI=;
 b=If3rZnfcgQpriKG6mSWxpKcgcISrHDbCVjrla4z1Lsx+INNFCL6j9KoFC9copNWMc7D+vnjGQviZgAUrC5Jj2Y4wTcNXyn+EvnHiqGpRRJQhkT+q76d69COWy/k9Vqww7s1fYBltSXPGQvu6kpApWsoNk5DgP9wCf59bNbx79wezw5B0I6aDNTPuxE03kVtKP1hP0HK6oXko/+Df+s5ELN8pJmNmrFebYgqbc25UpE71XdQ2tkyLHQaXX897lYs1AYkUa6Fhoe3pHS0csp4Hdv/54TLvCel/pHAXBVVcZkDrCa0e07tNTbCnPM8cP63t8CF/b2F0tx4yJnJaW8Y02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5347.namprd11.prod.outlook.com (2603:10b6:610:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:10:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:10:28 +0000
Date: Thu, 14 Dec 2023 16:10:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 6/8] drm/xe: Define interrupt vector bits with the
 interrupt registers
Message-ID: <htmdwirmjy7cidpaunyrpwcd5bec7mehgd2raa7peaedp3s7iu@z7y3er2f652p>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-16-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-16-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1a772e-e738-48ff-9cb5-08dbfcf17afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p7FKNr7JlVK6qiMMDBg4+lDgg5zHG/PQag+ROoHq9P5Nv9CRtqyRkAc71Pmbb0r2r/WZIOUTFAqu9/5CXEkXr/i5IF3Chp/zenjLtYP2PhfhJLl0loIfcJ1mUrOo3d6rhsF2LaAUtCFyO3IrsSNRt61Ln2QaJWmJK52XmmzcZjdgeTxJ0RtRYe9DZr3Vpi22FH+DApnXea+2joM80M4BryJuxLuzLL/Oeu8FiWlFfiWxjgbv/ZK/ucTjcBMZwbrHBKg34VlfZPIahXYzwwCEtvYgnh8OnGeMgPps+2OF6U24rvRvQpYhYYNXworEEHlP/YHalHK7U9gJVjWmkSFseQ/R8W23mhr/DegcZRip++4Xr9k5SWF6bOZwm4Efkvo5SQfc+BsrUK65DdWmv8/2/EtV4SZOmj0R+HsGf/zvyNlORBE9f6sIWUeQyx/D4kEC/MaBJRpqgpGdMmLNugSgKrHK52uRk35CRw+jPG/yogROR3caxW4txK7Lj772/XmCRHD0W8Z7tCD44ua75e7iWnYLP0FJISIF2Zz5fZUUTqVvAD0VVzewnl+jqsm++bao
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(82960400001)(41300700001)(6666004)(66556008)(478600001)(6506007)(66946007)(6636002)(66476007)(26005)(9686003)(6512007)(38100700002)(33716001)(5660300002)(2906002)(4744005)(316002)(6486002)(8936002)(8676002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFcTxPAvOKQShKLIX0JUSZXvcN02Xu+A3dIYn/QcNilbfeRZjx5r1zYuBrWv?=
 =?us-ascii?Q?67OYchLn+vCn+L4naSxMKz714p+tZ1bHsPuQRd3ImpHXfVg+LUspNfwUSif5?=
 =?us-ascii?Q?zYdJ9vQtqzS98mVaH+b1sntKQ0QD7XbEgIY+65/nUPJ5ERsi7RmtxAs2tVwS?=
 =?us-ascii?Q?isVSPgHQJ4czAHwaPym48yXJ4VuDPhsY7bMzwF9lt9USDrbHynsWZlX9EwYE?=
 =?us-ascii?Q?wzyYGqV9k3ZqPIj/vm234878fmThsGGg1C2E935ltHq1Z9G2pOJjmZ3FyO2p?=
 =?us-ascii?Q?wQtoUVATFyHRbhdwCFA2bjpYqEzpVppNaUTZvh/QBMm8HYaJD4AlLmrP1NrK?=
 =?us-ascii?Q?30ckVQSkUctH3iiS/UzeRqxGXlcEVYfOqNmYArzf6rJ2PLHuvg8SBTMYCJBl?=
 =?us-ascii?Q?8LsKbYC0M7MeA4zjAHS7CFVa1d5V4E1XZRgljWlgjytfxBNznFwziPubz15G?=
 =?us-ascii?Q?WmS1wN5SsDydqLkxtFsa2QQz/lsA2IH/xEB3p25thla0jCrcBrIRalzMkvQ0?=
 =?us-ascii?Q?OM0CTx9w1nZiR2EF5P2/XD2of11HGXKz6gVALDXTD1z41eouoy+sWxpI1v9d?=
 =?us-ascii?Q?Re4uWXoDv1jFFKwqFt/x5OG3fEPtTtgNA3oVPqVJ0UMz+IoNdPDFHDb8j1bi?=
 =?us-ascii?Q?D33YQ1dDUhy+MLxfXzRn9cIh4U+A0UmVqYOPg7J+XUJ4YTmXJtc5gepF8z5U?=
 =?us-ascii?Q?ewtBKjEmrsL0bBA2/giJci1q8rB9Vku+QJDQGKdFZd7eVhGl/ZUY5VUZuEpg?=
 =?us-ascii?Q?U/jc/AFqX+75ySz5yaPSE8HAwAMomoZPIBYofZ7Vrmudj1BImnBhCFiszi2g?=
 =?us-ascii?Q?KUR3e1SusF/lJgN8HZUgHj39xb6MA7aYmfPNPzDyq2iXf66yWmGcdYYmBD5i?=
 =?us-ascii?Q?Q+fDmplsbYeMLKbatCTrDYBruyK3lXcoOs8CwttOvshFM9n/944diai62UUJ?=
 =?us-ascii?Q?U18Cq6aNHEo0pj5uoJcnw94WdFK8HwzKAxSPl1f6C/HT+jmK8ql1kONb9l1Y?=
 =?us-ascii?Q?HmIDYpaLxKJKzt6fu2S/qABbxd2Q4f3hKz3ZB6LL+WBq25PJfwzNzeRYyWLI?=
 =?us-ascii?Q?DuzFUgJe5gGp9B5ko/CeATZ2bXOpTqVGKLuEgJNZ/VbnChcvfyvTdPXxr1A4?=
 =?us-ascii?Q?sWfNtCniv+D4rS0hb43OChClL5tXY+zz5SEcrSMQx5w4nYieRPvj9/SJTbWG?=
 =?us-ascii?Q?YlvL6b8WdIeWJVIUDJDZPJbu197Ms3FV/Jay76hEDV/kfq+cGI0mkFH1qCD4?=
 =?us-ascii?Q?47Vax9Vj0xxKgorneWqooD77g1ERWx1kf054dW0LzPOdU9vEz/804+aCdVsH?=
 =?us-ascii?Q?P90w5Oy06Y2tJkpSWG324Q+2U8u6LPSc459qI1UuKp6NLwzoPEQKY2t4HU12?=
 =?us-ascii?Q?VMzEvHfOSQug+7T+DFKiF5WCZMUl/vdxg7F2qFbbWOuBtn1arie67M0kL//Z?=
 =?us-ascii?Q?Gh3bFlY8gMzZNKwHqqR/yhuc8I42aivFxr77Swsgqv7Ac4FOBkqyBcb8RnQX?=
 =?us-ascii?Q?9bMd9HYa2xHy3PtCUindNpjFUwFdFszq2mgXu63ZB1vMDYCpfLy403fuTngQ?=
 =?us-ascii?Q?JnGdxah4128o/O7Wy2CUXct2RTPykUa7hrWwJFZ52LOT3vID0tbKcCrZkWUy?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1a772e-e738-48ff-9cb5-08dbfcf17afe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:10:28.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLnnhU/kMYb8096ksV9pUinpT4WRKXtZNjkZ97geAHHRiLpYZv9StviBF1vSlvjQibdOU38wt7zy+9Srm/bYYXDn65oIPuXKoOzk0vedimY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5347
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

On Thu, Dec 14, 2023 at 10:47:06AM -0800, Matt Roper wrote:
>The bit definitions had become a bit orphaned; move them to the same
>location as the interrupt registers that they're used with.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


ok, you can disregard my comment on a previous patch.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
